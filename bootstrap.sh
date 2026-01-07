#!/bin/bash
set -euo pipefail

echo "== arch-hypr bootstrap =="

ping -c 1 archlinux.org >/dev/null || {
  echo "Network unavailable"
  exit 1
}

sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm $(cat pkgs/*.txt)

sudo systemctl enable --now NetworkManager

mkdir -p ~/.config
rsync -av config/ ~/.config/

# make all helper scripts executable
chmod +x ~/.config/hypr/scripts/*.sh

echo
echo "== Installing FetchX (default tool) =="
echo "Source: https://github.com/v9mirza/fetchx"
echo

bash <(curl -fsSL https://raw.githubusercontent.com/v9mirza/fetchx/main/install.sh)

echo
echo "Bootstrap complete."
echo "Log out and start Hyprland."
