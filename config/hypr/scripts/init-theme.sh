#!/bin/bash
# V9-hyprdots Theme Initializer
# Forcefully applies GTK/Icon themes via GSettings

# Wait for services
sleep 1

# Apply GTK Theme
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Apply Icon Theme
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'

# Apply Cursor Theme
gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Ice'
gsettings set org.gnome.desktop.interface cursor-size 24

# Restart Tray Applets (Force Environment)
killall nm-applet blueman-applet udiskie 2>/dev/null || true
sleep 0.5

# Launch with explicit env to fix icons
export GTK_THEME=Adwaita-dark
export GTK_ICON_THEME=Papirus-Dark
nm-applet --indicator &
blueman-applet &
udiskie &
