
# load NVM etc.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# add some more stuff to path 
export PATH=$PATH:$HOME/go/bin
# export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/starship.toml"

source $(brew --prefix)/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# eval "$(starship init zsh)"
alias ls="eza --icons=always --hyperlink"
alias vim=nvim
alias cat="bat"


alias gt="git"
alias ga="git add -p ."
alias gs="git status -s"
alias gc="git commit -m"
alias glog="git log --oneline --graph --all"
alias gsync="git fetch --all --prune && git pull --rebase"

setopt EXTENDED_GLOB INTERACTIVE_COMMENTS

# Source tools etc. Stored elsewhere. Inspired by https://github.com/mattmc3's zsh config
for _rc in $ZDOTDIR/conf.d/*.zsh; do
  # ignore files that begin with ~
  [[ "${_rc:t}" != '~'* ]] || continue
  source "$_rc"
done
unset _rc

#source zsyles
if [[ -f "$ZDOTDIR/.zstyles" ]]; then
    source "$ZDOTDIR/.zstyles"
fi
