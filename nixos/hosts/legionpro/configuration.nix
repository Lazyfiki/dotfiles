{
  inputs,
  outputs,
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../../modules/core
    ../../modules/packages
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
        "ciscoPacketTracer8-8.2.2"
        "electron-25.9.0"
      ];
    };
  };

  fileSystems."/home/ahmed/pub/share" = {
    device = "//192.168.10.2/Storage";
    fsType = "cifs";
    options = [
      "credentials=/etc/samba/smbcredentials"
      "uid=1000"
      "gid=1000"
      "_netdev"
      "x-systemd.automount"
    ];
  };

  system = {
    autoUpgrade = {
      enable = true;
      flake = "/home/ahmed/.dotfiles/nixos#legionpro";
      dates = "daily";
    };

    stateVersion = "25.11";
  };
}
