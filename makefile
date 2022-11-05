USER:=nil
HOST:=none

help: ## prints this help message
	@cat $(MAKEFILE_LIST) \
		| grep -E '^[a-zA-Z_-]+:.*?## .*$$' \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: home
home: ## rebuild home-manager config
	@home-manager switch --flake ."#$(USER)@$(HOST)"

system: ## rebuild nixos system config
	@sudo nixos-rebuild switch --flake ."#$(HOST)"

generate: ## generate node-packages.nix
	@cd pkgs/node-packages && \
		nix-shell -p nodePackages.node2nix --command "node2nix --nodejs-14 -i ./node-packages.json -o node-packages.nix"

update: ## runs `nix flake update`
	@nix flake update

upgrade: update generate system home ## updates and rebuilds system-wide & home-manager configurations

optimise: clean ## clean & optimise the nix store
	@nix-store --optimise

clean: ## cleans & deletes old generations, collects garbage
	@nix-env --delete-generations old && \
		nix-store --gc && \
		nix-collect-garbage -d && \
		sudo nix-collect-garbage -d
