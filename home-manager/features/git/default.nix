{ config, pkgs, libs, ... }:
let
  secrets = import ../../../secrets { };
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
      key = secrets.git.signing-key;
      signByDefault = true;
    };
  };
}
