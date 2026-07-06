#!/usr/bin/env bash

set -e

if [[ ! -d packages ]]; then
    echo "Run this script from the repository root."
    exit 1
fi

echo "==> Installing official packages..."
./bootstrap/install-pacman.sh

echo "==> Installing AUR packages..."
./bootstrap/install-aur.sh

# Dotfiles must be linked before installing ZSH plugins, so the
# plugin clones land inside the repository (gitignored) via the symlink.
echo "==> Applying dotfiles..."
./bootstrap/install-dotfiles.sh

echo "==> Installing ZSH plugins..."
./bootstrap/install-zsh-plugins.sh

echo "==> Running post-install tasks..."
./bootstrap/post-install.sh

echo
echo "Bootstrap completed successfully."
echo "Please reboot or log out and back in."
