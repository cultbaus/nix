{ pkgs
, lib
, config
, inputs
, ...
}:
let
  theme = pkgs.themes.gruvbox-material;
in
{
  programs.zathura = {
    enable = true;
    options = {
      recolor = true;
      default-bg = theme.primary.background;
    };
  };
}
