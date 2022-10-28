{ config, pkgs, lib, ... }:
{
  imports = [
    ../../modules/editors/neovim.nix
    ../../modules/desktop
    ../../modules/dev
    ../../modules/programs
    ../../modules/shell
  ];

  config.modules = {
    desktop = {
      i3.enable = true;
      picom.enable = true;
    };
    dev = {
      fmt.enable = true;
      go.enable = true;
      nix.enable = true;
      node.enable = true;
      rust.enable = true;
      lua.enable = true;
    };
    editors = {
      neovim.enable = true;
    };
  };
}
