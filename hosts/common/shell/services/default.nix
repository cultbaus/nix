{ pkgs
, lib
, config
, inputs
, ...
}: {
  imports = [
    ./mpd.nix
  ];
}
