{ config, pkgs, libs, ... }:
{
  programs.git = {
    enable = true;
    userName = "cultbaus";
    userEmail = "cultbaus@gmail.com";
    signing = {
      key = "13607BAC29B6A0C0";
      signByDefault = true;
    };
  };
}
