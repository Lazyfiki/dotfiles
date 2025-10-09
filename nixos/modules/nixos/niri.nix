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
    config.common.default = "gtk"; # Use GTK as default backend
    config.Niri = {
      default = "gtk"; # GTK is lighter and more reliable for Niri
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk # Primary backend
      xdg-desktop-portal-gnome # Fallback for specific apps
      xdg-desktop-portal-wlr # Additional fallback for Wayland
    ];
    xdgOpenUsePortal = true;
  };

  # Enable DBus explicitly and include portal packages
  services.dbus = {
    enable = true;
    packages = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
  };

  # System packages for portals and dependencies
  environment.systemPackages = with pkgs; [
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    xdg-desktop-portal-wlr
    gsettings-desktop-schemas # Required for GTK/GNOME portal settings
    glib # For gsettings CLI and DBus utilities
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
    # Ensure portals can find schemas
    XDG_DATA_DIRS = "/run/current-system/sw/share:/usr/share:/var/empty/share";
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
    wireplumber.enable = true; # Required for portal screen sharing
  };

  # Ensure user systemd services start after graphical session
  systemd.user.services."xdg-desktop-portal" = {
    wantedBy = ["graphical-session.target"];
    partOf = ["graphical-session.target"];
    after = ["graphical-session-pre.target"];
  };
  systemd.user.services."xdg-desktop-portal-gtk" = {
    wantedBy = ["graphical-session.target"];
    partOf = ["graphical-session.target"];
    after = ["graphical-session-pre.target"];
  };
}
