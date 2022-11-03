{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nodejs
    yarn
    extraNodePackages.typescript
    extraNodePackages.typescript-language-server
    extraNodePackages."@fsouza/prettierd"
    extraNodePackages.eslint_d
  ];
}
