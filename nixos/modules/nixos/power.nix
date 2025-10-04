{
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 10;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 10;
      CPU_MAX_PERF_ON_BAT = 50;

      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;

      USB_AUTOSUSPEND = 1;
      PCIE_ASPM_ON_BAT = "powersupersave";

      SATA_LINKPWR_ON_BAT = "min_power";
      SATA_LINKPWR_ON_AC = "med_power";

      WIFI_PWR_ON_BAT = "on";

      RUNTIME_PM_ON_BAT = "auto";
      RUNTIME_PM_ON_AC = "auto";
      NVIDIA_RUNTIME_PM = "auto";

      START_CHARGE_THRESH_BAT0 = 25;
      STOP_CHARGE_THRESH_BAT0 = 90;
    };
  };
}
