{pkgs, inputs, ...}: {
  programs.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland.enable = true;

    # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
  };

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };
}
