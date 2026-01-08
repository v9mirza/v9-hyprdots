#!/bin/bash
# screenshot.sh
# usage: ./screenshot.sh [full|region]

DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"
NAME="screenshot_$(date +%Y%m%d_%H%M%S).png"

if [ "$1" == "full" ]; then
    grim "$DIR/$NAME"
    notify-send "Screenshot captured" "Saved to $DIR/$NAME"
elif [ "$1" == "region" ]; then
    grim -g "$(slurp)" "$DIR/$NAME"
    notify-send "Screenshot captured" "Saved to $DIR/$NAME"
else
    echo "Usage: $0 [full|region]"
    exit 1
fi
