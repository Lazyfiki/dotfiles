{
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = ["git" "fzf"];
      theme = "robbyrussell";
    };
    syntaxHighlighting.enable = true;
  };
}
