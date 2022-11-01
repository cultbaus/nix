{ config, pkgs, libs, ... }:
{

  imports = [
    ./autojump.nix
    ./bash.nix
    ./git.nix
  ];

  home.packages = with pkgs; [
    alsa-utils
    fd
    gnumake
    maim
    (ripgrep.override { withPCRE2 = true; })
    unzip
    xclip
    killall
  ];
}
