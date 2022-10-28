{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.dev.node;
in
{
    options.modules.dev.node = {
        enable = mkEnableOption "node";
    };

    config = mkIf cfg.enable {
        home.packages = with pkgs; [
            nodejs
	        yarn
        ];
    };
}
