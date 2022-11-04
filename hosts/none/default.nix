{ pkgs
, lib
, config
, inputs
, modulesPath
, ...
}:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ../common
    ./system
  ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

  system.stateVersion = "22.05";
}
