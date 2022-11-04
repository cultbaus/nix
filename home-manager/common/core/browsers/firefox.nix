{ pkgs
, lib
, config
, inputs
, ...
}: {
  programs.firefox = {
    enable = true;
    profiles = {
      "nil" = {
        settings = {
          "brownser.download.dir" = "${config.home.homeDirectory}/media/downloads";
          "browser.startup.homepage" = pkgs.themes.gruvbox-material.ddg;
          "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
        };
        userChrome = builtins.readFile ./userChrome.css;
        search = {
          force = true;
          default = "DuckDuckGo";
          engines = {
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    { name = "type"; value = "packages"; }
                    { name = "query"; value = "{searchTerms}"; }
                  ];
                }
              ];
              definedAliases = [ "@np" ];
            };
            "NixOS Wiki" = {
              urls = [
                {
                  template = "https://nixos.wiki/index.php?search={searchTerms}";
                }
              ];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = [ "@nw" ];
            };
            "Bing".metaData.hidden = true;
            "Google".metaData.hidden = true;
          };
        };
      };
    };
  };
}
