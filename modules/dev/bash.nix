{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.modules.dev.bash;
  extraNodePackages = import ./packages/default.nix { inherit pkgs; };
in
{
  options.modules.dev.bash = {
    enable = mkEnableOption "bash";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      shfmt
      extraNodePackages."bash-language-server"
    ];
  };
}
