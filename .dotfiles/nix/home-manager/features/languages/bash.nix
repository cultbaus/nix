{ config, pkgs, lib, ... }:
with lib;
let
  extraNodePackages = import ./packages/default.nix { inherit pkgs; };
in
{
  home.packages = with pkgs; [
    shfmt
    extraNodePackages."bash-language-server"
  ];
}
