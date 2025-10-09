{
  programs.git = {
    enable = true;
    userName = "Ahmed Hamzaoui";
    userEmail = "lazyfiki@gmail.com";
    extraConfig = {
      core = {
        compression = 9;
        whitespace = "error";
        preloadindex = true;
      };

      advice = {
        addEmptyPathspec = false;
        pushNonFastForward = false;
        statusHints = false;
      };

      init = {
        defaultBranch = "master";
      };

      url = {
        "git@github.com:Lazyfiki/" = {
          insteadOf = "ahmed:";
        };
      };
    };
  };
}
