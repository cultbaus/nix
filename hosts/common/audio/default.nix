{ pkgs
, lib
, config
, inputs
, ...
}: {
  environment.systemPackages = with pkgs; [
    alsa-utils
    pulseaudio
  ];
  sound.enable = false;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
  };
}
