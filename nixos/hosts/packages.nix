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
    adwaita-icon-theme
    bat
    bc
    brightnessctl
    cifs-utils
    curl
    dconf-editor
    ffmpeg
    ffmpegthumbnailer
    file
    glib
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
    ghostty
    gimp
    gjs
    grim
    gvfs
    hyprlock
    hyprpicker
    hyprpolkitagent
    hyprshade
    imagemagick
    krita
    libinput
    maestral
    mesa
    mpc-cli
    mpd
    mpv
    nautilus
    ncmpcpp
    nsxiv
    pavucontrol
    pkg-config
    playerctl
    pulseaudio
    pulsemixer
    pyprland
    pywal16
    qbittorrent
    rofi-wayland
    slurp
    swappy
    swaynotificationcenter
    swww
    transmission_4
    udiskie
    unstable.clock-rs
    unstable.hyprland-qtutils
    unstable.yacreader
    youtube-music
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
