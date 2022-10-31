{ config, pkgs, ... }:
{
  systemd.services.mpd.environment = {
    XDG_RUNTIME_DIR = "/run/user/1000";
  };

  programs.bash.promptInit = builtins.readFile ./bashrc.sh;
  environment =
    {
      systemPackages = with pkgs; [
        brightnessctl
        pulseaudio # JUST for pactl - do not enable
      ];
      sessionVariables =
        rec {
          XCURSOR_SIZE = "64";
          EDITOR = "nvim";
          VISUAL = "nvim";
          XDG_DESKTOP_DIR = "\${HOME}";
          XDG_CACHE_HOME = "\${HOME}/.cache";
          XDG_CONFIG_HOME = "\${HOME}/.config";
          XDG_BIN_HOME = "\${HOME}/.local/bin";
          XDG_DATA_HOME = "\${HOME}/.local/share";
          XDG_MUSIC_DIR = "\${HOME}/media/music";
          XDG_DOWNLOAD_DIR = "\${HOME}/media/downloads";
          XDG_PICTURES_DIR = "\${HOME}/media/pictures";
          XDG_DOCUMENTS_DIR = "\${HOME}/media/documents";

          PATH = [
            "\${XDG_BIN_HOME}"
            "\${HOME}/.bin"
            "\${HOME}/.go/bin"
            "\${HOME}/.cargo/bin"
            "\${HOME}/.yarn/bin"
            "\${HOME}/.npm/bin"
          ];
        };
      variables = {
        NIX_SHELL_PRESERVE_PROMPT = "true";
      };
      pathsToLink = [ "/share/bash-completion" ];
      etc = {
        "profile.local".text = ''
          # /etc/profile.local: DO NOT EDIT -- this file has been auto generated

          if [ -f "$HOME/.profile" ]; then
            . "$HOME/.profile"
          fi
        '';
      };
    };
}
