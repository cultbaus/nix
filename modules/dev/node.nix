{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.modules.dev.node;
  extraNodePackages = import ./packages/default.nix { inherit pkgs; };
in
{
  options. modules. dev. node = {
    enable = mkEnableOption "node";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      nodejs
      yarn
      extraNodePackages."typescript"
      extraNodePackages."typescript-language-server"
      extraNodePackages."@fsouza/prettierd"
      extraNodePackages."eslint_d"
    ];
  };
}
