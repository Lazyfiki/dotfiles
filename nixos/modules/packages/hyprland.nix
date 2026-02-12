{
  inputs,
  pkgs,
  ...
}: {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };

  environment.systemPackages = with pkgs; [
    hyprgraphics
    hyprutils
    hyprcursor
    hyprlang
  ];

  services.xserver.videoDrivers = ["modesetting"];

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
  };

  hardware.graphics.enable = true;

  boot = {
    blacklistedKernelModules = [
      "nvidia"
      "nvidia_drm"
      "nvidia_modeset"
      "nvidia_uvm"
      "nouveau"
      "nvidia_wmi_ec_backlight"
    ];

    extraModprobeConfig = ''
      blacklist nouveau
      options nouveau modeset=0
    '';
  };
}
