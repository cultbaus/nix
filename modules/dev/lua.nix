{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.dev.lua;
in
{
  options.modules.dev.lua = {
    enable = mkEnableOption "lua";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      luajit
      lua52Packages.luarocks
    ];
  };
}
