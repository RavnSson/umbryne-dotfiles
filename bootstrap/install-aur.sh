
#!/usr/bin/env bash

set -e

if ! command -v yay >/dev/null 2>&1;then
echo "yay not foun. Installing..."

git clone https://aur.archlinux.org/yay.git /tmp/yay

pushd /tmp/yay >/dev/null

makepkg -si

popd >/dev/null

fi

mapfile -t packages < <(
grep -v '^#' packages/05-aur.txt |
grep -v '^$'
)

yay -S --needed "${packages[@]}"
