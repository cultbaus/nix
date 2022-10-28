{ config, pkgs, libs, ... }:

{
  imports = [
    ./alacritty.nix
  ];

  home.packages = with pkgs; [
    firefox
    wget
    vim
  ];
}
