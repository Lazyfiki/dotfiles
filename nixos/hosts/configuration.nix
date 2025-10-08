{
  inputs,
  outputs,
  lib,
  config,
  ...
}: {
  imports = [
    outputs.nixosModules.bluetooth
    outputs.nixosModules.audio
    outputs.nixosModules.bootloader
    outputs.nixosModules.docker
    outputs.nixosModules.fcitx5
    outputs.nixosModules.firewall
    outputs.nixosModules.hyprland
    outputs.nixosModules.power
    outputs.nixosModules.ssh
    outputs.nixosModules.users
    outputs.nixosModules.zram
    outputs.nixosModules.zsh

    inputs.home-manager.nixosModules.home-manager

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

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs;};
    users = {
      ahmed = import ../home-manager/home.nix;
    };
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
      nssmdns4 = true;
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
