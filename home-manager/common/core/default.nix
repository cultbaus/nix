{ pkgs
, lib
, config
, inputs
, ...
}:
{
  imports = [
    ./browsers
    ./chat
    ./editors
    ./media
  ];

  home.packages = with pkgs; [
    brightnessctl
    fd
    feh
    libnotify
    maim
    ripgrep
    unzip
    wget
    xclip
    xdg-utils
  ];
}
