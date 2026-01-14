# Hyprland Tactical Monochrome

![Made with Arch](https://img.shields.io/badge/Made%20with-Arch-1793d1?style=for-the-badge&logo=arch-linux&logoColor=white)
![Style](https://img.shields.io/badge/Style-Tactical%20Monochrome-000000?style=for-the-badge)

![Home](assets/home.png)

A hyper-minimalist, **tactical monochrome** configuration for Arch Linux. Designed for focus, speed, and immersion.

---

## 📸 Gallery

| **Terminal (Kitty + FetchX)** | **App Launcher (Wofi)** |
| :---: | :---: |
| ![Terminal](assets/terminal.png) | ![Wofi](assets/wofi.png) |

---

## 🗡️ Aesthetics
*   **Theme**: Pure Black (`#000000`) & Silver Gradient (`#555555`).
*   **Hyprland**: 1px borders with active gradient. Cinematic animations.
*   **Hyprlock**: "The Void" Layout. No images. Massive typography.
*   **Waybar**: Floating Pills. Modular and clean.
*   **Cursor**: Bibata Modern Ice.
*   **Shell**: Starship (Tactical Preset) + FetchX.

## 🥣 Tech Stack

| Component | Tool | Description |
| :--- | :--- | :--- |
| **Window Manager** | Hyprland | Dynamic Tiling |
| **Bar** | Waybar | Status Bar |
| **Terminal** | Kitty | GPU Accelerated |
| **Launcher** | Wofi | App Menu / Power Menu |
| **Notification** | Dunst | Minimalist Alerts |
| **File Manager** | Yazi | Terminal Based |
| **Shell** | Bash + Starship | Configured Shell |
| **Monitor** | Btop | System Stats |

## 📂 Project Structure

```plaintext
v9-hyprdots/
├── bootstrap.sh       # The Installer Script
├── config/
│   ├── hypr/          # Hyprland Main Configs
│   ├── waybar/        # Status Bar Styling
│   ├── kitty/         # Terminal Theme
│   ├── wofi/          # Launcher Styling
│   └── ...
└── pkgs/
    ├── apps.txt       # User Applications
    └── hypr.txt       # Core System Packages
```

## 🚀 Installation

**Requirements**: A fresh install of Arch Linux.

```bash
# 1. Clone the repository
git clone https://github.com/v9mirza/v9-hyprdots.git
cd v9-hyprdots

# 2. Run the bootstrap script
chmod +x bootstrap.sh
./bootstrap.sh
```

## ⌨️ Controls

| Action | Keybinding |
| :--- | :--- |
| **Terminal** | `Super` + `Enter` |
| **App Launcher** | `Super` + `D` |
| **File Manager (Yazi)** | `Super` + `E` |
| **Browser (Firefox)** | `Super` + `B` |
| **Close Window** | `Super` + `Q` |
| **Lock Screen** | `Super` + `L` |
| **Power Menu** | `Super` + `X` |
| **System Monitor** | `Super` + `M` |
| **Screenshot** | `Print` (Full) / `Shift` + `Print` (Region) |



---
*Built with precision.*
