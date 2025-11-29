#!/usr/bin/env bash

set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[0;33m'
NC='\033[0m'

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="$HOME/.config.bak_${TIMESTAMP}"

echo -e "${BLUE}Creating backup of .config directory... ${NC}"
echo -e "${BLUE}Backup location: ${BACKUP_DIR}${NC}\n"

mkdir -p "${BACKUP_DIR}"

if [ -d "$HOME/.config" ]; then
	echo -e "${YELLOW}Backing up ~/.config${NC}"
	cp -r "$HOME/.config" "${BACKUP_DIR}/"
	echo -e "${GREEN}✓ ~/.config backed up${NC}"
else
	echo -e "${YELLOW}Warning: ~/.config not found${NC}"
fi

echo -e "\n${GREEN}✓ Backup complete!${NC}"
echo -e "${BLUE}Backup saved to: ${BACKUP_DIR}${NC}"
