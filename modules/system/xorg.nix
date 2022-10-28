{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    libinput.enable = true;
    layout = "us";
    dpi = 192;
    displayManager = {
      startx.enable = true;
      defaultSession = "none+i3";
    };
    windowManager = {
      i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        extraPackages = with pkgs; [
          dmenu
        ];
      };
    };
  };
}
