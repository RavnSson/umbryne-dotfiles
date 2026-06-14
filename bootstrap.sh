#!/usr/bin/env bash

set -e 

if [[ ! -d packages ]];then
echo "Run this script from the repository root."
exit 1
fi

echo " ==> Installing official packages..." ./bootstrap/install-pacman.sh

echo " ==> Installing AUR  packages..." ./bootstrap/install-aur.sh

echo " ==> Installing ZSH plugins..." ./bootstrap/install-zsh-plugins.sh

echo " ==> Applying dotfiles..." ./bootstrap/install-dotfiles.sh

echo
echo " Bootstrap completed successfully."
echo " Please reboot or log out and back in."
