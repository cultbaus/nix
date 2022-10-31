{ config, pkgs, libs, ... }:

{
  imports = [
    ./alacritty
    ./ncmpcpp
    ./neovim
  ];

  home.packages = with pkgs; [
    firefox
    wget
    vim
  ];
}
