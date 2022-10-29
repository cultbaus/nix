{ config, pkgs, libs, ... }:

{
  imports = [
    ./go.nix
    ./lua.nix
    ./nix.nix
    ./node.nix
    ./rust.nix
  ];
}
