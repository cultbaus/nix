{ pkgs
, lib
, config
, inputs
, ...
}:
{
  imports = [
    ./boot.nix
    ./disk.nix
    ./hardware.nix
    ./network.nix
    ./nix.nix
    ./services.nix
    ./system.nix
    ./users.nix
    ./xserver.nix
  ];
}
