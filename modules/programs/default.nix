{ config, pkgs, libs, ... }:

{
  imports = [
    ./alacritty.nix
    ./neovim.nix
  ];

  home.packages = with pkgs; [
    firefox
    wget
    vim
  ];
}
