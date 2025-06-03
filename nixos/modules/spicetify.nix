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

    theme = spicePkgs.themes.hazy;
    # colorScheme = "mocha";

    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle # shuffle+ (special characters are sanitized out of extension names)
    ];
  };
}
