{ pkgs, ... }:
{
  users.users.edshaw = {
    description = "Ed Shaw";
    extraGroups = [ "wheel" ];
    isNormalUser = true;
    shell = pkgs.zsh;
    uid = 1000;
  };
}
