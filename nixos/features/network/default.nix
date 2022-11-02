{ ... }:
let
  secrets = import ../../../secrets { };
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
