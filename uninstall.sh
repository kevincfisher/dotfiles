
#!/usr/bin/env bash

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${BLUE}Uninstalling dotfiles from: ${DOTFILES_DIR}${NC}"

cd "${DOTFILES_DIR}"

#Unisntall .config directory packages
if [ -d ".config" ]; then
	echo -e "\n${YELLOW}Unistalling dotfiles from .config packages...${NC}"
	stow -D -t ~/.config .config
	echo -e "${GREEN}✓ .config packages uninstalled${NC}"
else 
	echo -e "${RED}Warning: .config directory not found, skipping${NC}"
fi


#Uninstall home directory package (~/)
if [ -d "home" ]; then
	echo -e "\n${YELLOW}Uninstalling dotfiles from home packages...${NC}"
	stow -D -t ~ home
	echo -e "${GREEN}✓ home packages uninstalled${NC}"
else
	echo -e "${RED}Warning: home directory not found, skipping${NC}"
fi

echo -e "\n${GREEN}✓ Dotfiles uninstalled successfully!${NC}"
