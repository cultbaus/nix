{ pkgs
, lib
, config
, inputs
, ...
}:
{
  imports = [
    ../common
    ./core
    ./dev
  ];

  home = {
    username = "body";
    homeDirectory = "/home/body";
  };

  programs = {
    home-manager = {
      enable = true;
    };
    git = {
      userName = "Nicholas Gebhart";
      userEmail = "nicholas.gebhart@tacen.app";
    };
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.05";
}
