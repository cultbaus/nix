{ pkgs
, lib
, config
, input
, ...
}:
{
  home.packages = with pkgs; [
    teams
    rocketchat-desktop
  ];
}
