#!/bin/bash
# theme-toggle.sh
# Switches between "Dark Knight"  themes.

STATE_FILE="/tmp/theme_mode"
CURRENT_MODE=$(cat "$STATE_FILE" 2>/dev/null || echo "dark")

CONF_DIR="$HOME/.config"

if [ "$CURRENT_MODE" == "dark" ]; then
    # SWITCH TO LIGHT 
    echo "Switching to Light Mode..."
    
    # 1. Hyprland Borders (Black)
    hyprctl keyword general:col.active_border "rgba(000000ff) rgba(555555ff) 45deg"
    hyprctl keyword general:col.inactive_border "rgba(ccccccff)"
    
    # 2. Waybar (Light Style)
    ln -sf "$CONF_DIR/waybar/style-light.css" "$CONF_DIR/waybar/style.css"
    killall -SIGUSR2 waybar # SIGUSR2 reloads CSS only
    
    # 3. Kitty (Light Theme)
    ln -sf "$CONF_DIR/kitty/theme-light.conf" "$CONF_DIR/kitty/theme.conf"
    killall -SIGUSR1 kitty # SIGUSR1 reloads config
    
    # 4. GTK Theme (Adwaita)
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita' 2>/dev/null
    gsettings set org.gnome.desktop.interface color-scheme 'default' 2>/dev/null
    
    # 5. Wallpaper (Optional: Add Light Mode wallpaper logic here)
    # hyprctl hyprpaper wallpaper ...
    
    echo "light" > "$STATE_FILE"
    notify-send "Global Theme" "Light Mode Activated"

else
    # SWITCH TO DARK (Dark Knight)
    echo "Switching to Dark Mode..."
    
    # 1. Hyprland Borders (Silver)
    hyprctl keyword general:col.active_border "rgba(ffffffaa) rgba(555555aa) 45deg"
    hyprctl keyword general:col.inactive_border "rgba(111111ff)"
    
    # 2. Waybar (Dark Style)
    ln -sf "$CONF_DIR/waybar/style-dark.css" "$CONF_DIR/waybar/style.css"
    killall -SIGUSR2 waybar
    
    # 3. Kitty (Dark Theme)
    ln -sf "$CONF_DIR/kitty/theme-dark.conf" "$CONF_DIR/kitty/theme.conf"
    killall -SIGUSR1 kitty
    
    # 4. GTK Theme (Adwaita-Dark)
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-Dark' 2>/dev/null
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' 2>/dev/null
    
    echo "dark" > "$STATE_FILE"
    notify-send "Global Theme" "Dark Knight Activated"
fi
