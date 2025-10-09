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
    # Prefer GTK backend for lighter dependencies; fallback to GNOME if needed
    config.common.default = "gtk"; # Use gtk as default for all interfaces
    config.Niri = {
      default = "gtk"; # GTK is more reliable for minimal Wayland compositors
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk # Primary for Niri
      xdg-desktop-portal-gnome # Optional fallback for specific apps
    ];
    xdgOpenUsePortal = true; # Use portal for xdg-open
  };

  # DBus dependencies for portals
  services.dbus = {
    enable = true;
    packages = with pkgs; [xdg-desktop-portal xdg-desktop-portal-gtk];
  };

  # Add missing dependencies for GTK/GNOME portals
  environment.systemPackages = with pkgs; [
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    gsettings-desktop-schemas # Required for portal-gtk/gnome settings
    nautilus # File chooser (optional but recommended)
  ];

  # Environment variables for Wayland and Niri
  environment.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Niri";
    XDG_SESSION_DESKTOP = "Niri";
    XDG_SESSION_TYPE = "wayland";
    # Wayland-specific tweaks
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland";
    MOZ_ENABLE_WAYLAND = "1";
  };

  # Graphics and video drivers
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["modesetting"];

  # Blacklist NVIDIA modules (unchanged from your config)
  boot.blacklistedKernelModules = [
    "nvidia"
    "nvidia_drm"
    "nvidia_modeset"
    "nvidia_uvm"
  ];

  # Ensure PipeWire for screen sharing
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
}
