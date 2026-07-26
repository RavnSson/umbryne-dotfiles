#!/usr/bin/env bash

set -e

# Dotfiles are symlinked, not copied: editing the repository
# immediately updates the live configuration.

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BACKUP_DIR="$HOME/.config/umbryne-backup-$(date +%Y%m%d-%H%M%S)"

link() {
    local src="$1"
    local dst="$2"

    if [[ -e "$dst" && ! -L "$dst" ]]; then
        mkdir -p "$BACKUP_DIR"
        mv "$dst" "$BACKUP_DIR/"
        echo "Backed up $dst"
    fi

    ln -sfn "$src" "$dst"
    echo "Linked $dst -> $src"
}

echo "Linking user configuration..."

mkdir -p "$HOME/.config"

for dir in hypr waybar rofi zsh kitty mako nvim gtk-3.0 gtk-4.0; do
    link "$REPO_DIR/config/$dir" "$HOME/.config/$dir"
done

echo "Linking environment configuration..."

mkdir -p "$HOME/.config/environment.d"
link "$REPO_DIR/config/environment.d/android.conf" \
     "$HOME/.config/environment.d/android.conf"

echo "Linking VS Code settings..."

mkdir -p "$HOME/.config/Code - OSS/User"
link "$REPO_DIR/config/Code - OSS/User/settings.json" \
     "$HOME/.config/Code - OSS/User/settings.json"

echo "Installing system ZSH configuration..."

if [[ -f /etc/zsh/zshenv ]]; then
    sudo cp /etc/zsh/zshenv /etc/zsh/zshenv.bak
fi

sudo mkdir -p /etc/zsh

sudo cp -f \
    "$REPO_DIR/config/system/zshenv" \
    /etc/zsh/zshenv

if [[ -d "$BACKUP_DIR" ]]; then
    echo
    echo "Previous configurations moved to: $BACKUP_DIR"
fi

echo "Dotfiles linked successfully."
