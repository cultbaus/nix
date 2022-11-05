{ pkgs
, lib
, config
, inputs
, ...
}:
{
  programs.chromium = {
    enable = true;
  };
}
