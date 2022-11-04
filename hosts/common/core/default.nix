{ pkgs
, lib
, config
, inputs
, ...
}: {
  imports = [
    ./fonts.nix
    ./gpg.nix
    ./services.nix
    ./xserver.nix
  ];
}
