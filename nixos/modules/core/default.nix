{
  boot = import ./boot.nix;
  locale = import ./locale.nix;
  network = import ./network.nix;
  nix-settings = import ./nix-settings.nix;
  power = import ./power.nix;
  users = import ./users.nix;
  virtualisation = import ./virtualisation.nix;
  zram = import ./zram.nix;
}
