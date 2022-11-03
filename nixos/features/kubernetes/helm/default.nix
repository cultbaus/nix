{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    helmfile
    kubernetes-helm
  ];
}
