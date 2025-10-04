{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    plugins = [
      pkgs.hyprlandPlugins.hypr-dynamic-cursors
    ];
  };
}
