#!/usr/bin/env bash

# Current Theme
dir="$HOME/.config/rofi"
theme='powermenu'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Options (format: key:icon)
options=(
    "l:"
    "u:"
    "o:"
    "r:"
    "s:"
)

# Rofi CMD with keybindings
rofi_cmd() {
    # Create the menu entries by extracting only the icons
    menu_entries=$(printf "%s\n" "${options[@]}" | cut -d':' -f2)

    rofi -dmenu \
        -p "Uptime: $uptime" \
        -mesg "Uptime: $uptime" \
        -theme "${dir}/${theme}.rasi" \
        -kb-custom-1 "s" \
        -kb-custom-2 "r" \
        -kb-custom-3 "l" \
        -kb-custom-4 "u" \
        -kb-custom-5 "o" <<< "$menu_entries"
}

# Execute Command
run_cmd() {
    case "$1" in
        "--shutdown")
            systemctl poweroff
            ;;
        "--reboot")
            systemctl reboot
            ;;
        "--suspend")
            mpc -q pause
            amixer set Master mute
            systemctl suspend
            hyprlock || i3lock
            ;;
        "--logout")
            if [[ "$DESKTOP_SESSION" == 'openbox' ]]; then
                openbox --exit
            elif [[ "$DESKTOP_SESSION" == 'bspwm' ]]; then
                bspc quit
            elif [[ "$DESKTOP_SESSION" == 'i3' ]]; then
                i3-msg exit
            elif [[ "$DESKTOP_SESSION" == 'plasma' ]]; then
                qdbus org.kde.ksmserver /KSMServer logout 0 0 0
            else
                hyprctl dispatch exit
            fi
            ;;
        "--lock")
            hyprlock || i3lock
            ;;
    esac
}

# Run rofi and capture the return code
chosen=$(rofi_cmd)
exit_code=$?

# Map keybindings to actions
case $exit_code in
    10) # kb-custom-1 (s)
        run_cmd --shutdown
        ;;
    11) # kb-custom-2 (r)
        run_cmd --reboot
        ;;
    12) # kb-custom-3 (l)
        run_cmd --lock
        ;;
    13) # kb-custom-4 (u)
        run_cmd --suspend
        ;;
    14) # kb-custom-5 (o)
        run_cmd --logout
        ;;
    0) # Enter key with selected option
        # Find the key by matching the selected icon
        key=$(printf "%s\n" "${options[@]}" | grep ":$chosen$" | cut -d':' -f1)
        case "$key" in
            "s")
                run_cmd --shutdown
                ;;
            "r")
                run_cmd --reboot
                ;;
            "l")
                run_cmd --lock
                ;;
            "u")
                run_cmd --suspend
                ;;
            "o")
                run_cmd --logout
                ;;
        esac
        ;;
    *)
        exit 0
        ;;
esac
