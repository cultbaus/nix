{ pkgs, ... }:
{
  home.packages = with pkgs; [
    shfmt
    extraNodePackages.bash-language-server
  ];
}
