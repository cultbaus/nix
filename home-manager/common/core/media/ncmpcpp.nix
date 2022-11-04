{ pkgs
, lib
, config
, inputs
, ...
}:
{
  programs.ncmpcpp = {
    enable = true;
    settings = {
      ncmpcpp_directory = "${config.home.homeDirectory}/.config/ncmpcpp";
      lyrics_directory = "${config.home.homeDirectory}/media/lyrics";
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
