{ config, pkgs, lib, ... }:
with lib;
let
  mod = "Mod4";
  cfg = config.modules.desktop.wm.i3;
in
{
  options.modules.desktop.wm.i3 = {
    enable = mkEnableOption "i3";
  };
  config = mkIf cfg.enable {
    home.packages = with pkgs; [ feh ];
    xsession.windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      config = {
        modifier = mod;

        bars = [ ];

        gaps = {
          outer = 0;
          inner = 20;
        };

        keybindings = lib.mkOptionDefault {
          "${mod}+Return" = "exec alacritty";
          "${mod}+d" = "exec ${pkgs.dmenu}/bin/dmenu_run";

          "${mod}+Shift+space" = "floating toggle";
          "${mod}+Shift+q" = "kill";

          "${mod}+h" = "move left";
          "${mod}+j" = "move down";
          "${mod}+k" = "move up";
          "${mod}+l" = "move right";

          "${mod}+r" = "mode resize";
          "${mod}+x" = "mode ctrl";

          "${mod}+Shift+c" = "reload";
          "${mod}+Shift+r" = "restart";
        };

        modes = {
          resize = {
            "h" = "resize shrink width 10px or 10 ppt";
            "j" = "resize grow width 10px or 10 ppt";
            "k" = "resize shrink width 10px or 10 ppt";
            "l" = "resize grow width 10px or 10 ppt";
            "${mod}+r" = "mode \"default\"";
            "Escape" = "mode \"default\"";
            "Return" = "mode \"default\"";
          };
          ctrl = {
            "l" = "exec i3-msg exit && killall Xorg";
            "r" = "exec systemctl reboot";
            "s" = "exec systemctl shutdown";
            "Escape" = "mode \"default\"";
            "Return" = "mode \"default\"";
          };
        };

        startup = [
          {
            command = "picom -b -G";
            always = true;
            notification = false;
          }
          {
            command = "xset r rate 200 40";
            always = true;
            notification = false;
          }
          {
            command = "~/.fehbg";
            always = true;
            notification = false;
          }
        ];
      };

      extraConfig = ''
        for_window [class="^.*"] border pixel 0
      '';
    };
  };
}
