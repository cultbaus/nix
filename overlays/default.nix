{ inputs, ... }:
let
  additions = final: _prev: import ../pkgs { pkgs = final; };
  modifications = final: prev: {
    discord = prev.discord.override { withOpenASAR = true; };
    ripgrep = prev.ripgrep.override { withPCRE2 = true; };
  };
in
inputs.nixpkgs.lib.composeManyExtensions [ additions modifications ]
