{ pkgs ? null }: {
  extraNodePackages = import ./node-packages { inherit pkgs; };
  secrets = import ./secrets { };
  themes = import ./themes { };
}
