{ config, pkgs, lib, ... }:
with lib;
let
  extraNodePackages = import ./packages/default.nix { inherit pkgs; };
in
{
  home.packages = with pkgs; [
    nodejs
    yarn
    extraNodePackages."typescript"
    extraNodePackages."typescript-language-server"
    extraNodePackages."@fsouza/prettierd"
    extraNodePackages."eslint_d"
  ];
}
