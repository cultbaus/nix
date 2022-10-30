{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    git-crypt
  ];

  programs.git = {
    enable = true;
    userName = "cultbaus";
    userEmail = "cultbaus@gmail.com";
    # signing = {
    #   signByDefault = true;
    # };
  };
}
