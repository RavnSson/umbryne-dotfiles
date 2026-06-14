#!/usr/bin/env bash

set -e

PLUGIN_DIR="$HOME/.config/zsh/plugins"

mkdir -p "$PLUGIN_DIR"

while IFS= read -r repo || [[ -n "$repo" ]]
do
[[ -z "$repo" ]] && continue
[[ "$repo" =~ ^# ]] && continue

plugin_name=$(basename "$repo" .git)

if [[ ! -d "$PLUGIN_DIR/$plugin_name" ]]; then
	echo "Installing $plugin_name..."
	git clone "$repo" "$PLUGIN_DIR/$plugin_name"
else
	echo "$plugin_name already installed."
fi

done < packages/08-zsh-plugins.txt
