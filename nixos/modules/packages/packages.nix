{
  pkgs,
  inputs,
  ...
}: {
  services = {
    xserver.enable = false;
    udisks2.enable = true;
    logind = {
      lidSwitch = "suspend";
      lidSwitchDocked = "ignore";
      lidSwitchExternalPower = "ignore";
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
    wacomtablet
    waybar
    wayland-protocols
    xdg-utils
    xwayland
    xwayland-satellite
    ydotool
  ];
}
