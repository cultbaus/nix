{ config, pkgs, libs, ... }:
let
  secrets = import ../../.secrets/secrets.nix { };
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
      key = secrets.git.key;
      signByDefault = true;
    };
  };
}
