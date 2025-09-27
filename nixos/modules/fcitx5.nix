{
  config,
  pkgs,
  ...
}: {
  i18n.inputMethod = {
    enable = true;
    # type = "fcitx5";
  };

  environment.systemPackages = with pkgs; [
    fcitx5
    fcitx5-mozc
    fcitx5-gtk
    ibus-engines.mozc
  ];

  i18n.inputMethod.ibus = {
    engines = with pkgs.ibus-engines; [mozc];
  };

  environment.variables = {
    GTK_IM_MODULE = "ibus";
    QT_IM_MODULE = "ibus";
    XMODIFIERS = "@im=ibus";
  };
}
