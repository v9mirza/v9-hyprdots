#!/bin/bash
# v9-hyprdots bootstrap script
# Sets up a minimal, reproducible Hyprland environment
# DM-agnostic, TTY-safe, idempotent

set -euo pipefail

echo "== v9-hyprdots bootstrap =="

# -------------------------------------------------
# Sanity checks
# -------------------------------------------------

# Arch Linux only
if [[ ! -f /etc/arch-release ]]; then
  echo "Error: This script is intended for Arch Linux only."
  exit 1
fi

# Internet connectivity
if ! ping -c 1 archlinux.org >/dev/null 2>&1; then
  echo "Error: Network unavailable. Check connectivity."
  exit 1
fi

# -------------------------------------------------
# System update
# -------------------------------------------------

echo "-> Updating archlinux-keyring..."
sudo pacman -S --noconfirm archlinux-keyring

echo "-> Updating system..."
sudo pacman -Syu --noconfirm

# -------------------------------------------------
# Package installation
# -------------------------------------------------

echo "-> Installing packages..."
if compgen -G "pkgs/*.txt" > /dev/null; then
  for pkg_list in pkgs/*.txt; do
    echo "Installing packages from $pkg_list..."
    sudo pacman -S --needed --noconfirm - < "$pkg_list"
  done
else
  echo "Warning: No package lists found in pkgs/"
fi

# -------------------------------------------------
# NetworkManager
# -------------------------------------------------

if ! systemctl is-enabled NetworkManager >/dev/null 2>&1; then
  echo "-> Enabling NetworkManager..."
  sudo systemctl enable --now NetworkManager
fi

# -------------------------------------------------
# Config installation
# -------------------------------------------------

echo "-> Installing configurations..."
mkdir -p "$HOME/.config"

backup_config() {
  local dir="$1"
  if [ -d "$HOME/.config/$dir" ]; then
    echo "Backing up existing $dir config..."
    mv "$HOME/.config/$dir" \
       "$HOME/.config/${dir}.bak.$(date +%s)"
  fi
}

if [ -d "config" ]; then
  for dir in hypr waybar dunst kitty wofi; do
    backup_config "$dir"
  done
  rsync -av config/ "$HOME/.config/"
else
  echo "Error: config directory not found"
  exit 1
fi

# Make Hypr scripts executable (if present)
if [ -d "$HOME/.config/hypr/scripts" ]; then
  chmod +x "$HOME/.config/hypr/scripts/"*.sh || true
fi

# -------------------------------------------------
# Hyprland session registration
# -------------------------------------------------

SESSION_DIR="/usr/share/wayland-sessions"
SESSION_FILE="$SESSION_DIR/hyprland.desktop"

echo "-> Registering Hyprland session..."

# Ensure Hyprland binary exists
if ! command -v Hyprland >/dev/null 2>&1; then
  echo "Hyprland not found, installing..."
  sudo pacman -S --noconfirm hyprland
fi

# Ensure session directory exists
sudo mkdir -p "$SESSION_DIR"

# Create session file if missing
if [ ! -f "$SESSION_FILE" ]; then
  sudo tee "$SESSION_FILE" > /dev/null << 'EOF'
[Desktop Entry]
Name=Hyprland
Comment=Dynamic Wayland Compositor
Exec=Hyprland
Type=Application
DesktopNames=Hyprland
EOF
fi

# -------------------------------------------------
# FetchX 
# -------------------------------------------------

echo
echo "== Installing FetchX =="
bash <(curl -fsSL https://raw.githubusercontent.com/v9mirza/fetchx/main/install.sh)

# -------------------------------------------------
# Done
# -------------------------------------------------

echo
echo "Bootstrap complete."
echo
echo "Login options:"
echo "  - With a display manager: select 'Hyprland'"
echo "  - Without a display manager: log into TTY and run 'Hyprland'"
echo
