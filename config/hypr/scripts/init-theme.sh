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

# Cleanup
# (Optional) Reload xsettings if running
# killall -HUP xsettingsd 2>/dev/null || true
