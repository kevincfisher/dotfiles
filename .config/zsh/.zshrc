export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

_brew_prefix=$(brew --prefix)
source "$_brew_prefix/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
source "$_brew_prefix/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
unset _brew_prefix

alias mygit="~/git/codecrafters-git-rust/your_program.sh"

setopt EXTENDED_GLOB INTERACTIVE_COMMENTS

# zmod — modular config loader with enable/disable support
source "$ZDOTDIR/bin/zmod"

# Source tools, aliases, and helpers. Inspired by https://github.com/mattmc3's zsh config
for _rc in $ZDOTDIR/{conf.d,functions}/*.{zsh,sh}(N); do
  [[ "${_rc:t}" != '~'* ]] || continue
  _zmod_is_disabled "${_rc:t:r}" && continue
  source "$_rc"
done
unset _rc

# Source workspace-specific config (not tracked in source control)
for _rc in $ZDOTDIR/workspace.d/*.zsh(N); do
  source "$_rc"
done
unset _rc

if [[ -f "$ZDOTDIR/.zstyles" ]]; then
  source "$ZDOTDIR/.zstyles"
fi

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

if command -v nvim &>/dev/null; then
  export MANPAGER="nvim +Man!"
  export MANWIDTH=999
fi

eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/config.json)"

. "$HOME/.local/share/../bin/env"
