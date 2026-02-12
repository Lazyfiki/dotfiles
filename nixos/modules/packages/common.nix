{
  pkgs,
  inputs,
  ...
}: let
  hyprland = with pkgs; [
    grim
    hyprlock
    hyprpicker
    hyprpolkitagent
    hyprshade
    hyprshot
    inputs.quickshell.packages.x86_64-linux.default
    swappy
    swaynotificationcenter
    swww
    unstable.hyprland-qtutils
    unstable.pyprland
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
    starship
    tmux
    tree
    unzip
    wget
  ];

  dev = with pkgs; [
    freerdp
    pkg-config
    stow
    tree-sitter
    unstable.neovim
    vim
    wine64
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
    pureref
    pywal16
  ];

  apps = with pkgs; [
    aircrack-ng
    brightnessctl
    cifs-utils
    dconf-editor
    ddcutil
    discord
    docker-compose
    foremost
    gjs
    glib
    gvfs
    hashcat
    libinput
    libnotify
    libwacom
    localsend
    maestral
    man-pages
    mesa
    metasploit
    nautilus
    nmap
    qemu
    rofi
    udiskie
    unstable.bottles
    unstable.ciscoPacketTracer9
    unstable.obsidian
    vicinae
    winetricks
    wireshark
    xdg-utils
    zathura
  ];
in {
  environment.systemPackages = hyprland ++ browsers ++ cli ++ dev ++ media ++ graphics ++ apps;
}
