{
  config,
  pkgs,
  ...
}: {
  services.rkvm = {
    enable = true;
    package = pkgs.rkvm;

    server = {
      enable = true;
      settings = {
        listen = "0.0.0.0:5258";
        switch-keys = ["super" "."];
        certificate = "/etc/rkvm/certificate.pem";
        key = "/etc/rkvm/key.pem";
        password = "1919est1919";
      };
    };
  };

  networking.firewall.allowedTCPPorts = [5258];
}
