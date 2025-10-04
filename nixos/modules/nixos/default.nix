{
  audio = import ./audio.nix;
  bluetooth = import ./bluetooth.nix;
  bootloader = import ./bootloader.nix;
  docker = import ./docker.nix;
  fcitx5 = import ./fcitx5.nix;
  firewall = import ./firewall.nix;
  hyprland = import ./hyprland.nix;
  power = import ./power.nix;
  spicetify = import ./spicetify.nix;
  ssh = import ./ssh.nix;
  users = import ./users.nix;
  zram = import ./zram.nix;
  zsh = import ./zsh.nix;
}
