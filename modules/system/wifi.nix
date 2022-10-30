{ config, pkgs, lib, ... }:
with lib;
let
  secrets = import ../../.secrets/secrets.nix { };
in
{
  networking = {
    hostName = "none";
    wireless = {
      enable = true;
      networks = {
        ${secrets.wifi.ssid} = {
          psk = secrets.wifi.psk;
        };
      };
    };
  };
}
