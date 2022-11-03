{ inputs, ... }:
let
  additions = final: _prev: import ../pkgs { pkgs = final; };

  modifications = final: prev: {
    discord = prev.discord.override { withOpenASAR = true; };
    vimPlugins = prev.vimPlugins {
      nvim-treesitter = prev.vimPlugins.nvim-treesitter.overrideAttrs (old: {
        patches = (old.patches or [ ]) ++ [
          ./nvim-treesitter-nix-injection.patch
        ];
        treesitterGrammars = prev.tree-sitter.withPlugins (p: with prev.vimPlugins; [
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
      });
    };
  };
in
inputs.nixpkgs.lib.composeManyExtensions [ additions modifications ]
