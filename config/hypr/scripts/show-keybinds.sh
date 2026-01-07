#!/bin/bash
grep '+' ~/.config/hypr/keybinds.md | wofi --dmenu --prompt "Keybindings"
