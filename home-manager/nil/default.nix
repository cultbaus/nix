{ pkgs
, lib
, config
, inputs
, ...
}:
{
  imports = [
    ../common
  ];

  home = {
    username = "nil";
    homeDirectory = "/home/nil";
  };

  programs = {
    home-manager = {
      enable = true;
    };
    git = {
      userName = "cultbaus";
      userEmail = "cultbaus@gmail.com";
    };
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.05";
}
