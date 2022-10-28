{ config, pkgs, libs, ... }:
{
  programs.autojump = {
    enable = true;
    enableBashIntegration = true;
  };
}
