{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    # outputs.homeManagerModules.example

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
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

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [
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

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "Ahmed Hamzaoui";
    userEmail = "lazyfiki@gmail.com";
    extraConfig = {
      core = {
        compression = 9;
        whitespace = error;
        preloadindex = true;
      };

      advice = {
        addEmptyPathspec = false;
        pushNonFastForward = false;
        statusHints = false;
      };

      init = {
        defaultBranch = "master";
      };

      url = {
        "git@github.com:Lazyfiki/" = {
          insteadOf = "ahmed:";
        };
      };
    };
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.11";
}
