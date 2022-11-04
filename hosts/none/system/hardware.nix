{ pkgs
, lib
, config
, inputs
, modulesPath
, ...
}:
{
  hardware = {
    cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    video.hidpi.enable = lib.mkDefault true;
    bluetooth.enable = true;
  };
}
