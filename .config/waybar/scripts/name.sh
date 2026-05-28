#!/usr/bin/env bash
# niri-current-desktop-name.sh

set -euo pipefail

focused=$(niri msg --json focused-window 2>/dev/null)

if [[ -z "$focused" || "$focused" == "null" ]]; then
    echo "No focused window"
    exit 1
fi

app_id=$(echo "$focused" | jq -r '.app_id // empty')

if [[ -z "$app_id" ]]; then
    echo "No app_id"
    exit 1
fi

echo "App ID: $app_id" >&2

# Search order
dirs=(
    "$HOME/.local/share/applications"
    "$HOME/.nix-profile/share/applications"
    "/run/current-system/sw/share/applications"
)

desktop_file=""
for dir in "${dirs[@]}"; do
    if [[ -d "$dir" ]]; then
        file=$(find "$dir" -name "${app_id}.desktop" -o -name "*${app_id}*.desktop" 2>/dev/null | head -n 1)
        if [[ -n "$file" ]]; then
            desktop_file="$file"
            break
        fi
    fi
done

if [[ -z "$desktop_file" ]]; then
    echo "No .desktop found → using app_id" >&2
    echo "$app_id"
    exit 0
fi

echo "Desktop file: $desktop_file" >&2

# Improved parser - only main [Desktop Entry] section
name=$(awk '
    BEGIN { in_main=0 }
    /^\[Desktop Entry\]/ { in_main=1; next }
    /^\[/ { if (in_main) in_main=0 }
    in_main && /^Name=/ {
        gsub(/^Name=/, "")
        print $0
        exit
    }
    in_main && /^Name\[/ {
        gsub(/^Name\[[^]]*\]=/, "")
        print $0
        exit
    }
' "$desktop_file")

if [[ -n "$name" ]]; then
    notify-send "$name"
else
    echo "$app_id"
fi
