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
    ./languages
    ./services
    ./shell
  ];
}
