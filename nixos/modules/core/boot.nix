{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        devices = ["nodev"];
        efiSupport = true;
        useOSProber = true;
      };
    };
  };

  hardware.cpu.intel.updateMicrocode = true;
  services = {
    fwupd.enable = true;
    fstrim.enable = true;
  };
}
