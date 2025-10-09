{pkgs, ...}: {
  fonts.packages = with pkgs; [
    inter
    jetbrains-mono
    joypixels
    nerdfonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
  ];
}
