{
  config,
  pkgs,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  imports = [
    inputs.spicetify-nix.nixosModules.default
  ];

  programs.spicetify = {
    enable = true;
    spotifyPackage = pkgs.spotify;

    theme = spicePkgs.themes.hazy;
    colorScheme = "Base"; # Re-enabled for hazy theme compatibility

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      adblockify
      hidePodcasts
      shuffle
    ];

    enabledCustomApps = with spicePkgs.apps; [
      marketplace
      # lyricsPlus
      # localFiles
    ];
  };
}
