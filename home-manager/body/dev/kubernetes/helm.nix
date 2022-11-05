{ pkgs
, lib
, config
, input
, ...
}: {

  home.packages = with pkgs; [
    helmfile
    kuberenetes-helm
  ];
}
