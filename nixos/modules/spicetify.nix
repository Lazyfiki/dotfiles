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
    colorScheme = "mocha"; # Re-enabled for hazy theme compatibility

    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle
    ];

    # Optional: Add marketplace to browse more themes/extensions
    enabledCustomApps = with spicePkgs.apps; [
      marketplace
    ];
  };
}
