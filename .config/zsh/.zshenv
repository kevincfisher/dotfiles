export ZDOTDIR=${ZDOTDIR:-$HOME/.config/zsh}

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}

# typeset -U keeps path unique — no duplicates when shells nest
typeset -U path
path=($HOME/.local/bin $ZDOTDIR/bin $HOME/go/bin $path)

[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"
