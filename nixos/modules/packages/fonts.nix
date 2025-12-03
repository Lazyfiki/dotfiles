{pkgs, ...}: {
  fonts.packages = with pkgs; [
    inter
    jetbrains-mono
    joypixels
    nerd-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
  ];
}
