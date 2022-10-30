{ config, pkgs, libs, ... }:
let
  key = builtins.readFile "${config.home.homeDirectory}/nix/.secrets/signing-key";
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
