{pkgs, ...}: {
  programs.niri.enable = true;

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common = {
        default = [
          "gnome"
          "gtk"
        ];
        "org.freedesktop.impl.portal.FileChooser" = [
          "gtk"
        ];
        "org.freedesktop.impl.portal.Secret" = [
          "gnome-keyring"
        ];
      };
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };
  services.xserver.enable = true;
  services.xserver.videoDrivers = ["modesetting"]; # or "nvidia" if needed
  # services.xserver.layout = "us";
  # services.xserver.displayManager.startx.enable = true; # optional
  # services.xserver.desktopManager.default = "none"; # we use niri
  # services.xserver.windowManager.enable = false;
  # services.xserver.enableXWayland = true;
}
