{ pkgs
, lib
, config
, inputs
, ...
}:
{
  programs.autojump = {
    enable = true;
    enableBashIntegration = true;
  };
}
