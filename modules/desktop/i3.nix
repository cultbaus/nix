{ config, pkgs, lib, ... }:
with lib;
let
  cfg = config.modules.desktop.i3;
in
{
  options.modules.desktop.i3 = {
    enable = mkEnableOption "i3";
  };
  config = mkIf cfg.enable {
    home.file.".config/i3/config".text = ''
      # Modifier
      set $mod Mod4
      floating_modifier $mod

      bindsym $mod+Return exec --no-startup-id alacritty
      bindsym $mod+d exec --no-startup-id dmenu_run
      bindsym Print exec stc

      bindsym $mod+Shift+space floating toggle
      bindsym $mod+Shift+q kill

      bindsym $mod+h move left
      bindsym $mod+j move down
      bindsym $mod+k move up
      bindsym $mod+l move right

      set $ws1 "1"
      set $ws2 "2"
      set $ws3 "3"
      set $ws4 "4"
      set $ws5 "5"
      set $ws6 "6"
      set $ws7 "7"
      set $ws8 "8"
      set $ws9 "9"
      set $ws10 "10"

      bindsym $mod+1 workspace $ws1
      bindsym $mod+2 workspace $ws2
      bindsym $mod+3 workspace $ws3
      bindsym $mod+4 workspace $ws4
      bindsym $mod+5 workspace $ws5
      bindsym $mod+6 workspace $ws6
      bindsym $mod+7 workspace $ws7
      bindsym $mod+8 workspace $ws8
      bindsym $mod+9 workspace $ws9
      bindsym $mod+0 workspace $ws10

      bindsym $mod+Shift+1 move container to workspace $ws1
      bindsym $mod+Shift+2 move container to workspace $ws2
      bindsym $mod+Shift+3 move container to workspace $ws3
      bindsym $mod+Shift+4 move container to workspace $ws4
      bindsym $mod+Shift+5 move container to workspace $ws5
      bindsym $mod+Shift+6 move container to workspace $ws6
      bindsym $mod+Shift+7 move container to workspace $ws7
      bindsym $mod+Shift+8 move container to workspace $ws8
      bindsym $mod+Shift+9 move container to workspace $ws9
      bindsym $mod+Shift+0 move container to workspace $ws10

      bindsym $mod+Shift+c reload
      bindsym $mod+Shift+r restart

      mode "exit: [l]ogout, [r]eboot, [s]hutdown" {
              bindsym l exec i3-msg exit && killall Xorg
              bindsym r exec systemctl reboot
              bindsym s exec systemctl shutdown
              bindsym Escape mode "default"
              bindsym Return mode "default"
      }
      bindsym $mod+x mode "exit: [l]ogout, [r]eboot, [s]hutdown"

      mode "resize" {
              bindsym h resize shrink width 10 px or 10 ppt
              bindsym j resize grow height 10 px or 10 ppt
              bindsym k resize shrink height 10 px or 10 ppt
              bindsym l resize grow width 10 px or 10 ppt
              bindsym Left resize shrink width 10 px or 10 ppt
              bindsym Down resize grow height 10 px or 10 ppt
              bindsym Up resize shrink height 10 px or 10 ppt
              bindsym Right resize grow width 10 px or 10 ppt
              bindsym Return mode "default"
              bindsym Escape mode "default"
              bindsym $mod+r mode "default"
      }
      bindsym $mod+r mode "resize"

      exec_always --no-startup-id xrdb ~/.Xresources
      exec_always --no-startup-id picom -b -G
      exec_always --no-startup-id xset r rate 200 40
      exec_always --no-startup-id ~/.fehbg

      for_window [class="^.*"] border pixel 0
      gaps outer 0
      gaps inner 20
    '';
  };
}
