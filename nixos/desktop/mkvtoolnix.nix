{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ mkvtoolnix ];
}
