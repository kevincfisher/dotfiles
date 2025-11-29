#!/usr/bin/env bash

set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${BLUE}Installing dotfiles from: ${DOTFILES_DIR}${NC}"

cd "${DOTFILES_DIR}"

if [ -d ".config" ]; then
	echo -e "\n${BLUE}Installing .config packages...${NC}"
	stow -t ~/.config .config
	echo -e "${GREEN}✓ .config packages installed${NC}"
else
	echo-e "${RED}Warning: .config directory not found, skipping${NC}"
fi

if [ -d "home" ]; then
	echo -e "\n${BLUE} Installing home directory packages...${NC}"
	stow -t ~ home
	echo -e "${GREEN}✓ home directory packages installed${NC}"
else
	echo -e "${RED}Warning: home directory not found, skipping${NC}"
fi

echo -e "\n${GREEN}✓ Dotfiles installed successfully!${NC}"
