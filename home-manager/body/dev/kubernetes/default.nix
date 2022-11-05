{ pkgs
, lib
, config
, inputs
, ...
}:
{
  imports = [
    ./helm
    ./kind
  ];
}
