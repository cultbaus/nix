{ pkgs
, lib
, config
, inputs
, ...
}:
{
  home.packages = with pkgs; [
    discord
  ];
}
