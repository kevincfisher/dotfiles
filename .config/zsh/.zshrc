# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export BUN_INSTALL="$HOME/.bun" 
export PATH="$BUN_INSTALL/bin:$PATH"

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

setopt EXTENDED_GLOB INTERACTIVE_COMMENTS

source ~/powerlevel10k/powerlevel10k.zsh-theme

# zmod — modular config loader with enable/disable support
source "$ZDOTDIR/bin/zmod"

# Source tools etc. Stored elsewhere. Inspired by https://github.com/mattmc3's zsh config
for _rc in $ZDOTDIR/conf.d/*.zsh(N); do
  [[ "${_rc:t}" != '~'* ]] || continue
  _zmod_is_disabled "${_rc:t:r}" && continue
  source "$_rc"
done
unset _rc

#Source misc. functions
for _f in $ZDOTDIR/functions/*.zsh(N); do
  [[ "${_f:t}" != '~'* ]] || continue
  _zmod_is_disabled "${_f:t:r}" && continue
  source "$_f"
done
unset _f

for _pf in $ZDOTDIR/_functions/*.zsh(N); do
  [[ "${_pf:t}" != "~"* ]] || continue
  _zmod_is_disabled "${_pf:t:r}" && continue
  source "$_pf"
done
unset _pf
#source zsyles
if [[ -f "$ZDOTDIR/.zstyles" ]]; then
    source "$ZDOTDIR/.zstyles"
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
export PATH="$HOME/.local/bin:$PATH"

# bun completions
[ -s "/Users/kevin.fisher/.bun/_bun" ] && source "/Users/kevin.fisher/.bun/_bun"
