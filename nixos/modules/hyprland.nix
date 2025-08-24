{
  pkgs,
  inputs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Use integrated GPU
  services.xserver.videoDrivers = ["nvidia"];

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

  # Prevent NVIDIA drivers from loading
  # boot.blacklistedKernelModules = [
  #   "nvidia"
  #   "nvidia_drm"
  #   "nvidia_modeset"
  #   "nvidia_uvm"
  # ];
}
