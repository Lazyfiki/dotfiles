{
  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = ["nodev"];
      efiSupport = true;
      useOSProber = true;
    };
  };

  boot.kernelModules = ["i2c-dev"];
  hardware.i2c.enable = true;
}
