#!/usr/bin/env bash

loc=$(curl -s ipinfo.io | jq -r '.loc')
lat=${loc%,*}
lon=${loc#*,}

data=$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&current=temperature_2m,weathercode")
temp=$(echo "$data" | jq '.current.temperature_2m | round')
code=$(echo "$data" | jq '.current.weathercode')

case $code in
    0) icon="" ;;
    1|2|3) icon="" ;;
    45|48) icon="" ;;
    51|53|55|56|57) icon="" ;;
    61|63|65|66|67|80|81|82) icon="" ;;
    71|73|75|77|85|86) icon="" ;;
    95|96|99) icon="" ;;
    *) icon="?" ;;
esac

echo "<span font_family='Font Awesome 6 Pro Solid'>$icon</span> ${temp}°C"
