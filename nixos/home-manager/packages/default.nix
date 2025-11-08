{
  inputs,
  outputs,
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./git.nix
    ./spicetify.nix
  ];

  # services.vicinae = {
  #   enable = true; # default: false
  #   autoStart = true; # default: true
  #   # package = # specify package to use here. Can be omitted.
  # };

  home.packages = with pkgs; [
    inputs.quickshell.packages.x86_64-linux.default
    inputs.zen-browser.packages.x86_64-linux.default
    inputs.vicinae.packages.${pkgs.system}.vicinae
    # rkvm
    bat
    bc
    bottles
    chromium
    curl
    dconf-editor
    direnv
    discord
    fd
    firefox
    fzf
    ghostty
    gimp
    git
    htop-vim
    jq
    krita
    maestral
    mpc-cli
    mpv
    nautilus
    ncmpcpp
    nodejs
    nsxiv
    pavucontrol
    playerctl
    pulsemixer
    pureref
    pywal16
    qbittorrent
    ripgrep
    rofi-wayland
    stow
    swappy
    swaynotificationcenter
    swww
    tmux
    transmission_4
    tree
    tree-sitter
    unstable.clock-rs
    unstable.neovim
    unzip
    vim
    wget
    winetricks
    wl-clipboard
    yacreader
    youtube-music
    zathura
  ];
}
