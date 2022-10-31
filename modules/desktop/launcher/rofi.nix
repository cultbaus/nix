{ config, pkgs, lib, ... }:

with lib;
let
  cfg = config.modules.desktop.launcher.rofi;
  inherit (config.lib.formats.rasi) mkLiteral;
in
{
  options.modules.desktop.launcher.rofi = {
    enable = mkEnableOption "rofi";
  };
  config = mkIf cfg.enable {
    programs.rofi = {
      enable = true;
      font = "JetBrainsMono 32";

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
          lines = 8;
        };

        element = {
          children = map mkLiteral [ "element-icon" "element-text" ];
        };

        "element-icon" = {
          padding = mkLiteral "10px 10px";
        };

        "element-text" = {
          padding = mkLiteral "10px 0";
          text-color = mkLiteral "@fg-alt";
        };

        "element-text selected" = {
          text-color = mkLiteral "@fg";
        };
      };
    };
  };
}
