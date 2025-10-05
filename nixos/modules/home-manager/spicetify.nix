{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in {
  imports = [inputs.spicetify-nix.homeManagerModules.default];

  programs.spicetify = {
    enable = true;
    # theme = spicePkgs.themes.text;

    theme = {
      name = "Bloom";

      src = pkgs.fetchFromGitHub {
        owner = "nimsandu";
        repo = "spicetify-bloom";
        rev = "main";
        hash = "sha256-+pIf2N/yR8XwltRStSePUWDkm2x96hBbDrHbCF8a86k=";
      };

      injectCss = true;
      injectThemeJs = true;
      replaceColors = true;
      homeConfig = true;
      overwriteAssets = true;
      additionalCss = "";
    };

    enabledExtensions = with spicePkgs.extensions; [
      playlistIcons
      lastfm
      historyShortcut
      hidePodcasts
      adblock
      fullAppDisplay
      keyboardShortcut
    ];
  };
}
