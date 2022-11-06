{ pkgs
, lib
, config
, inputs
, ...
}: {
  networking = with pkgs; {
    useDHCP = lib.mkDefault true;

    hostName = "curse";
  };
}
