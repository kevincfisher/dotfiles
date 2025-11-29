
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
