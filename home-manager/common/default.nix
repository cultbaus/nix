{ pkgs
, lib
, config
, inputs
, ...
}:
{
  imports = [
    ./core
    ./desktop
    ./dev
    ./services
    ./shell
  ];
}
