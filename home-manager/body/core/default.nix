{ pkgs
, lib
, config
, input
, ...
}:
{
  imports = [
    ./browsers
    ./chat
  ];
}
