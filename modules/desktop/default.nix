{ config, pkgs, lib, ... }:
{
  imports = [
    ./launcher
    ./picom.nix
    ./wm
  ];

  home.pointerCursor = {
    name = "capitaine-cursors-white";
    package = pkgs.capitaine-cursors;
    size = 64;
    x11.enable = true;
  };

  xsession = {
    enable = true;
  };
}
