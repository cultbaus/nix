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
      wm = {
        i3.enable = false;
        awesome.enable = true;
      };
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
