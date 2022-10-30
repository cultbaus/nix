{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.modules.desktop.wm.awesome;
  awesomeConfig = "${config.home.homeDirectory}/nix/config/awesome";
in
{
  options.modules.desktop.wm.awesome = {
    enable = mkEnableOption "awesome";
  };
  config = mkIf cfg.enable {
    home.file = {
      ".config/awesome".source = config.lib.file.mkOutOfStoreSymlink awesomeConfig;
    };
    xsession.windowManager.awesome = {
      enable = true;
      package = pkgs.awesome-git;
    };
  };
}
