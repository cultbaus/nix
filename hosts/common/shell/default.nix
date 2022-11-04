{ pkgs
, config
, lib
, inputs
, ...
}:
{
  imports = [
    ./bash
    ./services
  ];
  environment =
    {
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
            "\${HOME}/.cargo/bin"
            "\${HOME}/.go/bin"
            "\${HOME}/.npm/bin"
            "\${HOME}/.yarn/bin"
          ];
        };
      variables = {
        NIX_SHELL_PRESERVE_PROMPT = "true";
      };
    };
}
