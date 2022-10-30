{ config, pkgs, libs, ... }:
let
  # key = builtins.readFile ${config.home.homeDirectory}/nix/.secrets/signing-key;
  secrets = builtins.readFile ../../.secrets/sk.nix;
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
