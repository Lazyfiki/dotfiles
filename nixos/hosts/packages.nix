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
    nwg-look
    cifs-utils
    curl
    ffmpeg
    file
    gnome.adwaita-icon-theme
    glib
    colloid-icon-theme
    gnome.dconf-editor
    jq
    killall
    libnotify
    libwacom
    man-pages
    tree
    tree-sitter
    albert
    unzip
    wget
  ];

  apps = with pkgs; [
    bottles
    chromium
    ddcutil
    discord
    dunst
    eww-wayland
    firefox
    gimp
    gjs
    gnome.nautilus
    gnome.sushi
    grim
    gvfs
    htop-vim
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
    rofi
    slurp
    unstable.spotify
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

    unstable.hyprlandPlugins.hy3
  ];
in {
  environment.systemPackages = apps ++ localPkgs ++ devPkgs ++ lspPkgs ++ utils;

  fonts.packages = with pkgs; [
    jetbrains-mono
    joypixels
    font-awesome
    nerdfonts
  ];
}
