{ pkgs
, lib
, config
, inputs
, ...
}: {
  imports = [
    ./ncmpcpp.nix
    ./zathura.nix
  ];
}
