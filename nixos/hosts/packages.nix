{
  pkgs,
  inputs,
  ...
}: let
  localPkgs = with pkgs; [
  ];

  devPkgs = with pkgs; [
    ciscoPacketTracer8
    clang
    direnv
    docker-compose
    fd
    fzf
    git
    gnumake
    nodejs
    qemu
    ripgrep
    stow
    tmux
    unstable.neovim
    vim
    virt-manager
  ];

  utils = with pkgs; [
    bc
    bibata-cursors
    brightnessctl
    cifs-utils
    colloid-icon-theme
    curl
    ffmpeg
    ffmpegthumbnailer
    file
    glib
    gnome.adwaita-icon-theme
    gnome.dconf-editor
    gst_all_1.gst-libav
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gstreamer
    htop-vim
    jq
    killall
    libnotify
    libwacom
    man-pages
    tree
    tree-sitter
    unzip
    wget
  ];

  apps = with pkgs; [
    bottles
    chromium
    ddcutil
    discord
    firefox
    gimp
    gjs
    gnome.nautilus
    grim
    gvfs
    hyprpicker
    hyprshade
    imagemagick
    krita
    libinput
    maestral
    mesa
    mpc-cli
    mpd
    mpv
    ncmpcpp
    nsxiv
    pavucontrol
    pkg-config
    playerctl
    pulseaudio
    pulsemixer
    pyprland
    qbittorrent
    rofi-wayland
    slurp
    swappy
    swaynotificationcenter
    swww
    transmission_4
    unstable.udiskie
    unstable.anyrun
    unstable.clock-rs
    unstable.ghostty
    unstable.hyprland-qtutils
    unstable.hyprlock
    unstable.hyprpolkitagent
    unstable.pywal16
    unstable.pywalfox-native
    unstable.spotify
    unstable.yacreader
    unstable.youtube-music
    wacomtablet
    waybar
    wayland-protocols
    winetricks
    wl-clipboard
    xdg-utils
    xwayland
    ydotool
    zathura
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
