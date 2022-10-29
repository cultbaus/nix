{
  description = "NixOS";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , neovim-nightly
    , ...
    }@inputs:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };

      overlays = [
        neovim-nightly.overlay
      ];
    in
    {
      homeManagerConfigurations = {
        nil = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./hosts/none/user.nix
            {
              programs.home-manager.enable = true;
              nixpkgs.overlays = overlays;
              home = {
                username = "nil";
                homeDirectory = "/home/nil";
                stateVersion = "22.05";
              };
            }
          ];
        };
      };
      nixosConfigurations = {
        none = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            {
              nixpkgs.overlays = overlays;
            }
            ./hosts/none/configuration.nix
          ];
        };
      };
    };
}
