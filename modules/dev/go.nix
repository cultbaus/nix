{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.dev.go;
in
{
    options.modules.dev.go = {
        enable = mkEnableOption "go";
    };

    config = mkIf cfg.enable {
        home.packages = with pkgs; [
            go
        ];
    };
}
