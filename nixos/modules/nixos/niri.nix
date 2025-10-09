{
  inputs,
  pkgs,
  ...
}: {
  programs.niri.enable = true;
  xdg.portal = {
    enable = true;
    config.common.default = "*"; # Fallback to default for all interfaces
    config.Niri = {
      # Or use your $XDG_CURRENT_DESKTOP value
      default = "gnome"; # Use xdg-desktop-portal-gnome
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome # Core for Niri
      xdg-desktop-portal-gtk # Fallback for GTK apps (optional but useful)
    ];
    # Optional: Use portal for xdg-open (helps with URL handling)
    xdgOpenUsePortal = true;
  };

  # Nautilus dependency for file chooser in portal-gnome
  services.dbus.packages = [pkgs.nautilus];

  # Ensure environment vars are set (Niri should handle most, but explicit helps)
  environment.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Niri";
    XDG_SESSION_DESKTOP = "Niri";
    XDG_SESSION_TYPE = "wayland";
  };

  # Add portal packages to user env (helps with manual restarts)
  environment.systemPackages = with pkgs; [
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
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
