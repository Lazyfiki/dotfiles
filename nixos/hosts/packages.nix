{
  pkgs,
  inputs,
  ...
}: let
  localPkgs = with pkgs; [
  ];

  devPkgs = with pkgs; [
    clang
    direnv
    docker-compose
    fd
    fzf
    gcc
    git
    gnumake
    nodejs
    openjdk17
    ripgrep
    tmux
    unstable.neovim
    vim
    ciscoPacketTracer8
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
    curl
    ffmpeg
    file
    gnome.adwaita-icon-theme
    jq
    killall
    libnotify
    man-pages
    tree
    tree-sitter
    unzip
    wget
    libwacom
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
    grim
    gvfs
    htop-vim
    hyprland
    hyprpicker
    imagemagick
    krita
    libinput
    lutris
    maestral
    mesa
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
    pywal
    rofi
    slurp
    spotify
    steam
    stow
    swappy
    swaynotificationcenter
    swww
    texliveFull
    transmission_4
    unstable.clock-rs
    unstable.hyprland-qtutils
    unstable.hyprlock
    unstable.hyprpolkitagent
    unstable.librewolf
    unstable.mpc
    unstable.obsidian
    unstable.pywalfox-native
    wacomtablet
    waybar
    wayland-protocols
    wineWow64Packages.staging
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
    font-awesome
    nerdfonts
  ];
}
