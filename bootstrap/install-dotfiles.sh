#!/usr/bin/env bash

set -e

mkdir -p "$HOME/.config"

cp -rf config/hypr "$HOME/.config"
cp -rf config/waybar "$HOME/.config"
cp -rf config/rofi "$HOME/.config"
cp -rf config/zsh "$HOME/.config"

echo "Installing environment configuration..."

mkdir -p "$HOME/.config/environment.d"

sed "s|**HOME**|$HOME|g" 
config/environment.d/android.conf 
> "$HOME/.config/environment.d/android.conf"


mkdir -p "$HOME/.config/Code - OSS/User"

cp -f \
    "config/Code - OSS/User/settings.json" \
    "$HOME/.config/Code - OSS/User/settings.json"

echo "Installing system ZSH configuration..."

if [[ -f /etc/zsh/zshenv ]]; then
    sudo cp /etc/zsh/zshenv /etc/zsh/zshenv.bak
fi

sudo mkdir -p /etc/zsh

sudo cp -f \
    config/system/zshenv \
    /etc/zsh/zshenv

echo "Dotfiles installed successfully."
