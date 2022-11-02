{ config, pkgs, lib, inputs, ... }: {
  nix = {
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

    package = pkgs.nixUnstable;

    gc = {
      automatic = true;
      dates = "weekly";
    };

    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      trusted-users = [ "root" "@wheel" ];
    };
  };
}
