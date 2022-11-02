{ config, pkgs, lib, ... }: {
  programs.autojump = {
    enable = true;
    enableBashIntegration = true;
  };
}
