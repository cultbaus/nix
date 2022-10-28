{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.dev.fmt;
in
{
  options.modules.dev.fmt = {
    enable = mkEnableOption "fmt";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      shfmt
      clang-tools
    ];
  };
}
