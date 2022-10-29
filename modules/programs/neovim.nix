{ config, pkgs, lib, ... }:

with lib;
let
  extraNodePackages = import ./packages/default.nix { };
in
{
  programs.neovim = {
    enable = true;
    package = with pkgs; neovim-nightly;
  };

  home.packages = with pkgs; [
    # language servers
    gopls
    rust-analyzer
    rnix-lsp
    sumneko-lua-language-server
    extraNodePackages."typescript-language-server"
    extraNodePackages."bash-language-server"

    # linters
    stylua
    shfmt
    clang-tools
    gotools
    extraNodePackages."@fsouza/prettierd"
    extraNodePackages."eslint_d"
    extraNodePackages."typescript"
  ];
}
