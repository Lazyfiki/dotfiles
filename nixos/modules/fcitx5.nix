{pkgs, ...}: {
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
  };

  environment.systemPackages = with pkgs; [
    fcitx5
    fcitx5-mozc
    fcitx5-gtk
  ];
}
