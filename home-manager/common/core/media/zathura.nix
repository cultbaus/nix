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
      default-fg = theme.primary.foreground;
      recolor-darkcolor = theme.primary.foreground;
      recolor-lightcolor = theme.primary.background;
      notification-bg = theme.normal.black;
      notification-fg = theme.primary.foreground;
      statusbar-bg = theme.normal.black;
      statusbar-fg = theme.primary.background;
      statusbar-home-tilde = true;
    };
  };
}
