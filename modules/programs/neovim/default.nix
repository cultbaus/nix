{ config, pkgs, lib, ... }:

with pkgs;
let
  init = builtins.readFile ./plugins/init.lua;
in
{
  programs.neovim = {
    enable = true;
    package = neovim-nightly;
    vimAlias = true;
    extraConfig = ''
      lua << EOF
      ${init}
      EOF
    '';
    plugins = with vimPlugins; [
      {
        plugin = nvim-treesitter.withPlugins (plugins: tree-sitter.allGrammars);
        type = "lua";
        config = builtins.readFile (./plugins/treesitter.lua);
      }
      {
        plugin = telescope-nvim;
        type = "lua";
        config = builtins.readFile (./plugins/telescope.lua);
      }
      {
        plugin = null-ls-nvim;
        type = "lua";
        config = builtins.readFile (./plugins/null-ls.lua);
      }
      {
        plugin = which-key-nvim;
        type = "lua";
        config = builtins.readFile (./plugins/which-key.lua);
      }
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = builtins.readFile (./plugins/lspconfig.lua);
      }
      {
        plugin = gruvbox-material;
        type = "lua";
        config = builtins.readFile (./plugins/colors.lua);
      }
      {
        plugin = nvim-cmp;
        type = "lua";
        config = builtins.readFile (./plugins/cmp.lua);
      }
      {
        plugin = comment-nvim;
        type = "lua";
        config = builtins.readFile (./plugins/comment.lua);
      }
      {
        plugin = nvim-autopairs;
        type = "lua";
        config = builtins.readFile (./plugins/autopairs.lua);
      }
      {
        plugin = cmp-nvim-lsp;
        type = "lua";
      }
      {
        plugin = cmp-buffer;
        type = "lua";
      }
      {
        plugin = luasnip;
        type = "lua";
      }
      {
        plugin = nvim-ts-context-commentstring;
        type = "lua";
      }
      {
        plugin = plenary-nvim;
        type = "lua";
      }
    ];
  };
}
