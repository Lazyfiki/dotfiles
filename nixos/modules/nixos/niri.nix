{
  inputs,
  pkgs,
  ...
}: {
  # Enable Niri
  programs.niri.enable = true;

  # Enable XDG Desktop Portal
  xdg.portal = {
    enable = true;
    config.common.default = "gtk"; # Prefer GTK backend
    config.Niri = {
      default = "gtk"; # GTK is lightweight and reliable
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk # Primary backend
      xdg-desktop-portal-wlr # Fallback for Wayland-specific features
    ];
    xdgOpenUsePortal = true;
  };

  # Enable DBus and include portal packages
  services.dbus = {
    enable = true;
    packages = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      gsettings-desktop-schemas # Critical for backend settings
    ];
  };

  # System packages for portals and dependencies
  environment.systemPackages = with pkgs; [
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    gsettings-desktop-schemas # For GTK portal settings
    glib # For gsettings CLI and DBus utils
  ];

  # Environment variables for Wayland and Niri
  environment.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Niri";
    XDG_SESSION_DESKTOP = "Niri";
    XDG_SESSION_TYPE = "wayland";
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
    # Ensure schemas are found
    XDG_DATA_DIRS = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}:${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}:/run/current-system/sw/share:/usr/share";
  };

  # Graphics and video drivers
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["modesetting"];

  # Blacklist NVIDIA modules
  boot.blacklistedKernelModules = [
    "nvidia"
    "nvidia_drm"
    "nvidia_modeset"
    "nvidia_uvm"
  ];

  # Enable PipeWire for screen sharing
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # Ensure portal services start after graphical session
  systemd.user.services."xdg-desktop-portal" = {
    wantedBy = ["graphical-session.target"];
    partOf = ["graphical-session.target"];
    after = ["graphical-session-pre.target" "niri.service"];
    serviceConfig = {
      Restart = "always";
      RestartSec = 3;
    };
  };
  systemd.user.services."xdg-desktop-portal-gtk" = {
    wantedBy = ["graphical-session.target"];
    partOf = ["graphical-session.target"];
    after = ["graphical-session-pre.target" "xdg-desktop-portal.service"];
    serviceConfig = {
      Restart = "always";
      RestartSec = 3;
    };
  };
}
