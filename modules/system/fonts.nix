{ config, pkgs, ... }:
{
  fonts.fonts = with pkgs; [
    jetbrains-mono
    cascadia-code
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  fonts.fontconfig = {
    defaultFonts = {
      monospace = [ "JetBrainsMono" ];
      sansSerif = [ "JetBrainsMono" ];
      serif = [ "Cascadia Code" ];
    };
  };
}
