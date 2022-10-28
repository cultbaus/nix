{ config, pkgs, lib, ... }:

with lib;
let cfg = config.modules.editors.neovim;
in
{
  options.modules.editors.neovim = {
    enable = mkEnableOption "neovim";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      neovim-nightly
      stylua
    ];
  };
}
