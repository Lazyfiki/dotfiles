{
  services.cloudflare-warp.enable = true;
  systemd.services.NetworkManager-wait-online.enable = false;

  networking = {
    hostName = "legionpro";
    networkmanager.enable = true;

    interfaces.enp12s0 = {
      ipv4.addresses = [
        {
          address = "192.168.10.1";
          prefixLength = 24;
        }
      ];
    };

    firewall = {
      enable = true;
      allowedTCPPorts = [80 443 24800];
      allowedUDPPortRanges = [
        {
          from = 4000;
          to = 4007;
        }
        {
          from = 8000;
          to = 8010;
        }
      ];
    };
  };
}
