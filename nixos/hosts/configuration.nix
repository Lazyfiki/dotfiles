{
  inputs,
  outputs,
  lib,
  config,
  ...
}: {
  imports = [
    outputs.modules.audio
    outputs.modules.bluetooth
    outputs.modules.bootloader
    outputs.modules.docker
    outputs.modules.firewall
    outputs.modules.hyprland
    outputs.modules.power
    outputs.modules.spicetify
    outputs.modules.ssh
    outputs.modules.users
    outputs.modules.zram
    outputs.modules.zsh

    ./packages.nix
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
      joypixels.acceptLicense = true;
      permittedInsecurePackages = [
        "electron-25.9.0"
      ];
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      flake-registry = "";
      nix-path = config.nix.nixPath;
      auto-optimise-store = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 10d";
    };

    channel.enable = false;
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  networking.hostName = "nixos";

  services.xserver.enable = false;
  programs.steam.enable = true;

  networking.networkmanager.enable = true;

  time.timeZone = "Africa/Tunis";

  # i18n.defaultLocale = "en_US.UTF-8";
  i18n.defaultLocale = "ja_JP.UTF-8";

  i18n.inputMethod = {
    enabled = "fcitx5";
  };

  services.logind = {
    lidSwitch = "suspend";
    lidSwitchDocked = "ignore";
    lidSwitchExternalPower = "ignore";
  };

  system = {
    autoUpgrade = {
      enable = true;
      dates = "weekly";
    };

    stateVersion = "24.11";
  };
}
