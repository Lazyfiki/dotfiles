# {
#   services.tlp = {
#     enable = true;
#     settings = {
#       CPU_SCALING_GOVERNOR_ON_AC = "performance";
#       CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
#
#       CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
#       CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
#
#       CPU_MIN_PERF_ON_AC = 10;
#       CPU_MAX_PERF_ON_AC = 100;
#       CPU_MIN_PERF_ON_BAT = 10;
#       CPU_MAX_PERF_ON_BAT = 20;
#
#       START_CHARGE_THRESH_BAT0 = 25;
#       STOP_CHARGE_THRESH_BAT0 = 90;
#     };
#   };
# }
{
  config,
  pkgs,
  ...
}: {
  # Enable TLP for power management
  services.tlp = {
    enable = true;
    settings = {
      # CPU settings
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      CPU_MIN_PERF_ON_AC = 0; # Allow full range for performance
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0; # Allow CPU to idle effectively
      CPU_MAX_PERF_ON_BAT = 30; # Slightly higher for usability

      # Battery charge thresholds
      START_CHARGE_THRESH_BAT0 = 25;
      STOP_CHARGE_THRESH_BAT0 = 100;

      # Runtime power management for devices
      RUNTIME_PM_ON_AC = "on";
      RUNTIME_PM_ON_BAT = "auto";

      # Intel GPU power management
      INTEL_GPU_MIN_FREQ_ON_AC = 200;
      INTEL_GPU_MIN_FREQ_ON_BAT = 200;
      INTEL_GPU_MAX_FREQ_ON_AC = 1200; # Adjust based on your GPU model
      INTEL_GPU_MAX_FREQ_ON_BAT = 300; # Lower frequency for power saving
      INTEL_GPU_BOOST_FREQ_ON_AC = 1200;
      INTEL_GPU_BOOST_FREQ_ON_BAT = 300;

      # Disk power management
      DISK_IDLE_SECS_ON_AC = 0;
      DISK_IDLE_SECS_ON_BAT = 2;
      MAX_LOST_WORK_SECS_ON_AC = 15;
      MAX_LOST_WORK_SECS_ON_BAT = 60;

      # SATA link power management
      SATA_LINKPWR_ON_AC = "med_power_with_dipm";
      SATA_LINKPWR_ON_BAT = "min_power";

      # USB autosuspend
      USB_AUTOSUSPEND = 1;
      USB_BLACKLIST_WWAN = 1; # Prevent autosuspend of WWAN devices
      USB_AUTOSUSPEND_DISABLE_ON_SHUTDOWN = 1;

      # Wi-Fi power saving
      WIFI_PWR_ON_AC = "off";
      WIFI_PWR_ON_BAT = "on";

      # Bluetooth power saving
      DEVICES_TO_DISABLE_ON_BAT = "bluetooth";
      DEVICES_TO_ENABLE_ON_AC = "bluetooth";
    };
  };

  # Ensure NVIDIA GPU is disabled on battery
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true; # Enable NVIDIA power management
    powerManagement.finegrained = true; # For dynamic power management
    prime = {
      offload.enable = true; # Use offload mode for NVIDIA
      intelBusId = "PCI:0:2:0"; # Adjust based on your system
      nvidiaBusId = "PCI:1:0:0"; # Adjust based on your system
    };
  };

  # Enable bumblebee to manage NVIDIA GPU (alternative to PRIME)
  # hardware.bumblebee.enable = true; # Uncomment if you prefer bumblebee

  # Enable Intel GPU drivers
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [intel-media-driver vaapiIntel];
  };

  # Install tools for monitoring power usage
  environment.systemPackages = with pkgs; [powerstat tlp];

  # Ensure power-profiles-daemon is disabled to avoid conflicts with TLP
  services.power-profiles-daemon.enable = false;
}
