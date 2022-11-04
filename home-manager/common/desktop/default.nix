{ pkgs
, lib
, config
, inputs
, ...
}:
{
  imports = [
    ./app-launcher
    ./terminal-emulator
    ./window-manager
  ];

  home = {
    pointerCursor = {
      name = "capitaine-cursors-white";
      package = pkgs.capitaine-cursors;
      size = 64;
      x11.enable = true;
    };
  };
}
