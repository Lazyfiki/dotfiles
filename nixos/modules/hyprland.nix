{
  inputs,
  pkgs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  wayland.windowManager.hyprland.plugins = with pkgs; [
    hyprlandPlugins.hypr-dynamic-cursors
  ];

  services.xserver.videoDrivers = ["modesetting"];

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
  };

  hardware.graphics.enable = true;

  boot.blacklistedKernelModules = [
    "nvidia"
    "nvidia_drm"
    "nvidia_modeset"
    "nvidia_uvm"
  ];
}
