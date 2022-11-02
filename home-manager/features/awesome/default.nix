{ config, pkgs, lib, inputs, ... }:

with lib;
{
  home = {
    file = {
      ".config/awesome".source = config.lib.file.mkOutOfStoreSymlink ./config;
    };
  };
  xsession.windowManager.awesome = {
    enable = true;
    package = pkgs.awesome-git;
  };
}
