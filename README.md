---

## v9-hyprdots

A simple script to set up **Arch Linux** with a **Hyprland-based desktop**. It automatically installs your apps and applies a clean, modern look so you don't have to configure everything manually.

---

### Features

* **Easy Setup:** One script handles all installation and configuration.
* **Essential Apps:** Includes a status bar (Waybar), terminal (Kitty), and app menu (Wofi).
* **System Ready:** Audio, brightness, and networking work right away.
* **Safety:** You can run the script multiple times to fix issues or update settings.

---

### Installation

1. **Start with Arch:** Have a fresh Arch Linux install ready.
2. **Run the script:** Open your terminal and run these commands:

```bash
git clone https://github.com/v9mirza/v9-hyprdots.git
cd v9-hyprdots
chmod +x bootstrap.sh
./bootstrap.sh

```

3. **Log in:** Restart your computer and select **Hyprland** at the login screen.

---

### Main Controls

The **Windows key** (Super) is your main button for commands.

| Action | Keys |
| --- | --- |
| **Open Terminal** | Windows + Enter |
| **Open App Menu** | Windows + D |
| **Close Window** | Windows + Q |
| **Lock Screen** | Windows + L |
| **Take Screenshot** | Print Screen |
| **Switch Desktop** | Windows + 1-9 |

---

### How to Customize

If you want to change your settings, just edit the files inside the `v9-hyprdots` folder and run `./bootstrap.sh` again. The script will update your system with your new changes automatically.

---
