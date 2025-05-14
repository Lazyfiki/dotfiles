{ config, lib, pkgs, ... }:
{

  # hardware.graphics = {
  #   enable = true;
  # };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    prime = {
      sync.enable = true;

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };

    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
