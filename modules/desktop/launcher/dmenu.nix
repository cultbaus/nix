{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.modules.desktop.launcher.dmenu;
in
{
  options.modules.desktop.launcher.dmenu = {
    enable = mkEnableOption "dmenu";
  };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [ dmenu ];
  };
}
