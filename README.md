# Hyprland: V9 Baseline
![Made with Arch](https://img.shields.io/badge/Made%20with-Arch-1793d1?style=for-the-badge&logo=arch-linux&logoColor=white)
![Style](https://img.shields.io/badge/Style-Steel%20Blue%20Monochrome-5f7c8a?style=for-the-badge)

A disciplined, monochrome configuration for Hyprland.
**"Blur the shell, not the work."**

---

## 🎨 Identity

*   **Palette**: Monochrome Dark (`#0f0f0f`)
*   **Accent**: Steel Blue (`#5f7c8a`)
*   **Radius**: Subtle (UI: 8px, Tiled: 0-4px)
*   **Blur**: Enabled on Shell (Waybar, Wofi, Dunst)

## 🥣 Tech Stack

| Component | Tool | Style |
| :--- | :--- | :--- |
| **Window Manager** | Hyprland | Dwindle Layout, 4px Gaps |
| **Bar** | Waybar | Floating, 85% Opacity, Blur |
| **Terminal** | Kitty | Muted Palette, Blue Cursor |
| **Launcher** | Wofi | Blur, Steel Blue Selection |
| **Notification** | Dunst | Dark Blur, Blue Border |
| **Lock Screen** | Hyprlock | Minimalist Void |

## 📂 Project Structure

```plaintext
v9-hyprdots/
├── bootstrap.sh       # Installer (V9 Edition)
├── config/
│   ├── hypr/          # Core Configs (general.conf using #5f7c8a)
│   ├── waybar/        # CSS with 8px radius
│   ├── kitty/         # Muted theme
│   └── wofi/          # Blur enabled
```

## 🚀 Installation

```bash
git clone https://github.com/v9mirza/v9-hyprdots.git
cd v9-hyprdots
chmod +x bootstrap.sh
./bootstrap.sh
```

## ⌨️ Controls

| Action | Keybinding |
| :--- | :--- |
| **Terminal** | `Super` + `Enter` |
| **App Launcher** | `Super` + `D` |
| **File Manager** | `Super` + `E` |
| **Browser** | `Super` + `B` |
| **System Monitor** | `Super` + `M` |
| **Power Menu** | `Super` + `X` |

---
*V9 Baseline by v9mirza.*
