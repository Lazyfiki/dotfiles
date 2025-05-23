{inputs, ...}: {
  additions = final: _prev: import ../pkgs final.pkgs;

  modifications = final: prev: {
    ciscoPacketTracer8 = prev.ciscoPacketTracer8.overrideAttrs (oldAttrs: {
      src = final.fetchurl {
        url = "https://archive.org/download/cpt822/CiscoPacketTracer822_amd64_signed.deb";
        sha256 = "sha256-bNK4iR35LSyti2/cR0gPwIneCFxPP+leuA1UUKKn9y0=";
      };
    });
  };

  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
