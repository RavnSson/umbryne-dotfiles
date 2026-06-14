#!/usr/bin/env bash

set -e

echo "Updating font cache..."
fc-cache -fv

echo "Generating XDG user directories..."
xdg-user-dirs-update

echo "Enabling services..."
sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth
sudo systemctl enable ly.service
