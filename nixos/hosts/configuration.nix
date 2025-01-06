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
    outputs.modules.firewall
    outputs.modules.ssh
    outputs.modules.users
    outputs.modules.zram

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
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      flake-registry = "";
      nix-path = config.nix.nixPath;
    };

    gc = {
      automatic = true;
      dates = "weekly";
    };

    channel.enable = false;
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  networking.hostName = "nixos";

  services.xserver = {
    enable = true;
    xkb.options = "caps:escape";
    wacom.enable = true;
    displayManager.startx.enable = true;
    windowManager.dwm.enable = true;
    libinput = {
      enable = true;
      touchpad = {
        naturalScrolling = true;
        disableWhileTyping = true;
      };
    };
  };

  networking.networkmanager.enable = true;

  time.timeZone = "Africa/Tunis";

  i18n.defaultLocale = "en_US.UTF-8";

  system.stateVersion = "24.11";
}
