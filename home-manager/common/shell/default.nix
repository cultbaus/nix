{ pkgs
, lib
, config
, inputs
, ...
}:
{
  imports = [
    ./autojump.nix
    ./bash.nix
    ./git.nix
  ];
}
