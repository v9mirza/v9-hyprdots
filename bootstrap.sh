#!/bin/bash
# v9-hyprdots bootstrap (Modern Edition)
# "Tactical, Fast, Deterministic"

set -e

# --- Palette ---
RESET='\033[0m'
BOLD='\033[1m'
DIM='\033[2m'
R='\033[0;31m'
G='\033[0;32m'
B='\033[0;34m'
C='\033[0;36m'
W='\033[1;37m'

# --- Helpers ---
print_banner() {
    clear
    echo -e "${DIM}----------------------------------------------------------------${RESET}"
    echo -e "${B}"
    cat << "EOF"
 ██╗   ██╗ █████╗     ██╗  ██╗██╗   ██╗██████╗ ██████╗ ██████╗  ██████╗ ████████╗███████╗
 ██║   ██║██╔══██╗    ██║  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝
 ██║   ██║╚██████║    ███████║ ╚████╔╝ ██████╔╝██████╔╝██║  ██║██║   ██║   ██║   ███████╗
 ╚██╗ ██╔╝ ╚═══██║    ██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══██╗██║  ██║██║   ██║   ██║   ╚════██║
  ╚████╔╝  ██████║    ██║  ██║   ██║   ██║     ██║  ██║██████╔╝╚██████╔╝   ██║   ███████║
   ╚═══╝   ╚═════╝    ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝╚═════╝  ╚═════╝    ╚═╝   ╚══════╝
EOF
    echo -e "${RESET}"
    echo -e "${DIM}----------------------------------------------------------------${RESET}"
    echo -e "${C} :: v9-hyprdots Bootstrap :: ${DIM}v2.0${RESET}"
    echo
}

step() {
    echo -e "${B}::${RESET} ${W}$1${RESET}..."
}

success() {
    echo -e "   ${G}✔${RESET} $1"
}

error() {
    echo -e "   ${R}✖${RESET} $1"
}

warn() {
    echo -e "   ${C}‼${RESET} $1"
}

# --- Checks ---
print_banner

# Root Check
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

# Arch Check
if [[ ! -f /etc/arch-release ]]; then
    error "This script is designed for Arch Linux only."
    exit 1
fi

# Network Check
if ! ping -c 1 archlinux.org &> /dev/null; then
    error "No internet connection detected."
    exit 1
fi

# --- 1. System Update ---
step "Updating System"
sudo pacman -S --noconfirm archlinux-keyring &> /dev/null
if sudo pacman -Syu --noconfirm &> /dev/null; then
    success "System Updated"
else
    error "Update Failed"
    exit 1
fi

# --- 2. Package Installation ---
step "Installing Packages"
FAILED_PKGS=()

for file in pkgs/*.txt; do
    echo -e "   ${DIM}→ Reading $file${RESET}"
    while read -r pkg; do
        [[ -z "$pkg" || "$pkg" == \#* ]] && continue
        
        if sudo pacman -S --needed --noconfirm "$pkg" &> /dev/null; then
            # Silent Success
            :
        else
            warn "Failed to install: $pkg"
            FAILED_PKGS+=("$pkg")
        fi
    done < "$file"
done
success "Core packages installed"

# --- 3. Services ---
step "Enabling Services"
sudo systemctl enable --now NetworkManager &> /dev/null || true
sudo systemctl enable --now bluetooth &> /dev/null || true
sudo systemctl enable --now avahi-daemon &> /dev/null || true
success "Services active (Network, Bluetooth, Avahi)"

# --- 4. FetchX ---
step "Installing FetchX"
if curl -fsSL https://raw.githubusercontent.com/v9mirza/fetchx/main/install.sh | bash &> /dev/null; then
    success "FetchX Installed"
else
    warn "FetchX installation failed"
fi

# --- 5. Configuration ---
step "Deploying Configs"

if [[ ! -f config/hypr/hyprland.conf ]]; then
    error "Missing config/hypr/hyprland.conf"
    exit 1
fi

mkdir -p ~/.config

# Backup
for d in hypr waybar dunst kitty wofi cava btop; do
    if [[ -d ~/.config/$d ]]; then
        mv ~/.config/$d ~/.config/$d.bak
        echo -e "   ${DIM}→ Backed up $d${RESET}"
    fi
done

# Copy
rsync -av --delete config/ ~/.config/ &> /dev/null
cp config/mimeapps.list ~/.config/mimeapps.list
chmod +x ~/.config/hypr/scripts/*.sh 2>/dev/null || true
success "Configs deployed to ~/.config"

# --- 6. GTK & Shell ---
step "Finalizing Setup"

# Hyprland Entry
if ! command -v Hyprland &> /dev/null; then
    sudo pacman -S --noconfirm hyprland &> /dev/null
fi

sudo mkdir -p /usr/share/wayland-sessions
sudo tee /usr/share/wayland-sessions/hyprland.desktop >/dev/null <<EOF
[Desktop Entry]
Name=Hyprland
Exec=Hyprland
Type=Application
EOF

# Starship
if ! grep -q "starship init bash" ~/.bashrc; then
    echo 'eval "$(starship init bash)"' >> ~/.bashrc
    success "Starship added to .bashrc"
fi

# GTK Theme
mkdir -p ~/.config/gtk-3.0
cat > ~/.config/gtk-3.0/settings.ini <<EOF
[Settings]
gtk-theme-name=Adwaita-dark
gtk-icon-theme-name=Papirus-Dark
gtk-font-name=Sans 11
gtk-cursor-theme-name=Bibata-Modern-Ice
gtk-application-prefer-dark-theme=1
EOF

# GTK2 Legacy
cat > ~/.gtkrc-2.0 <<EOF
gtk-theme-name="Adwaita-dark"
gtk-icon-theme-name="Papirus-Dark"
gtk-font-name="Sans 11"
gtk-cursor-theme-name="Bibata-Modern-Ice"
gtk-cursor-theme-size=24
gtk-toolbar-style=GTK_TOOLBAR_BOTH_HORIZ
gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
gtk-button-images=1
gtk-menu-images=1
gtk-enable-event-sounds=1
gtk-enable-input-feedback-sounds=1
gtk-xft-antialias=1
gtk-xft-hinting=1
gtk-xft-hintstyle="hintfull"
gtk-xft-rgba="rgb"
EOF

# Font Cache
fc-cache -fv &> /dev/null
success "Themes & Fonts applied"

# FetchX Auto-run
if ! grep -q "fetchx" ~/.bashrc; then
  cat <<EOF >> ~/.bashrc

# Auto-run fetchx
if command -v fetchx >/dev/null; then
  fetchx
fi
EOF
fi

# --- Summary ---
echo
echo -e "${G}${BOLD}Installation Complete!${RESET}"
if (( ${#FAILED_PKGS[@]} )); then
    echo
    warn "Some packages failed to install:"
    printf '  - %s\n' "${FAILED_PKGS[@]}"
fi
echo
echo -e "  To start your session:"
echo -e "  ${C}1.${RESET} Reboot your system"
echo -e "  ${C}2.${RESET} Select 'Hyprland' at login"
echo
