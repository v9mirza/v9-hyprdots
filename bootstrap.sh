#!/bin/bash
# arch-hypr bootstrap script
# sets up a minimal, reproducible hyprland environment
set -euo pipefail

echo "== arch-hypr bootstrap =="

# check internet connection
ping -c 1 archlinux.org >/dev/null || {
  echo "Error: Network unavailable"
  exit 1
}

# update keyring first to avoid signature errors
echo "-> Updating archlinux-keyring..."
sudo pacman -S --noconfirm archlinux-keyring

# update system and install packages
echo "-> Installing packages..."
sudo pacman -Syu --noconfirm
# verify package list exists
# loops through all .txt files in pkgs/
for pkg_list in pkgs/*.txt; do
    if [ -f "$pkg_list" ]; then
        echo "Installing packages from $pkg_list..."
        sudo pacman -S --needed --noconfirm $(cat "$pkg_list")
    fi
done

# enable network manager
sudo systemctl enable --now NetworkManager

# backup and install configs
echo "-> Installing configurations..."
mkdir -p ~/.config

# backup function
backup_config() {
    local dir="$1"
    if [ -d "$HOME/.config/$dir" ]; then
        echo "Backing up existing $dir config..."
        mv "$HOME/.config/$dir" "$HOME/.config/${dir}.bak.$(date +%s)"
    fi
}

# verify config dir exists
if [ -d "config" ]; then
    # list of dirs to backup if they exist
    for dir in hypr waybar dunst kitty wofi; do
        backup_config "$dir"
    done
    rsync -av config/ ~/.config/
else
    echo "Error: config directory not found"
    exit 1
fi

# make scripts executable
chmod +x ~/.config/hypr/scripts/*.sh

# install fetchx (optional tool)
echo
echo "== Installing FetchX =="
bash <(curl -fsSL https://raw.githubusercontent.com/v9mirza/fetchx/main/install.sh)

echo
echo "Bootstrap complete."
echo "Log out and start Hyprland."
