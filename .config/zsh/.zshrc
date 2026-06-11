# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

alias gt="git"
alias ga="git add -p ."
alias gs="git status -s"
alias gc="git commit -m"
alias glog="git log --oneline --graph --all"
alias gsync="git fetch --all --prune && git pull --rebase"

setopt EXTENDED_GLOB INTERACTIVE_COMMENTS

source ~/powerlevel10k/powerlevel10k.zsh-theme

# zmod — modular config loader with enable/disable support
source "$ZDOTDIR/bin/zmod"

# Source tools, aliases, and helpers. Inspired by https://github.com/mattmc3's zsh config
for _rc in $ZDOTDIR/{conf.d,functions}/*.zsh(N); do
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

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# bun completions
[ -s "/Users/kevin/.bun/_bun" ] && source "/Users/kevin/.bun/_bun"

# pnpm
export PNPM_HOME="/Users/kevin/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
