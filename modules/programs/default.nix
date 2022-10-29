{ config, pkgs, libs, ... }:

{
  imports = [
    ./alacritty
    ./neovim
  ];

  home.packages = with pkgs; [
    firefox
    wget
    vim
  ];
}
