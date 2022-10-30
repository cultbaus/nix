{ config, pkgs, lib, ... }:
with lib;
let
  ssid = builtins.readFile ../../.secrets/wifi-ssid;
  psk = builtins.readFile ../../.secrets/wifi-psk;
in
{
  networking = {
    hostName = "none";
    wireless = {
      enable = true;
      networks = {
        ${ssid} = {
          psk = psk;
        };
      };
    };
  };
}
