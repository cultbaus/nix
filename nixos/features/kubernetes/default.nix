{ pkgs, ... }: {
  imports = [
    ./helm
  ];
  environment.systemPackages = with pkgs; [
    kubectl
    kind
  ];
}
