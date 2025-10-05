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
    theme = spicePkgs.themes.ziro;

    injectCss = true;
    injectThemeJs = true;
    replaceColors = true;
    homeConfig = true;
    overwriteAssets = true;
    additionalCss = "";

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
