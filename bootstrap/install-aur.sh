#!/usr/bin/env bash

set -e

if ! command -v yay >/dev/null 2>&1; then
    echo "yay not found. Installing..."

    build_dir=$(mktemp -d)

    git clone https://aur.archlinux.org/yay.git "$build_dir/yay"

    pushd "$build_dir/yay" >/dev/null
    makepkg -si
    popd >/dev/null

    rm -rf "$build_dir"
fi

mapfile -t packages < <(
    grep -v '^#' packages/05-aur.txt |
    grep -v '^$'
)

yay -S --needed "${packages[@]}"
