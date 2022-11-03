{ pkgs ? null }: {
  extraNodePackages = import ./node-packages { inherit pkgs; };
}
