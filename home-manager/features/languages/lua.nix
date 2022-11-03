{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lua
    lua52Packages.luarocks
    sumneko-lua-language-server
    stylua
  ];
}
