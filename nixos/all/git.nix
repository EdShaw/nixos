{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ gh git-crypt ];
  programs.git = {
    enable = true;
    config = {
      init = {
        defaultBranch = "main";
      };
      pull = {
        rebase = true;
      };
      push = {
        autoSetupRemote = true;
      };
      user = {
        email = "edwardshaw9@gmail.com";
        name = "Ed Shaw";
      };
    };
  };
}
