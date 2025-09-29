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
    outputs.modules.fcitx5
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
      dates = "monthly";
      options = "--delete-older-than 10d";
    };

    channel.enable = false;
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  time.timeZone = "Africa/Tunis";

  i18n.defaultLocale = "ja_JP.UTF-8";

  virtualisation.waydroid.enable = true;

  services = {
    xserver.enable = false;
    udisks2.enable = true;
    logind = {
      lidSwitch = "suspend";
      lidSwitchDocked = "ignore";
      lidSwitchExternalPower = "ignore";
    };
    avahi = {
      enable = true;
      nssmdns = true;
      openFirewall = true;
      publish = {
        enable = true;
        userServices = true;
        addresses = true;
      };
    };
  };

  system = {
    autoUpgrade = {
      enable = true;
      dates = "weekly";
    };

    stateVersion = "24.11";
  };
}
