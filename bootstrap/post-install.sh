#!/usr/bin/env bash

set -e

echo "Updating font cache..."
fc-cache -fv

echo "Generating XDG user directories..."
xdg-user-dirs-update

echo "Enabling services..."
sudo systemctl enable bluetooth.service
sudo systemctl enable ly@tty2

echo "Setting ZSH as default shell..."
chsh -s"$(which zsh)"

echo
echo "Post-install tasks completed."
echo "A reboot is recomended."
