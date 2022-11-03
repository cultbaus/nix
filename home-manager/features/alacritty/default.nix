{
  programs.alacritty = {
    enable = true;
    settings = {
      colors = import ./colors/gruvbox-material.nix { };
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
