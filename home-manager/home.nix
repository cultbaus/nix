{ lib, config, pkgs, ... }: {

  imports = [
    ./features
  ];

  home = {
    username = "nil";
    homeDirectory = "/home/nil";
    pointerCursor = {
      name = "capitaine-cursors-white";
      package = pkgs.capitaine-cursors;
      size = 64;
      x11.enable = true;
    };
  };

  home.packages = with pkgs; [
    alsa-utils
    brightnessctl
    fd
    feh
    firefox
    libnotify
    maim
    (ripgrep.override { withPCRE2 = true; })
    unzip
    wget
    xclip
  ];

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.05";
}
