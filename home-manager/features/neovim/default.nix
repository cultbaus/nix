{ config, pkgs, lib, inputs, ... }:

with pkgs;
let
  hl = builtins.readFile ./extras/highlights.lua;
  kb = builtins.readFile ./extras/keybindings.lua;
  opt = builtins.readFile ./extras/options.lua;
  sl = builtins.readFile ./extras/statusline.lua;
  cmd = builtins.readFile ./extras/commands.lua;
in
{
  programs.neovim = {
    enable = true;
    package = neovim-nightly;
    vimAlias = true;
    viAlias = true;
    extraConfig = ''
      lua << EOF
      ${hl}
      ${kb}
      ${opt}
      ${sl}
      ${cmd}
      EOF
    '';
    plugins = with vimPlugins; [
      {
        plugin = nvim-treesitter.withPlugins (plugins: with plugins; [
          bash
          css
          docker
          go
          gomod
          graphql
          html
          javascript
          json
          lua
          make
          norg
          nix
          prisma
          rust
          typescript
          tsx
        ]);
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
        plugin = neorg;
        type = "lua";
        config = builtins.readFile (./plugins/neorg.lua);
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
