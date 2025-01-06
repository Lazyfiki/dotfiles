{pkgs, ...}: let
  localPkgs = with pkgs; [
    dmenu
    dwm
    st
  ];

  devPkgs = with pkgs; [
    clang
    direnv
    fd
    fzf
    git
    gnumake
    ripgrep
    tmux
    unstable.neovim
    vim
  ];

  lspPkgs = with pkgs; [
    clang-tools
    lua-language-server
    nil
    nodePackages.typescript-language-server
    rust-analyzer
  ];

  utils = with pkgs; [
    brightnessctl
    curl
    ffmpeg
    file
    gnome.adwaita-icon-theme
    jq
    killall
    libnotify
    man-pages
    picom
    tree
    unzip
    wget
    xclip
    xdotool
    xorg.xinit
    xorg.xsetroot
  ];

  apps = with pkgs; [
    chromium
    dunst
    firefox
    gimp
    htop-vim
    imagemagick
    krita
    maestral
    maim
    mpd
    mpv
    ncmpcpp
    nsxiv
    obs-studio
    pamixer
    pywal
    stow
    sxhkd
    transmission_4
    unclutter
    unstable.mpc
    unstable.pywalfox-native
    xwallpaper
    zathura
    zsh-syntax-highlighting
  ];
in {
  environment.systemPackages = apps ++ devPkgs ++ localPkgs ++ lspPkgs ++ utils;

  fonts.packages = with pkgs; [
    jetbrains-mono
    joypixels
    font-awesome
  ];
}
