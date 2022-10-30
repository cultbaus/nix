{ configs, pkgs, libs, ... }:
let
  ssid = "${config.home.homeDirectory}/.secrets/wifi-ssid";
  psk = "${config.home.homeDirectory}/.secrets/wifi-psk";
in
{
  networking = {
    hostName = "none";
    wireless = {
      enable = true;
      networks = {
        "\${ssid}" = {
          psk = psk;
        };
      };
    };
  };
}
