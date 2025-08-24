{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.xserver.videoDrivers = ["modesetting"];

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  boot.blacklistedKernelModules = [
    "nvidia"
    "nvidia_drm"
    "nvidia_modeset"
    "nvidia_uvm"
  ];
}
