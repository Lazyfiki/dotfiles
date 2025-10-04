{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [
      pkgs.hyprlandPlugins.hypr-dynamic-cursors
    ];
  };
}
