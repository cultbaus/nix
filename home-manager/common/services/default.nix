{ pkgs
, lib
, config
, inputs
, ...
}:
{
  imports = [
    ./mopidy.nix
    ./mpd.nix
    ./picom.nix
  ];
}
