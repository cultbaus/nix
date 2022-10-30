{ config, pkgs, libs, ... }:
let
  key = "${config.home.homeDirectory}/.secrets/secret-key-id";
in
{
  home.packages = with pkgs; [
    git-crypt
  ];

  programs.git = {
    enable = true;
    userName = "cultbaus";
    userEmail = "cultbaus@gmail.com";
    signing = {
      key = key;
      signByDefault = true;
    };
  };
}
