#!/usr/bin/env bash

capacity=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null)
status=$(cat /sys/class/power_supply/BAT0/status 2>/dev/null)

# fallback if no battery
if [ -z "$capacity" ]; then
    echo "🔌 No battery"
    exit 0
fi

# pick icon
if [ "$status" == "Charging" ]; then
    icon=""
else
    if [ "$capacity" -ge 90 ]; then
        icon=" "
    elif [ "$capacity" -ge 70 ]; then
        icon=" "
    elif [ "$capacity" -ge 50 ]; then
        icon=" "
    elif [ "$capacity" -ge 30 ]; then
        icon=" "
    else
        icon=" "
    fi
fi


echo "$capacity% $icon"
