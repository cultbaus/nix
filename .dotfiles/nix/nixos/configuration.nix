{ inputs, lib, config, pkgs, ... }: {

  imports = [
    ./hardware-configuration.nix
    ./features
  ];

  hardware.bluetooth.enable = true;

  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "curses";
    enableSSHSupport = true;
  };

  services.pcscd.enable = true;

  time.timeZone = "America/Los_Angeles";

  environment.systemPackages = with pkgs; [
    coreutils
    gcc
    git
    gnumake
    gnupg
    pinentry
    usbutils
  ];

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };

  system.stateVersion = "22.05";
}
