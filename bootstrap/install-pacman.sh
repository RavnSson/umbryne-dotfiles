#!/usr/bin/env bash

set -e

install_package_list() {
local file="$1"

mapfile -t packages < <(
	grep -v '^#' "$file" |
	grep -v '^$'
)

sudo pacman -S --needed "${packages[@]}"

}

install_package_list "packages/03-desktop.txt"
install_package_list "packages/04-pacman.txt"
install_package_list "packages/06-dev.txt"
install_package_list "packages/07-zsh.txt"
