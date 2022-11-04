{ pkgs
, lib
, config
, inputs
, ...
}: {
  imports = [
    ./firefox.nix
  ];
}
