{ pkgs
, lib
, config
, inputs
, ...
}:
{
  services = {
    mpd = {
      enable = true;
      musicDirectory = "${config.home.homeDirectory}/media/music";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "My PipeWire Output"
        }
      '';
    };
  };
}
