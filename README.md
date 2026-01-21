# V9-hyprdots
![Made with Arch](https://img.shields.io/badge/Made%20with-Arch-1793d1?style=for-the-badge&logo=arch-linux&logoColor=white)
![Style](https://img.shields.io/badge/Style-Modern%20Clean-6f7a80?style=for-the-badge)

A highly optimized, modular configuration system for Hyprland.
Designed for focus with a "Blur the shell, not the work" philosophy.

---

## Presets

Choose the setup that fits your persona.

### 1. The Minimal Setup
> *"Perfection is achieved not when there is nothing more to add, but when there is nothing left to take away."*

A focused, distraction-free environment.
*   **Palette**: Monochrome Dark (`#0f0f0f`)
*   **Goal**: Pure productivity. Zero visual clutter.
*   **Best For**: Developers, writers, and minimalists.

```bash
git clone https://github.com/v9mirza/v9-hyprdots.git
cd v9-hyprdots/presets/minimal
chmod +x install.sh
./install.sh
```

### 2. The Hypr-Knight
> *"It's not who I am underneath, but what I do that defines me."*

A cinematic, intense aesthetic inspired by **The Dark Knight**.
*   **Palette**: Deep Charcoal & Gotham Grey
*   **Goal**: A moody, powerful desktop experience.
*   **Best For**: Night owls, creative professionals, and fans of the Bat.

```bash
git clone https://github.com/v9mirza/v9-hyprdots.git
cd v9-hyprdots/presets/hypr-knight
chmod +x install.sh
./install.sh
```

---

## Highlights

*   **Modular Presets**: Switch between styles easily without breaking your system.
*   **Performance First**: Zero-bloat configs optimized for speed.
*   **Pixel Perfect**: Every border, gap, and radius is calculated (Uniform 8px).
*   **Ghostty Default**: GPU-accelerated terminal with custom V9 shaders.

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
├── presets/
│   ├── minimal/       # Minimalist Setup
│   │   ├── install.sh
│   │   ├── config/
│   │   └── pkgs/
│   │
│   └── hypr-knight/   # Dark Knight Theme
│       ├── install.sh
│       ├── config/
│       └── pkgs/
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
