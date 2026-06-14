# Umbryne Dotfiles

Personal Arch Linux configuration and bootstrap system for rebuilding my workstation from a clean installation.

This repository contains:

* Hyprland configuration
* Waybar configuration
* Rofi configuration
* ZSH configuration
* VS Code settings
* Package manifests
* Bootstrap scripts

The goal is to keep the entire workstation reproducible from Git.

---

## Installation

### 1. Install Arch Linux

During the `pacstrap` phase, install the packages listed in:

```text
packages/01-pacstrap.txt
```

### 2. Configure the base system

Inside `arch-chroot`, install the packages listed in:

```text
packages/02-chroot.txt
```

Also configure:

* Locale
* Timezone
* Hostname
* User account
* GRUB

### 3. Reboot

Boot into the newly installed system and log in through a TTY.

### 4. Clone the repository

```bash
cd ~

git clone git@github.com:RavnSson/umbryne-dotfiles.git
```

### 5. Run the bootstrap

```bash
cd ~/umbryne-dotfiles

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
* Run post-install tasks

### 6. Reboot

After rebooting, the system should be ready to use.

---

## Repository Structure

```text
umbryne-dotfiles/

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
```

---

## Package Layers

### 01 - Pacstrap

Minimal Arch Linux installation.

### 02 - Chroot

Bootloader, drivers and system tools.

### 03 - Desktop

Hyprland, Kitty, Ly and Bluetooth.

### 04 - Pacman

Fonts, audio, desktop utilities and applications.

### 05 - AUR

Third-party packages installed through yay.

### 06 - Development

Development tools, IDEs and virtualization.

### 07 - ZSH

Shell packages and CLI utilities.

### 08 - ZSH Plugins

External plugins installed from Git repositories.

---

## Philosophy

The operating system is temporary.

The configuration lives in Git.

A fresh Arch installation should only require:

```text
Install Arch
→ Clone repository
→ Run bootstrap
→ Reboot
```

to restore the complete environment.

