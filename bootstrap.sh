#!/bin/bash
# v9-hyprdots bootstrap (clean & deterministic)

set -euo pipefail

echo "== v9-hyprdots bootstrap =="

# Arch only
[[ -f /etc/arch-release ]] || { echo "Arch Linux only."; exit 1; }

# Network
ping -c 1 archlinux.org >/dev/null 2>&1 || {
  echo "No network."; exit 1;
}

# System update
sudo pacman -S --noconfirm archlinux-keyring
sudo pacman -Syu --noconfirm

# Packages
if compgen -G "pkgs/*.txt" > /dev/null; then
  for f in pkgs/*.txt; do
    sudo pacman -S --needed --noconfirm - < "$f"
  done
fi

# NetworkManager
sudo systemctl enable --now NetworkManager >/dev/null 2>&1 || true

# Configs
mkdir -p "$HOME/.config"

backup() {
  [ -d "$HOME/.config/$1" ] &&
    mv "$HOME/.config/$1" "$HOME/.config/$1.bak.$(date +%s)"
}

for d in hypr waybar dunst kitty wofi; do
  backup "$d"
done

rsync -a config/ "$HOME/.config/"

[ -d "$HOME/.config/hypr/scripts" ] &&
  chmod +x "$HOME/.config/hypr/scripts/"*.sh || true

# Hyprland
command -v Hyprland >/dev/null 2>&1 ||
  sudo pacman -S --noconfirm hyprland

# Wayland session (force correct, no wrappers)
sudo mkdir -p /usr/share/wayland-sessions
sudo tee /usr/share/wayland-sessions/hyprland.desktop > /dev/null << 'EOF'
[Desktop Entry]
Name=Hyprland
Comment=Dynamic Wayland Compositor
Exec=Hyprland
Type=Application
DesktopNames=Hyprland
EOF

echo
echo "== Installing FetchX =="
bash <(curl -fsSL https://raw.githubusercontent.com/v9mirza/fetchx/main/install.sh)

echo
echo "Done."
echo "Login options:"
echo "  - With a display manager: select 'Hyprland'"
echo "  - Without a display manager: log into TTY and run 'Hyprland'"
