{ pkgs
, lib
, config
, input
, ...
}:
{
  home.pacakges = with pkgs; [
    kind
    kubectl
  ];
}
