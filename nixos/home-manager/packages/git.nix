{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Ahmed Hamzaoui";
        email = "lazyfiki@gmail.com";
      }
    };
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
}
