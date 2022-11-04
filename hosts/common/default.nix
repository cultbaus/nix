{ pkgs
, lib
, config
, inputs
, ...
}: {
  imports = [
    ./audio
    ./core
    ./shell
  ];

  environment.systemPackages = with pkgs; [
    coreutils
    gcc
    git
    gnumake
    gnupg
    pinentry
    usbutils
  ];
}
