{ config, pkgs, lib, ... }:
with lib;
{
  home.packages = with pkgs; [
    lua
    lua52Packages.luarocks
    sumneko-lua-language-server
    stylua
  ];
}
