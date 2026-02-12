{inputs, ...}: {
  additions = final: _prev: import ../pkgs final.pkgs;

  modifications = final: prev: {
    ciscoPacketTracer8 = prev.ciscoPacketTracer8.overrideAttrs (oldAttrs: {
      src = "../../../dl/cisco/CiscoPacketTracer_900_Ubuntu_64bit.deb";
      hash = "sha256-3ZrA1Mf8N9y2j2J/18fm+m1CAMFEklJuVhi5vRcu2SA=";
    });
  };

  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
