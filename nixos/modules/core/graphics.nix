{pkgs, ...}: {
  services.xserver.videoDrivers = ["nvidia" "modesetting"];
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;

      extraPackages = with pkgs; [
        nvidia-vaapi-driver
        libva-vdpau-driver
        libvdpau-va-gl
      ];
    };

    nvidia = {
      modesetting.enable = true;

      powerManagement = {
        enable = true;
        finegrained = true;
      };

      open = false;
      nvidiaSettings = true;
      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
}
