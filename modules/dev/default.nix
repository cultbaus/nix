{ config, pkgs, libs, ... }:

{
  # TODO: Need to manage language-specific executables

  imports = [
    ./fmt.nix
    ./go.nix
    ./lua.nix
    ./nix.nix
    ./node
    ./rust.nix
  ];
}
