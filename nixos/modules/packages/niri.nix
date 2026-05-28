{
  inputs,
  pkgs,
  ...
}: {
  programs.niri = {
    enable = true;
    package = pkgs.unstable.niri;
  };

  environment = {
    systemPackages = with pkgs; [
      xwayland-satellite
    ];

    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland";
      MOZ_ENABLE_WAYLAND = "1";
    };
  };
}
