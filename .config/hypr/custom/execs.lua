hl.on("hyprland.start", function ()
    hl.exec_cmd(terminal)

    hl.exec_cmd("waybar")
    hl.exec_cmd("swww-daemon --format xrgb --no-cache")
    hl.exec_cmd("set_wallpaper")
    hl.exec_cmd("playerctld")

    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    hl.exec_cmd("systemctl --user enable --now easyeffects")
    hl.exec_cmd("quickshell -p ~/.config/quickshell/Main.qml")

    hl.exec_cmd("pypr")
    hl.exec_cmd("swaync")
    hl.exec_cmd("swaync-client -df")
    hl.exec_cmd("udiskie")
end)
