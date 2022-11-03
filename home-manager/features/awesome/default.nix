{ config, pkgs, lib, inputs, ... }:

with lib;
{
  home = {
    file = {
      ".xinitrc".text = ''
        systemctl --user start graphical-session.target
        systemctl --user import-environment XAUTHORITY DISPLAY

        xset r rate 200 40

        exec awesome 2> ~/.cache/awesome/stderr >1 ~/.cache/awesome/stdout
      '';
      ".config/awesome".source = config.lib.file.mkOutOfStoreSymlink ./config;
    };
  };
  xsession.windowManager.awesome = {
    enable = true;
    package = pkgs.awesome-git;
  };
}
