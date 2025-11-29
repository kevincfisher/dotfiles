export EDITOR="nvim"
export VISUAL="nvim"
export TERM="xterm-256color"
export TERMINAL="kitty"
export MUSPLAYER="rmpc"
export BROWSER="zen"
export BROWSER2="chrome"

export PATH="$XDG_CONFIG_HOME/scripts:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

# History
HISTFILE="$XDG_CACHE_HOME/zsh/.zhistory"
HISTSIZE=10000
SAVEHIST=10000

setopt share_history
setopt append_history
setopt inc_append_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

