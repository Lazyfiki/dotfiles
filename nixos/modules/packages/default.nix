{
  audio = import ./audio.nix;
  bluetooth = import ./bluetooth.nix;
  fcitx5 = import ./fcitx5.nix;
  fontPkgs = import ./fonts.nix;
  hyprland = import ./hyprland.nix;
  packages = import ./packages.nix;
  ssh = import ./ssh.nix;
  zsh = import ./zsh.nix;
}
