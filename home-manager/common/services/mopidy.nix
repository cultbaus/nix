{ pkgs
, lib
, config
, inputs
, ...
}:
{
  services = {
    mopidy = {
      enable = true;
      settings = {
        mpd = {
          enabled = true;
          port = "6600";
          hostname = "127.0.0.1";
        };
        local = {
          media_dir = "${config.home.homeDirectory}/media/music";
        };
      };
      extensionPackages = with pkgs; [
        mopidy-mpd
        mopidy-local
      ];
    };
  };
}
