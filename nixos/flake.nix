{
  description = "idk";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    hyprland = {
      url = "github:hyprwm/Hyprland?submodules=1";
    };
    hy3 = {
      url = "github:outfoxxed/hy3";
      inputs.hyprland.follows = "hyprland";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = {
    self,
    nixpkgs,
    hy3,
    hyprland,
    zen-browser,
    ...
  } @ inputs: let
    inherit (self) outputs;
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
      "aarch64-darwin"
      "x86_64-darwin"
    ];
    forAllSystems = nixpkgs.lib.genAttrs systems;
  in {
    packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);

    overlays = import ./overlays {inherit inputs;};
    modules = import ./modules;

    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [
          {
            environment.systemPackages = [
              zen-browser.packages.x86_64-linux.default
            ];
          }
          ./hosts/configuration.nix
        ];
      };
    };
  };
}
