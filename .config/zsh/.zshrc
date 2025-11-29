
# load NVM etc.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# add some more stuff to path 
export PATH=$PATH:$HOME/go/bin

eval "$(starship init zsh)"
alias ls="eza --icons=always --hyperlink"
alias vim=nvim

setopt EXTENDED_GLOB INTERACTIVE_COMMENTS

# Source tools etc. Stored elsewhere. Inspired by https://github.com/mattmc3's zsh config
for _rc in $ZDOTDIR/conf.d/*.zsh; do
  # ignore files that begin with ~
  [[ "${_rc:t}" != '~'* ]] || continue
  source "$_rc"
done
unset _rc

if [[ -f "$ZDOTDIR/.zstyles" ]]; then
    echo ".zstyles found. sourcing..."
    source "$ZDOTDIR/.zstyles"
fi
set +x
