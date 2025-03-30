#!/bin/sh

PATH_AC="/sys/class/power_supply/AC"
PATH_BATTERY_0="/sys/class/power_supply/BAT0"
PATH_BATTERY_1="/sys/class/power_supply/BAT1"

ac=0
battery_level_0=0
battery_level_1=0
battery_max_0=0
battery_max_1=0

if [ -f "$PATH_AC/online" ]; then
    ac=$(cat "$PATH_AC/online")
fi

if [ -f "$PATH_BATTERY_0/energy_now" ]; then
    battery_level_0=$(cat "$PATH_BATTERY_0/energy_now")
fi

if [ -f "$PATH_BATTERY_0/energy_full" ]; then
    battery_max_0=$(cat "$PATH_BATTERY_0/energy_full")
fi

if [ -f "$PATH_BATTERY_1/energy_now" ]; then
    battery_level_1=$(cat "$PATH_BATTERY_1/energy_now")
fi

if [ -f "$PATH_BATTERY_1/energy_full" ]; then
    battery_max_1=$(cat "$PATH_BATTERY_1/energy_full")
fi

battery_level=$(("$battery_level_0 + $battery_level_1"))
battery_max=$(("$battery_max_0 + $battery_max_1"))

battery_percent=$(("$battery_level * 100"))
battery_percent=$(("$battery_percent / $battery_max"))

# Font Awesome icons
if [ "$ac" -eq 1 ]; then
    icon=""  # Plug icon (AC power connected)

    if [ "$battery_percent" -gt 97 ]; then
        echo "$icon"
    else
        echo "$icon $battery_percent%"
    fi
else
    if [ "$battery_percent" -gt 85 ]; then
        icon=" "  # Battery Full (greater than 85%)
    elif [ "$battery_percent" -gt 60 ]; then
        icon=""  # Battery Three Quarters (greater than 60%)
    elif [ "$battery_percent" -gt 35 ]; then
        icon=""  # Battery Half (greater than 35%)
    elif [ "$battery_percent" -gt 10 ]; then
        icon=""  # Battery Quarter (greater than 10%)
    else
        icon=""  # Battery Empty (less than 10%)
    fi

    echo "$icon $battery_percent%"
fi

# I have no idea if this works, this is my first attempt at a bash script!
#	exec dunstify --urgency=critical "Battery is Low! Plug in your charger! 
if [ "$battery_percent" -lt 15 ] && [ "$ac" -eq 0 ]; then
	exec dunstify --urgency=critical "Battery is Low! Plug in your charger!"
fi
