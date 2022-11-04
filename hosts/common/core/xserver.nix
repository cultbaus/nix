{ pkgs
, lib
, config
, inputs
, ...
}:
{
  services.xserver = {
    enable = true;
    libinput.enable = true;
    layout = "us";
    displayManager = {
      startx.enable = true;
    };
  };
}
