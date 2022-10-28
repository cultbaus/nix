{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.modules.dev.node;
  extraNodePackages = import ./packages/default.nix { };
in
{
  options.modules.dev.node = {
    enable = mkEnableOption "node";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      extraNodePackages."@fsouza/prettierd"
      extraNodePackages.eslint_d
      extraNodePackages.typescript
      nodejs
      yarn
    ];
  };
}
