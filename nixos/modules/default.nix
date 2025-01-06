{
  audio = import ./audio.nix;
  bluetooth = import ./bluetooth.nix;
  bootloader = import ./bootloader.nix;
  firewall = import ./firewall.nix;
  ssh = import ./ssh.nix;
  users = import ./users.nix;
  zram = import ./zram.nix;
}
