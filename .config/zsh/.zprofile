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
SAVEHIST=20000

if [[ ! -f "$HISTFILE" ]]; then
  touch $HISTFILE
    chmod 600 $HISTFILE
fi

setopt appendhistory
setopt extendedhistory
setopt sharehistory
setopt incappendhistory
setopt histexpiredupsfirst
setopt histignoredups
setopt histignorespace
setopt histverify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward


# >>> coursier install directory >>>
export PATH="$PATH:/Users/kevin.fisher/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<
