{
  pkgs,
  inputs,
  ...
}: let
  localPkgs = with pkgs; [
  ];

  devPkgs = with pkgs; [
    # ciscoPacketTracer8
    clang
    docker-compose
    gnumake
    qemu
    virt-manager
  ];

  utils = with pkgs; [
    adwaita-icon-theme
    brightnessctl
    cifs-utils
    ffmpeg
    ffmpegthumbnailer
    file
    glib
    gst_all_1.gst-libav
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gstreamer
    killall
    libnotify
    libwacom
    man-pages
  ];

  apps = with pkgs; [
    ddcutil
    ghostty
    gjs
    grim
    gvfs
    hyprlandPlugins.hypr-dynamic-cursors
    hyprlock
    hyprpicker
    hyprpolkitagent
    hyprshade
    hyprshot
    imagemagick
    libinput
    mesa
    mpd
    pkg-config
    pulseaudio
    pyprland
    udiskie
    unstable.hyprland-qtutils
    wacomtablet
    waybar
    wayland-protocols
    xdg-utils
    xwayland
    ydotool
  ];
in {
  environment.systemPackages = apps ++ localPkgs ++ devPkgs ++ utils;

  fonts.packages = with pkgs; [
    inter
    jetbrains-mono
    joypixels
    nerdfonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
  ];
}
