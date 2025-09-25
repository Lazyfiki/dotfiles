#!/usr/bin/env bash

interface=$(ip link | awk -F': ' '/wl/ {print $2; exit}')

state=$(cat /sys/class/net/"$interface"/operstate 2>/dev/null)

if [ "$state" == "up" ]; then
    echo "."
else
    echo ""
fi

