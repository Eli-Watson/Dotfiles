#!/bin/bash

WALLDIR="$HOME/wallpapers"
STATEFILE="/tmp/hyprpaper-wallpaper"

change_wallpaper() {
    WALLPAPER=$(find "$WALLDIR" -type f | shuf -n 1)

    echo "$WALLPAPER" > "$STATEFILE"

    hyprctl hyprpaper preload "$WALLPAPER"
    hyprctl hyprpaper wallpaper ",$WALLPAPER"
}

# If called with "next", change immediately
if [[ "$1" == "next" ]]; then
    change_wallpaper
    exit 0
fi

# Otherwise: timed loop
while true; do
    change_wallpaper
    sleep 600   # ⏱️ change every 5 minutes
done

