{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # outputs.homeManagerModules.spicetify

    ./git.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "ahmed";
    homeDirectory = "/home/ahmed";
  };

  home.packages = with pkgs; [
    inputs.quickshell.packages.x86_64-linux.default
    inputs.zen-browser.packages.x86_64-linux.default
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
    unstable.yacreader
    unzip
    vim
    wget
    winetricks
    wl-clipboard
    youtube-music
    zathura
  ];

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.11";
}
