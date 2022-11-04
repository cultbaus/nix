{ pkgs
, lib
, config
, inputs
, ...
}: {
  networking = with pkgs; {
    useDHCP = lib.mkDefault true;

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
