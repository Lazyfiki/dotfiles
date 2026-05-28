{
  config,
  pkgs,
  ...
}: {
  users.users = {
    ahmed = {
      shell = pkgs.zsh;
      isNormalUser = true;
      extraGroups = ["docker" "video" "audio" "networkmanager" "wheel" "input" "uinput" "libvirtd" "kvm"];
      openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIODydFL3CPB8ozo9aeOVesL1irCnRLCxVjvip11S4NXt lazyfiki@gmail.com"
      ];
    };
  };
}
