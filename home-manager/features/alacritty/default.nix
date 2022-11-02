{ config, ... }:
let
  scheme = import ./colors/gruvbox-material.nix { };
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
