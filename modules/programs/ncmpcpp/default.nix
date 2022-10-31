{ config, pkgs, ... }:
{
  services = {
    mpd = {
      enable = true;
      musicDirectory = "/home/nil/media/music";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "My PipeWire Output"
        }
      '';
    };
    mopidy = {
      enable = true;
      settings = {
        mpd = {
          enabled = true;
          port = "6600";
          hostname = "127.0.0.1";
        };
      };
      extensionPackages = with pkgs; [
        mopidy-mpd
      ];
    };
  };

  programs.ncmpcpp = {
    enable = true;
    settings = {
      ncmpcpp_directory = "~/.config/ncmpcpp";
      lyrics_directory = "~/media/lyrics";
      mpd_host = "127.0.0.1";
      mpd_port = "6600";
      lines_scrolled = "1";
      message_delay_time = "3";
      playlist_display_mode = "classic";
      progressbar_elapsed_color = "white";
      progressbar_color = "black";
      progressbar_look = "─ ─";
      header_visibility = "no";
      statusbar_visibility = "no";
      now_playing_prefix = "$b";
      now_playing_suffix = "$8$/b";
      song_list_format = "$5%t $R$8%a";
    };
    bindings = [
      { key = "j"; command = "scroll_down"; }
      { key = "k"; command = "scroll_up"; }
      { key = "J"; command = [ "select_item" "scroll_down" ]; }
      { key = "K"; command = [ "select_item" "scroll_up" ]; }
    ];
  };
}
