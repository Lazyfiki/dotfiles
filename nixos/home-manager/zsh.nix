{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "fzf"];
      theme = "robbyrussell";
    };
    syntaxHighlighting.enable = true;
  };
}
