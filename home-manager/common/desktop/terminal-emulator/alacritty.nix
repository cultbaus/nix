{ pkgs
, lib
, config
, inputs
, ...
}:
{
  programs.alacritty = {
    enable = true;
    settings = {
      colors = pkgs.themes.gruvbox-material;
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
