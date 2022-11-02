{ pkgs, ... }: {
  fonts.fonts = with pkgs; [
    cascadia-code
    jetbrains-mono
    (nerdfonts.override {
      fonts = [
        "CascadiaCode"
        "JetBrainsMono"
      ];
    })
  ];

  fonts.fontconfig = {
    defaultFonts = {
      monospace = [ "Cascadia Code" "JetBrainsMono" ];
      sansSerif = [ "Cascadia Code" "JetBrainsMono" ];
      serif = [ "Cascadia Code" "JetBrainsMono" ];
    };
  };
}
