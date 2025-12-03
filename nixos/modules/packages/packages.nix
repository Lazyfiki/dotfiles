{
  pkgs,
  inputs,
  ...
}: {
  services = {
    xserver.enable = false;
    udisks2.enable = true;
    logind.settings.Login = {
      HandleLidSwitch = "suspend";
      HandleLidSwitchDocked = "ignore";
      HandleLidSwitchExternalPower = "ignore";
    };

    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
      publish = {
        enable = true;
        userServices = true;
        addresses = true;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    # ciscoPacketTracer8
    adwaita-icon-theme
    bibata-cursors
    brightnessctl
    cifs-utils
    clang
    ddcutil
    docker-compose
    ffmpeg
    ffmpegthumbnailer
    file
    gjs
    glib
    gnumake
    grim
    gst_all_1.gst-libav
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gstreamer
    gvfs
    hyprlandPlugins.hypr-dynamic-cursors
    hyprlandPlugins.hyprspace
    hyprlock
    hyprpicker
    hyprpolkitagent
    hyprshade
    hyprshot
    imagemagick
    killall
    libinput
    libnotify
    libwacom
    localsend
    man-pages
    mesa
    mpd
    pkg-config
    pulseaudio
    pyprland
    qemu
    udiskie
    unstable.hyprland-qtutils
    virt-manager
    waybar
    wayland-protocols
    xdg-utils
    xwayland
    xwayland-satellite
    ydotool
  ];
}
