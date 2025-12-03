{
  inputs,
  outputs,
  config,
  lib,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager

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
        "electron-25.9.0"
      ];
    };
  };

  fileSystems."/home/ahmed/pub/share" = {
    device = "//192.168.10.2/Storage";
    fsType = "cifs";
    options = ["credentials=/etc/samba/smbcredentials" "uid=1000" "gid=1000"];
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs outputs;};
    users = {
      ahmed = import ../../home-manager/home.nix;
    };
  };

  networking.hostName = "legionpro";

  system = {
    autoUpgrade = {
      enable = true;
      dates = "weekly";
    };

    stateVersion = "25.11";
  };
}
