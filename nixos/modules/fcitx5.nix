{pkgs, ...}: {
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    package = pkgs.fcitx5;
    addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
    ];
  };
}
