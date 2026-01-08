#!/bin/bash
# v9-hyprdots bootstrap script
# sets up a minimal, reproducible hyprland environment

set -euo pipefail

echo "== v9-hyprdots bootstrap =="

# sanity check: Arch Linux
if [[ ! -f /etc/arch-release ]]; then
  echo "Error: This script is intended for Arch Linux only."
  exit 1
fi

# check internet connection
ping -c 1 archlinux.org >/dev/null || {
  echo "Error: Network unavailable. Check connectivity."
  exit 1
}

# update keyring first to avoid signature errors
echo "-> Updating archlinux-keyring..."
sudo pacman -S --noconfirm archlinux-keyring

# update system
echo "-> Updating system..."
sudo pacman -Syu --noconfirm

# install packages from pkgs/*.txt
echo "-> Installing packages..."
if compgen -G "pkgs/*.txt" > /dev/null; then
  for pkg_list in pkgs/*.txt; do
    echo "Installing packages from $pkg_list..."
    sudo pacman -S --needed --noconfirm - < "$pkg_list"
  done
else
  echo "Warning: No package lists found in pkgs/"
fi

# enable NetworkManager (only if not already enabled)
if ! systemctl is-enabled NetworkManager >/dev/null 2>&1; then
  sudo systemctl enable --now NetworkManager
fi

# backup and install configs
echo "-> Installing configurations..."
mkdir -p ~/.config

backup_config() {
  local dir="$1"
  if [ -d "$HOME/.config/$dir" ]; then
    echo "Backing up existing $dir config..."
    mv "$HOME/.config/$dir" "$HOME/.config/${dir}.bak.$(date +%s)"
  fi
}

if [ -d "config" ]; then
  for dir in hypr waybar dunst kitty wofi; do
    backup_config "$dir"
  done
  rsync -av config/ ~/.config/
else
  echo "Error: config directory not found"
  exit 1
fi

# make hypr scripts executable (if they exist)
if [ -d "$HOME/.config/hypr/scripts" ]; then
  chmod +x "$HOME/.config/hypr/scripts/"*.sh
fi

# install fetchx (kept EXACTLY as requested)
echo
echo "== Installing FetchX =="
bash <(curl -fsSL https://raw.githubusercontent.com/v9mirza/fetchx/main/install.sh)

echo
echo "Bootstrap complete."
echo "Log out and start Hyprland."
