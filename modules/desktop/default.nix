{ config, pkgs, lib, ... }:
{
  imports = [
    ./picom.nix
    ./i3.nix
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
