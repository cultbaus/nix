{ pkgs
, lib
, config
, inputs
, ...
}: {
  imports = [
    ./ncmpcpp.nix
  ];
}
