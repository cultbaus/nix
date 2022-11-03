{ inputs, ... }:
let
  additions = final: _prev: import ../pkgs { pkgs = final; };

  modifications = final: prev: {
    discord = prev.discord.override { withOpenASAR = true; };
  };
in
inputs.nixpkgs.lib.composeManyExtensions [ additions modifications ]
