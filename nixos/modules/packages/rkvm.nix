{
  config,
  pkgs,
  ...
}: {
  services.rkvm = {
    enable = true;
    package = pkgs.rkvm;
    server.enable = true;
  };

  networking.firewall.allowedTCPPorts = [57892];
}
