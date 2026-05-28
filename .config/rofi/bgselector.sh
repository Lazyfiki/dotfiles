#!/usr/bin/env bash

WALL_DIR="$HOME/pix/wall/"
CACHE_DIR="$HOME/.cache/thumbnails/bgselector"
CACHE_INDEX="$CACHE_DIR/.index"

mkdir -p "$CACHE_DIR"

# Build current wallpaper index
current_index=$(mktemp)
find "$WALL_DIR" -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' -o -iname '*.gif' -o -iname '*.bmp' -o -iname '*.tiff' -o -iname '*.avif' \) -printf '%p\t%T@\n' | sort > "$current_index"

# Clean orphaned cache files if index exists
if [ -f "$CACHE_INDEX" ]; then
    while IFS=$'\t' read -r cached_path _; do
        if [ ! -f "$cached_path" ]; then
            rel_path="${cached_path#$WALL_DIR/}"
            cache_name="${rel_path//\//_}"
            rm -f "$CACHE_DIR/$cache_name"
        fi
    done < "$CACHE_INDEX"
fi

# Count images needing thumbnails
total_images=0
missing_count=0
while IFS=$'\t' read -r img _; do
    ((total_images++))
    rel_path="${img#$WALL_DIR/}"
    cache_name="${rel_path//\//_}"
    [ ! -f "$CACHE_DIR/$cache_name" ] && ((missing_count++))
done < "$current_index"

if [ $missing_count -gt 0 ]; then
    echo "Building cache: 0/$missing_count (0%)"
fi

# Generate thumbnails function
generate_thumbnail() {
    local img="$1"
    local progress_file="$2"
    local rel_path="${img#$WALL_DIR/}"
    local cache_name="${rel_path//\//_}"
    local cache_file="$CACHE_DIR/$cache_name"

    [ -f "$cache_file" ] && return

    if [[ "$img" =~ \.(gif|GIF)$ ]]; then
        magick "$img[0]" -strip -thumbnail 330x540^ -gravity center -extent 330x540 +repage "$cache_file" 2>/dev/null
    else
        magick "$img" -strip -thumbnail 330x540^ -gravity center -extent 330x540 +repage "$cache_file" 2>/dev/null
    fi

    echo "1" >> "$progress_file"
}

export -f generate_thumbnail
export WALL_DIR CACHE_DIR

# Parallel thumbnail generation with progress tracking
if [ $missing_count -gt 0 ]; then
    progress_file=$(mktemp)
    touch "$progress_file"

    # Start thumbnail generation in background
    (
        while IFS=$'\t' read -r img _; do
            rel_path="${img#$WALL_DIR/}"
            cache_name="${rel_path//\//_}"
            [ ! -f "$CACHE_DIR/$cache_name" ] && echo "$img"
        done < "$current_index" | xargs -P 4 -I {} bash -c 'generate_thumbnail "$@"' _ {} "$progress_file"
    ) &

    generation_pid=$!

    # Monitor progress
    last_count=0
    while kill -0 $generation_pid 2>/dev/null; do
        completed=$(wc -l < "$progress_file" 2>/dev/null || echo 0)
        if [ "$completed" != "$last_count" ]; then
            percent=$((completed * 100 / missing_count))
            echo -ne "\rBuilding cache: $completed/$missing_count ($percent%)"
            last_count=$completed
        fi
        sleep 0.2
    done

    wait $generation_pid
    echo -e "\rBuilding cache: $missing_count/$missing_count (100%)"
    rm -f "$progress_file"
else
    echo "Cache up to date"
fi

# Update cache index
mv "$current_index" "$CACHE_INDEX"

# Build rofi list efficiently
rofi_input=$(mktemp)
while IFS=$'\t' read -r img _; do
    rel_path="${img#$WALL_DIR/}"
    cache_name="${rel_path//\//_}"
    cache_file="$CACHE_DIR/$cache_name"

    if [ -f "$cache_file" ]; then
        printf '%s\000icon\037%s\n' "$rel_path" "$cache_file"
    fi
done < "$CACHE_INDEX" > "$rofi_input"

# Show rofi and get selection
selected=$(rofi -dmenu -show-icons -config "$HOME/.config/rofi/bgselector.rasi" < "$rofi_input")
rm "$rofi_input"

# Apply wallpaper if selected
if [ -n "$selected" ]; then
    selected_path="$selected"
    echo "$selected_path"
    if [ -f "$selected_path" ]; then
        set_wallpaper "$selected_path"
        wait
    fi
fi
