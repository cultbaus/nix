{ config, pkgs, lib, ... }:

{
  imports = with lib; [
    ./bash.nix
    ./go.nix
    ./lua.nix
    ./nix.nix
    ./node.nix
    ./rust.nix
  ];
}
