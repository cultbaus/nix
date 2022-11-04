{ pkgs
, lib
, config
, inputs
, ...
}: {
  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "curses";
    enableSSHSupport = true;
  };
}
