
# path export
export ZSH="$HOME/.oh-my-zsh"
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
export LS_COLORS="$(vivid generate lava)"
# Compilation flags

#Starsip eval
eval "$(starship init zsh)"
