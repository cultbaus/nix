{ configs, pkgs, libs, ... }:

let
  scheme = {
    primary = {
      background = "0x1d2021";
      foreground = "0xd4be98";
    };
    normal = {
      black = "0x32302f";
      red = "0xea6962";
      green = "0xa9b665";
      yellow = "0xd8a657";
      blue = "0x7daea3";
      magenta = "0xd3869b";
      cyan = "0x89b482";
      white = "0xd4be98";
    };
    bright = {
      black = "0x32302f";
      red = "0xea6962";
      green = "0xa9b665";
      yellow = "0xd8a657";
      blue = "0x7daea3";
      magenta = "0xd3869b";
      cyan = "0x89b482";
      white = "0xd4be98";
    };
  };
in
{
  programs.alacritty = {
    enable = true;
    settings = {
      colors = scheme;
      env.term = "alacritty";
      window = {
        dimensions = {
          columns = 50;
          lines = 12;
        };
        padding = {
          x = 30;
          y = 30;
        };
      };
      font = {
        size = 9;
        offset = {
          x = 0;
          y = 5;
        };
      };
    };
  };
}
