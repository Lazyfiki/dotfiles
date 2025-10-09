{
  inputs,
  pkgs,
  ...
}: {
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
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

  systemd.user.services = {
    "xdg-desktop-portal.service" = {
      enable = true;
      description = "XDG Desktop Portal";
      serviceConfig.ExecStart = "${pkgs.xdg-desktop-portal}/bin/xdg-desktop-portal";
    };
    "xdg-desktop-portal-wlr.service" = {
      enable = true;
      description = "XDG Desktop Portal WLR Backend";
      serviceConfig.ExecStart = "${pkgs.xdg-desktop-portal-wlr}/bin/xdg-desktop-portal-wlr";
    };
  };
}
