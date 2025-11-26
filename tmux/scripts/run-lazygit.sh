#!/usr/bin/env bash 

# basic utlity to check if lazygit is installed before proceeding
# prompt if not. mostly just out of convenience for me
if [ -z $(which lazygit) ]; then
  echo "lazygit not found.";
  read -p "would you like to install? [y/n] " shouldInstall;
  #TODO: check if brew is installed. If not, maybe install from source
  if [[ "$shouldInstall" == "y" ]]; then
    brew install lazygit
  else
    exit 0;
  fi;

fi
lazygit;
