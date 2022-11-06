{ pkgs
, lib
, config
, inputs
, ...
}:
{
  services.pcscd.enable = true;
}
