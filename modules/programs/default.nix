{ config, pkgs, libs, ... }:

{
  imports = [
    ./alacritty.nix
    ./neovim
  ];

  home.packages = with pkgs; [
    firefox
    wget
    vim
  ];
}
