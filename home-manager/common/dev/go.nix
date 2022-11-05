{ pkgs
, config
, lib
, inputs
, ...
}:
{
  programs.go = {
    enable = true;
    goPath = ".go";
  };
  home = {
    packages = with pkgs; [ gopls gotools ];
  };
}
