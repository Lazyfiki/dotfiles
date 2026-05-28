{
  pkgs,
  inputs,
  ...
}: let
  wm = with pkgs; [
    alsa-utils
    bluez
    cliphist
    easyeffects
    grim
    hyprlock
    hyprpicker
    hyprpolkitagent
    hyprshade
    inputs.quickshell.packages.x86_64-linux.default
    inputs.scopebuddy.packages.x86_64-linux.default
    libsForQt5.qt5ct
    mako
    pamixer
    pavucontrol
    qt6Packages.qtstyleplugin-kvantum
    swappy
    swww
    waybar
    wayland-protocols
    wl-clipboard
    xwayland
    xwayland-satellite
    ydotool
  ];

  browsers = with pkgs; [
    chromium
    firefox
    inputs.zen-browser.packages.x86_64-linux.default
  ];

  cli = with pkgs; [
    unrar
    bc
    curl
    direnv
    fd
    file
    fzf
    ghostty
    git
    htop-vim
    jq
    killall
    ripgrep
    tmux
    tree
    unzip
    wget
  ];

  dev = with pkgs; [
    cabextract
    ctags
    freerdp
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-good
    pkg-config
    stow
    tree-sitter
    unstable.neovim
    unzip
    vim
    wget
    winetricks
    wmctrl
    xorg.xprop
  ];

  media = with pkgs; [
    ffmpeg
    ffmpegthumbnailer
    gst_all_1.gst-libav
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gstreamer
    mpc
    mpd
    mpv
    ncmpcpp
    pavucontrol
    playerctl
    pulseaudio
    pulsemixer
    qbittorrent
    youtube-music
  ];

  graphics = with pkgs; [
    adwaita-icon-theme
    bibata-cursors
    gimp
    imagemagick
    krita
    nsxiv
    pywal16
    unstable.pureref
  ];

  apps = with pkgs; [
    aircrack-ng
    ardour
    bottles
    brightnessctl
    cifs-utils
    dconf-editor
    ddcutil
    discord
    docker-compose
    foremost
    gamemode
    gamescope
    gamescope-wsi
    gjs
    glib
    gvfs
    hashcat
    libinput
    libnotify
    libwacom
    localsend
    lutris
    maestral
    man-pages
    mesa
    metasploit
    nmap
    picard
    protonup-qt
    qemu
    rofi
    udiskie
    unstable.ciscoPacketTracer9
    unstable.heroic
    unstable.nautilus
    unstable.obsidian
    unstable.wine64
    vicinae
    winetricks
    wireshark
    xdg-utils
    zathura
  ];
in {
  environment.systemPackages = wm ++ browsers ++ cli ++ dev ++ media ++ graphics ++ apps;

  programs.steam = {
    enable = true;
    extest.enable = true;

    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  xdg = {
    menus.enable = true;
    mime.enable = true;
  };
}
