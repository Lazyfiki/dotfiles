{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    outputs.homeManagerModules.spicetify
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
    quickshell.packages.x86_64-linux.default
    zen-browser.packages.x86_64-linux.default
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

  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = ["git" "fzf"];
      theme = "robbyrussell";
    };
    syntaxHighlighting.enable = true;
  };

  programs.git = {
    enable = true;
    userName = "Ahmed Hamzaoui";
    userEmail = "lazyfiki@gmail.com";
    extraConfig = {
      core = {
        compression = 9;
        whitespace = "error";
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

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.11";
}
