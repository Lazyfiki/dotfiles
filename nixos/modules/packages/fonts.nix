{pkgs, ...}: {
  fonts.packages = with pkgs; [
    inter
    jetbrains-mono
    joypixels
    nerd-fonts.symbols-only
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
  ];
}
