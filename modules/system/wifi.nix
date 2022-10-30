{ config, pkgs, lib, ... }:
with lib;
let
  secrets = import ../../.secrets/sk.nix { };
  # ssid = builtins.readFile ../../.secrets/wifi-ssid;
  # psk = builtins.readFile ../../.secrets/wifi-psk;
in
{
  networking = {
    hostName = "none";
    wireless = {
      enable = true;
      networks = {
        ${secrets.wif.ssid} = {
          psk = secrets.wifi.psk;
        };
      };
    };
  };
}
