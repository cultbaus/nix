{
  description = "NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    hardware.url = "github:nixos/nixos-hardware";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";

    nixpkgs-f2k.url = "github:fortuneteller2k/nixpkgs-f2k";
  };

  outputs =
    { nixpkgs
    , home-manager
    , neovim-nightly
    , nixpkgs-f2k
    , ...
    }@inputs:
    let
      system = "x86_64-linux";

      forAllSystems = nixpkgs.lib.genAttrs [
        system
      ];
    in
    rec {
      overlays = {
        default = import ./overlays { inherit inputs; };
        neovim = neovim-nightly.overlay;
        window-managers = nixpkgs-f2k.overlays.window-managers;
      };

      devShells = forAllSystems (system: {
        default = nixpkgs.legacyPackages.${system}.callPackage ./shell.nix { };
      });

      legacyPackages = forAllSystems (system: import inputs.nixpkgs {
        inherit system;

        overlays = builtins.attrValues overlays;
        config.allowUnfree = true;
      });

      nixosConfigurations = {
        none = nixpkgs.lib.nixosSystem {
          inherit system;

          pkgs = legacyPackages.x86_64-linux;
          specialArgs = { inherit inputs; };
          modules = [
            ./nixos/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        inherit system;

        "nil@none" = home-manager.lib.homeManagerConfiguration {
          pkgs = legacyPackages.x86_64-linux;
          extraSpecialArgs = {
            inherit inputs;
          };
          modules = [
            ./home-manager/home.nix
          ];
        };
      };
    };
}
