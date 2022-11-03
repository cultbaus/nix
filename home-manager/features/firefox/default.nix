{ pkgs, ... }:
let
  # gruvbox-material ddg
  themedUrl = "https://duckduckgo.com/?kae=t&kj=1d2021&kp=-2&k8=d4be98&kbc=1&kx=d8a657&kak=-1&ks=n&kn=-1&kau=-1&kk=-1&k1=-1&kao=-1&kz=-1&k21=1d2021&kap=-1&kf=-1&k9=a9b665&kax=-1&k7=1d2021&kaa=d3869b&kaq=-1";
in
{
  programs.firefox = {
    enable = true;
    profiles = {
      "nil" = {
        settings = {
          "browser.startup.homepage" = themedUrl;
          "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
        };
        userChrome = builtins.readFile ./userChrome.css;
        search = {
          force = true;
          default = "DuckDuckGo";
          engines = {
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              definedAliases = [ "@np" ];
            };
            "NixOS Wiki" = {
              urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
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
