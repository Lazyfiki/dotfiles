#!/usr/bin/env bash

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --dpi 96

set_wallpaper &
dwm_bar &
picom --backend glx &
dunst &
sxhkd &
dropbox &
xinput set-prop 10 'libinput Accel Speed' -0.5 &
unclutter -idle 3 -grab &

exec dwm > /dev/null 2>&1
