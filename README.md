# V9-hyprdots
![Made with Arch](https://img.shields.io/badge/Made%20with-Arch-1793d1?style=for-the-badge&logo=arch-linux&logoColor=white)
![Style](https://img.shields.io/badge/Style-Charcoal%20Monochrome-6f7a80?style=for-the-badge)

A minimal, monochrome configuration for Hyprland.
Designed for focus with a "Blur the shell, not the work" philosophy.

---

## Identity

*   **Palette**: Monochrome Dark (`#0f0f0f`)
*   **Accent**: Cool Gray (`#6f7a80`)
*   **Radius**: Uniform 8px
*   **Blur**: Enabled on Shell (Waybar, Wofi, Dunst)

## Highlights

*   **Performance First**: Zero-bloat config optimized for speed.
*   **Pixel Perfect**: Every border, gap, and radius is calculated.
*   **Charcoal Accent**: A unified accent color `#6f7a80` across all apps.
*   **Ghostty Default**: GPU-accelerated terminal with V9 shaders.

## Showcase

| | |
|:---:|:---:|
| <img src="assets/home.png" width="100%"> | <img src="assets/terminal.png" width="100%"> |
| Home Desktop | Terminal Workflow |
| <img src="assets/app-menu.png" width="100%"> | <img src="assets/power-menu.png" width="100%"> |
| App Launcher | Power Menu |

## Tech Stack

| Component | Tool | Description |
| :--- | :--- | :--- |
| Window Manager | Hyprland | Dwindle Layout, 4px Gaps |
| Bar | Waybar | Floating, 85% Opacity, Blur |
| Terminal | Ghostty | V9-hyprdots Config, 0.94 Opacity |
| Launcher | Wofi | Blur, Cool Gray Selection |
| Notification | Dunst | Dark Blur, Gray Border |
| Lock Screen | Hyprlock | Minimalist Void |

## Project Structure

```plaintext
v9-hyprdots/
├── bootstrap.sh       # Installer (V9 Edition)
├── config/
│   ├── hypr/          # Core Configs
│   ├── waybar/        # CSS with 8px radius
│   ├── ghostty/       # V9-hyprdots Terminal
│   └── wofi/          # Blur enabled
```

## Installation

```bash
git clone https://github.com/v9mirza/v9-hyprdots.git
cd v9-hyprdots
chmod +x bootstrap.sh
./bootstrap.sh
```

## Controls

| Action | Keybinding |
| :--- | :--- |
| Terminal | `Super` + `Enter` |
| App Launcher | `Super` + `Space` |
| File Manager | `Super` + `E` |
| System Monitor | `Super` + `M` |
| Power Menu | `Super` + `X` |
| Close Window | `Super` + `Q` |
| Float Window | `Super` + `F` |
| Clipboard | `Super` + `V` |
| Screenshot (Full) | `Print` |
| Lock Screen | `Super` + `L` |

---
V9-hyprdots by v9mirza.
