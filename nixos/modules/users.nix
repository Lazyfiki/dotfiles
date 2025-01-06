{
  config,
  pkgs,
  ...
}: {
  programs.zsh.enable = true;

  users.users = {
    ahmed = {
      shell = pkgs.zsh;
      isNormalUser = true;
      extraGroups = ["audio" "networkmanager" "wheel"];
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCvZxkTjGzquehQVr3sFWZK2D6PIW3fmdfdbwv5HUsrsNThpxF0M5rUfFKkT8K/T7wTGG5FB2SyHIdPp97HauUnAcPgubVUBwG1aTCqQXUUn6/P53Y4ffj1lcNT2t9b/O39ceQvrQEcr0lHyG5BDRRciZ9JZuF+SUCBUbudQ6up2boPuV0yUvHUhtkY6lZ3TSBlFD7+2LjyxmOCD7o74uE8QuVf+gOQhnLXSDlw2bRIetBzJB42t/IFgQOkrgpZ5KjagwkFBf3p/AosDKwHaDWxpq7Bw+FEUF6O/iSLU9FFLdJ4oAU/JW1tTLkK/HZUDa3sDj+a6caSwod7PKXpzYm7rSH00jy+C7ppKpS7Yc/2U4adPpUuA4BKtrIOiPnrCMRyY4I+SktCm+7S7DV9ABAW/rVNn6HjZcMZaB4Zqbz+ZjrMKy1uJuO80vG7e+uQZCisYmkyEl5622IOlBLSO/rjYhgjhqL6ihpl+wwnsx/iro4ILreuBO1icwQHfy5xgEeZzlWc+iAfSg1xr03+xn21X3Gh3kihPYsAwJTbCQEefzA/Ku4FcfJN+6stSQWRfMTS2Y52EMaaDBIlDf54LMKgUj3Ci1wONsgU4xcr1u3G4McrY5hWALOVwatQugrqKkhibttLVaHpkWJkb3AgRwkJf3tjhWV8/YWnSBDT1jcDBQ== lazyfiki@gmail.com"
      ];
    };
  };
}
