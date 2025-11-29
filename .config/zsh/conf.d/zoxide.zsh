
# from https://github.com/mattmc3/zdotdir/ 
# detect, init or load cached zoxide init
if ! (( $+commands[zoxide] )); then
  echo "zoxide not found" >&2
  return 1
fi

if (( $+functions[cached-eval] )); then
  cached-eval 'zoxide-init-zsh' zoxide init zsh
else
  source <(zoxide init zsh)
fi

alias cd="z"
