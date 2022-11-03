{ pkgs, ... }:
{
  home.packages = with pkgs; [ gopls gotools ];
  programs.go = {
    enable = true;
    goPath = ".go";
  };
}
