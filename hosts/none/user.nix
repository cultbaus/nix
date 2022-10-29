{ config, pkgs, lib, ... }:
{
  imports = [
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
      bash.enable = true;
      go.enable = true;
      lua.enable = true;
      nix.enable = true;
      node.enable = true;
      rust.enable = true;
    };
  };
}
