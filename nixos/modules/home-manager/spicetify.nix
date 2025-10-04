{
  lib,
  pkgs,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  options.programs.spicetify.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable Spicetify customization for Spotify.";
  };

  config = lib.mkIf config.programs.spicetify.enable {
    home.packages = [pkgs.spotify];

    programs.spicetify = {
      enable = true;
      spotifyPackage = pkgs.spotify;
      theme = spicePkgs.themes.hazy;
      colorScheme = "Base";
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        adblockify
        hidePodcasts
        shuffle
      ];
    };
  };
}
