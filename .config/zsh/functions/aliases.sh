# @description Shell aliases for common commands, git, and kitty sessions
# @category utility
# @depends eza, bat, nvim, kitty

alias ll="ls -lh"
alias lla="ls -alh"

alias history="history -30"

alias ls="eza --icons=always --hyperlink"
alias vim=nvim
alias cat="bat"

alias k='kubectl'
alias kx='kubectx'
# alias ks='kubeswap'
alias ks='kubens'
alias kga='kubectl get all'
alias kgp='kubectl get pods'
alias kgpa='kubectl get pods --all-namespaces'
alias kgpo='kubectl get pods -o wide'

