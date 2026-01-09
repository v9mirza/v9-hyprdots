# 🚀 v9-hyprdots

A streamlined **Arch Linux + Hyprland** bootstrap script. This setup transforms a fresh Arch install into a fully functional, aesthetic desktop environment with a single command.

No manual config copying, no broken dependencies—just a clean, ready-to-use rice.

---

## ✨ Features

* **One-Command Setup:** Installs all required packages and applies configs.
* **Modern Stack:** Uses **Waybar** (status bar), **Kitty** (terminal), and **Wofi** (launcher).
* **System Ready:** Pre-configured networking, audio control, and brightness.
* **Smart Scripts:** Includes custom scripts for screenshots and clipboard management.
* **Idempotent:** Safe to rerun any time to fix broken configs or install missing tools.

---

## 🛠️ Installation

### 1. Prerequisites

* A fresh **Arch Linux** installation.
* A user with `sudo` privileges (**Do not run as root**).
* An active internet connection.

### 2. Execution

```bash
git clone https://github.com/v9mirza/v9-hyprdots.git
cd v9-hyprdots
chmod +x bootstrap.sh
./bootstrap.sh

```

### 3. Launching

Once finished, log out and select **Hyprland** from your display manager, or launch directly from the TTY:

```bash
Hyprland

```

---

## ⌨️ Keybindings

The **Super** (Windows) key is set as the `$mainMod`.

### 🚀 Apps & Utilities

| Keybind | Action |
| --- | --- |
| `$mod` + `ENTER` | Open Terminal (Kitty) |
| `$mod` + `D` | Application Launcher (Wofi) |
| `$mod` + `E` | File Manager (Thunar) |
| `$mod` + `V` | Clipboard History |
| `$mod` + `SHIFT` + `V` | Volume Control (Pavucontrol) |

### 🖥️ System & Windows

| Keybind | Action |
| --- | --- |
| `$mod` + `Q` | Kill Active Window |
| `$mod` + `F` | Toggle Floating Mode |
| `$mod` + `L` | Lock Screen (Hyprlock) |
| `$mod` + `SHIFT` + `Q` | Exit Hyprland |
| `Print` | Screenshot (Full Screen) |
| `SHIFT` + `Print` | Screenshot (Select Region) |

### 🔢 Workspaces

| Keybind | Action |
| --- | --- |
| `$mod` + `1-9` | Switch to Workspace |
| `$mod` + `SHIFT` + `1-9` | Move Window to Workspace |

---

## ⚙️ Customization

You don't need to reinstall Arch to make changes. Simply edit the configuration files inside this repository and rerun the `./bootstrap.sh` script. It will automatically re-apply the clean state to your `~/.config` directory.

---

## 📝 Notes

* **Hardware Keys:** Volume and Brightness keys work out of the box via `pamixer` and `brightnessctl`.
* **Clipboard:** Powered by `cliphist`. Use `$mod + V` to browse your history.
* **Stability:** If a package fails to install, the script will skip it and continue to ensure you aren't left with a half-broken system.

---

**Author:** [@v9mirza](https://github.com/v9mirza)

*If you find this useful, feel free to star the repo!*

---

