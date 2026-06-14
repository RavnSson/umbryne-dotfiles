#!/usr/bin/env bash

set -e

mkdir -p "$HOME/.config"

cp -rf config/hypr "$HOME/.config"
cp -rf config/waybar "$HOME/.config"
cp -rf config/rofi "$HOME/.config"
cp -rf config/zsh "$HOME/.config"

mkdir -p "$HOME/.config/Code - OSS/User"

cp -f \
    "config/Code - OSS/User/settings.json" \
    "$HOME/.config/Code - OSS/User/settings.json"

echo "Dotfiles installed successfully."
