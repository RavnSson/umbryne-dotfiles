
# Umbryne Dotfiles

Personal Arch Linux configuration and bootstrap system for rebuilding my workstation from a clean installation.

The operating system is temporary.

The configuration lives in Git.

This repository contains everything required to reproduce my daily workstation environment, including:

* Hyprland configuration
* Waybar configuration
* Rofi configuration
* ZSH configuration
* VS Code settings
* Package manifests
* Bootstrap scripts
* System-level configuration

---

# Philosophy

A fresh Arch installation should only require:

```text
Install Arch
→ Clone repository
→ Run bootstrap
→ Reboot
```

to restore the complete environment.

The goal is not to back up a machine.

The goal is to describe a machine.

---

# Prerequisites

The bootstrap assumes the following:

* Arch Linux is already installed
* A user account exists
* The user has sudo privileges
* NetworkManager is working
* Internet connectivity is available
* Git is installed
* SSH access to GitHub is configured (optional but recommended)

---

# Installation

## 1. Install Arch Linux

During the `pacstrap` phase install all packages listed in:

```text
packages/01-pacstrap.txt
```

---

## 2. Configure the Base System

Inside `arch-chroot`, install all packages listed in:

```text
packages/02-chroot.txt
```

Also configure:

* Locale
* Timezone
* Hostname
* User account
* GRUB

---

## 3. Reboot

Boot into the newly installed system and log in through a TTY.

---

## 4. Clone the Repository

```bash
cd ~

git clone git@github.com:RavnSson/umbryne-dotfiles.git
```

---

## 5. Run Bootstrap

```bash
cd ~/umbryne-dotfiles

chmod +x bootstrap.sh
chmod +x bootstrap/*.sh

./bootstrap.sh
```

The bootstrap process will:

* Install desktop packages
* Install additional pacman packages
* Install AUR packages
* Install development tools
* Install ZSH packages
* Install ZSH plugins
* Apply dotfiles
* Apply system configuration
* Run post-install tasks

---

## 6. Reboot

```bash
reboot
```

After rebooting, the workstation should be fully operational.

---

# Repository Structure

```text
umbryne-dotfiles/

README.md
bootstrap.sh

bootstrap/
├── install-pacman.sh
├── install-aur.sh
├── install-zsh-plugins.sh
├── install-dotfiles.sh
└── post-install.sh

config/
├── Code - OSS/
├── hypr/
├── rofi/
├── system/
│   └── zshenv
├── waybar/
└── zsh/

packages/
├── 01-pacstrap.txt
├── 02-chroot.txt
├── 03-desktop.txt
├── 04-pacman.txt
├── 05-aur.txt
├── 06-dev.txt
├── 07-zsh.txt
└── 08-zsh-plugins.txt

docs/
```

---

# Package Layers

## 01 - Pacstrap

Minimal Arch Linux installation.

Contains:

* Base system
* Kernel
* Firmware
* CPU microcode
* NetworkManager
* Base development tools

---

## 02 - Chroot

System-level packages.

Contains:

* GRUB
* EFI tools
* NVIDIA drivers
* SSH
* Manual pages
* Reflector

---

## 03 - Desktop

Graphical environment foundation.

Contains:

* Hyprland
* Kitty
* Ly
* Bluetooth

---

## 04 - Pacman

Desktop applications and utilities.

Contains:

* Fonts
* PipeWire
* Waybar
* Rofi
* Nemo
* Ranger
* Media tools
* Appearance tools
* Utility programs

---

## 05 - AUR

Third-party packages installed through yay.

Contains:

* Brave
* Spotify
* Bibata Cursor Theme
* Android Studio
* Additional AUR utilities

---

## 06 - Development

Development environment.

Contains:

* VS Code
* Godot
* Clang
* CMake
* Ninja
* Virtualization tools

---

## 07 - ZSH

Shell environment.

Contains:

* ZSH
* Starship
* Zoxide
* FZF
* Eza
* Bat
* Ripgrep
* FD

---

## 08 - ZSH Plugins

External plugins installed directly from Git repositories.

Examples:

* fast-syntax-highlighting
* zsh-autosuggestions
* zsh-history-substring-search
* zsh-vi-mode

---

# ZSH Configuration

ZSH follows the XDG Base Directory specification.

Configuration is stored in:

```text
~/.config/zsh
```

The bootstrap installs:

```text
/etc/zsh/zshenv
```

which redirects ZSH to the XDG configuration directory.

---

# Post-Install Tasks

The bootstrap automatically:

* Updates the font cache
* Generates XDG user directories
* Enables Bluetooth
* Enables Ly

Depending on the machine, additional manual verification may be required.

---

# Manual Verification

After the first reboot verify:

```bash
echo $SHELL
```

Expected:

```text
/usr/bin/zsh
```

Verify services:

```bash
systemctl status bluetooth
systemctl status ly@tty2
```

Verify configuration:

```bash
ls ~/.config
```

Expected directories:

```text
hypr
waybar
rofi
zsh
```

---

# Troubleshooting

## Ly does not start

Check:

```bash
systemctl status ly@tty2
```

Enable if necessary:

```bash
sudo systemctl enable ly@tty2.service
```

---

## User directories are missing

Install:

```bash
sudo pacman -S xdg-user-dirs
```

Then run:

```bash
xdg-user-dirs-update
```

---

## ZSH configuration is ignored

Verify:

```bash
echo $ZDOTDIR
```

Expected:

```text
~/.config/zsh
```

Verify:

```bash
cat /etc/zsh/zshenv
```

---

# Future Improvements

Potential future additions:

* Automatic virtualization setup
* Monitor profile management
* Wallpaper management
* GNU Stow support
* Backup and restore utilities
* Multiple machine profiles

---

# License

Personal use repository.

Adapt freely to your own workflow.

