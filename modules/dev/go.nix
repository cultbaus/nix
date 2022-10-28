{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.dev.go;
in
{
  options.modules.dev.go = {
    enable = mkEnableOption "go";
  };

  config = mkIf cfg.enable {
    programs.go = {
      enable = true;
      goPath = ".go";
    };

    home.packages = with pkgs; [
      gotools
    ];
  };
}
