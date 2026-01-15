#!/bin/bash
# weather.sh - Simple wttr.in script for Waybar

text=$(curl -s "wttr.in/?format=%C+%t")
tooltip=$(curl -s "wttr.in/?format=%l:+%C+%t+%w\n%h\n%p\n%P")

if [[ $? -eq 0 ]]; then
    # Waybar expects JSON with "text" and "tooltip"
    # Using jq to safely format the JSON
    jq -n --arg text "$text" --arg tooltip "$tooltip" \
       '{text: $text, tooltip: $tooltip, class: "weather"}'
else
    echo '{"text": "Weather Unavailable", "tooltip": "Check connection"}'
fi
