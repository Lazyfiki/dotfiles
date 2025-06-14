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
    gcc
    gdb
    git
    gnumake
    nodejs
    openjdk17
    qemu
    ripgrep
    tmux
    unstable.neovim
    vim
    virt-manager
  ];

  lspPkgs = with pkgs; [
    clang-tools
    gopls
    lua-language-server
    nil
    nodePackages.typescript-language-server
    rust-analyzer
  ];

  utils = with pkgs; [
    bc
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
    themechanger
    tree
    tree-sitter
    unstable.albert
    unstable.code-cursor
    unzip
    wget
  ];

  apps = with pkgs; [
    bottles
    chromium
    ddcutil
    discord
    dunst
    firefox
    gimp
    gjs
    gnome.nautilus
    grim
    gvfs
    hyprpicker
    imagemagick
    krita
    libinput
    lutris
    maestral
    mako
    mesa
    mpc-cli
    mpd
    mpv
    ncmpcpp
    nsxiv
    obs-studio
    pango
    pavucontrol
    pkg-config
    playerctl
    protontricks
    protonup-qt
    pulseaudio
    pulsemixer
    pyprland
    qbittorrent
    rofi-wayland
    slurp
    steam
    stow
    swappy
    swaynotificationcenter
    swww
    texliveFull
    transmission_4
    udiskie
    unstable.clock-rs
    unstable.ghostty
    unstable.hyprland-qtutils
    unstable.hyprlock
    unstable.hyprpolkitagent
    unstable.obsidian
    unstable.pywal16
    unstable.pywalfox-native
    unstable.spotify
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
  environment.systemPackages = apps ++ localPkgs ++ devPkgs ++ lspPkgs ++ utils;

  fonts.packages = with pkgs; [
    jetbrains-mono
    joypixels
    inter
  ];
}
