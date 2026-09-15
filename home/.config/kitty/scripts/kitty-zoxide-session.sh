#!/usr/bin/env bash

#  Filename: ~/git/dotfiles/.config/kitty/scripts/kitty-zoxide-session.sh
#  Select a zoxide entry and switch to an existing kitty session
#  or create it if it doesn't exist.
#
#  Also supports SSH host entries from ~/.ssh/config (and Include files).
#  SSH entries are shown with a "ssh-" prefix to make them easy to filter
#  and are treated as SSH targets (not zoxide directories).

set -euo pipefail

kitty_bin="/Applications/kitty.app/Contents/MacOS/kitty"
script_path="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)/$(basename -- "${BASH_SOURCE[0]}")"
work_env_file=
colorscheme_file=""
fzf_colors_file=""

require_cmd() {
  local cmd="$1"
  local install_hint="$2"
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "$cmd is not installed or not in PATH."
    echo "$install_hint"
    exit 1
  fi
}

require_cmd fzf "Install (brew): brew install fzf"
require_cmd jq "Install (brew): brew install jq",
require_cmd zoxide "Install (brew): brew install zoxide"

if [[ ! -x "$kitty_bin" ]]; then
  echo "kitty binary not found at: $kitty_bin"
  exit 1
fi

sock="$($HOME/git/dotfiles/scripts/macOS/misc/kitty_socket.sh || true)"
if [[ -z "${sock:-}" ]]; then
  echo "No kitty sockets found in /tmp (kitty not running or remote control not available)."
  exit 1
fi

normalize_path() {
  local p="$1"
  if command -v realpath >/dev/null 2>&1; then
    realpath "$p"
    return 0
  fi

  if command -v python3 >/dev/null 2>&1; then
    python3 - "$p" <<'PY'
    import os
    import sys
    print(os.path.realpath(sys.argv[1]))
    'PY'
    return 0
  fi

  if command -v python >/dev/null 2>&1; then
    python - "$p" <<'PY'
    import os
    import sys
    print(os.path.realpath(sys.argv[1]))
    PY
    return 0
  fi

  printf "%s" "$p"
}

hash_path() {
  local p="$1"
  if command -v shasum >/dev/null 2>&1; then
    printf "%s" "$p" | shasum -a 256 | awk '{print $1}'
    return 0
  fi

  if command -v md5 >/dev/null 2>&1; then
    printf "%s" "$p" | md5
    return 0
  fi

  if command -v python3 >/dev/null 2>&1; then
    python3 - "$p" <<'PY'
    import hashlib
    import sys
    print(hashlib.sha256(sys.argv[1].encode("utf-8")).hexdigest())
    PY
    return 0
  fi

  if command -v python >/dev/null 2>&1; then
    python - "$p" <<'PY'
    import hashlib
    import sys
    print(hashlib.sha256(sys.argv[1].encode("utf-8")).hexdigest())
    PY
    return 0
  fi
}

session_exists() {
  local name="$1"
  "$kitty_bin" @ --to "unix:${sock}" ls >/dev/null | jq -e --arg name "$name" '
    any(.[]?.tabs[]?.windows[]?; .session_name == $name)
  ' >/dev/null
}

bump_zoxide_score() {
  local path="$1"
  zoxide add -- "$path" >/dev/null 2>&1 || true
}

find_session_by_path() {
  local target="$1"
  local name=""
  local pwd=""
  local real=""

  while IFS=$'\t' read -r name pwd; do
    [[ -z "$name" || -z "$pwd" ]] && continue
    [[ ! -d "$pwd" ]] && continue
    real="$(normalize_path "$pwd")"
    if [[ "$real" == "$target" ]]; then
      printf "%s" "$name"
      return 0
    fi
  done < <(
    "$kitty_bin" @ --to "unix:${sock}" ls 2>/dev/null | jq -r '
      .[]?.tabs[]?.windows[]?
      | select(.session_name != null and .session_name != "")
      | [(.session_name|tostring), (.env.PWD // .cwd // "")]
      | @tsv
    '
  )

  return 1
}

print_menu_lines() {
  local query-"${1:-}"
  zoxide query -l 2>/dev/null | awk -v OFS='\t' 
}
