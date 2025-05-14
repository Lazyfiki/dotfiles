{
  audio = import ./audio.nix;
  bluetooth = import ./bluetooth.nix;
  bootloader = import ./bootloader.nix;
  docker = import ./docker.nix;
  firewall = import ./firewall.nix;
  nvidia = import ./nvidia.nix;
  power = import ./power.nix;
  spicetify = import ./spicetify.nix;
  ssh = import ./ssh.nix;
  users = import ./users.nix;
  zram = import ./zram.nix;
  zsh = import ./zsh.nix;
}
