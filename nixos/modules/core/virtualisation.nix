{
  virtualisation = {
    docker.enable = false;
    waydroid.enable = false;

    libvirtd = {
      enable = true;
      qemu = {
        runAsRoot = true;
        swtpm.enable = true;
      };
    };
  };

  programs.virt-manager.enable = true;
}
