# @description Shell aliases for common commands, git, and kitty sessions
# @category utility
# @depends eza, bat, nvim, kitty

alias ls="eza --icons=always --hyperlink"
alias vim=nvim
alias cat="bat"

alias gt="git"
alias ga="git add -p ."
alias gs="git status -s"
alias gc="git commit -m"
alias glog="git log --oneline --graph --all"
alias gsync="git fetch --all --prune && git pull --rebase"

