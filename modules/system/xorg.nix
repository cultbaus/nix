{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    libinput.enable = true;
    layout = "us";
    dpi = 192;
    displayManager = {
      startx.enable = true;
    };
  };
}
