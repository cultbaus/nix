{ config, pkgs, lib, ... }:

with lib;
let
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  programs.rofi = {
    enable = true;
    terminal = "alacritty";
    font = "Caskaydia Cove  Nerd Font 32";

    theme = {
      "*" = {
        border = 0;
        margin = 0;
        padding = 0;
        spacing = 0;

        # TODO: source global theme
        bg = mkLiteral "#1d2021";
        bg-alt = mkLiteral "#32302f";
        fg = mkLiteral "#d4be98";
        fg-alt = mkLiteral "#d4be98";

        background-color = mkLiteral "@bg";
        text-color = mkLiteral "@fg";
      };

      window = {
        transparency = "real";
        width = mkLiteral "33.3%";
      };

      mainbox = {
        children = map mkLiteral [ "inputbar" "listview" ];
      };

      inputbar = {
        background-color = mkLiteral "@bg-alt";
        children = map mkLiteral [ "prompt" "entry" ];
      };

      entry = {
        background-color = mkLiteral "inherit";
        padding = mkLiteral "12px 3px";
      };

      prompt = {
        background-color = mkLiteral "inherit";
        padding = mkLiteral "12px";
      };

      listview = {
        lines = 4;
      };

      element = {
        children = map mkLiteral [ "element-text" ];
      };

      "element-icon" = {
        padding = mkLiteral "10px 10px";
      };

      "element-text" = {
        padding = mkLiteral "10px 10px";
        text-color = mkLiteral "@fg-alt";
      };

      "element-text selected" = {
        text-color = mkLiteral "@fg";
      };
    };
  };
}
