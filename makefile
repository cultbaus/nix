HOME:=${HOME}
CONFIG_DIR:=config
FLAKE_ROOT:=$(HOME)/$(CONFIG_DIR)
HMC:=homeManagerConfigurations
USER:=nil

.PHONY: help
help: ## prints this help message
	@cat $(MAKEFILE_LIST) \
		| grep -E '^[a-zA-Z_-]+:.*?## .*$$' \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: check
check: ## run `nix flake check` on your configuration
	@nix flake check "$(FLAKE_ROOT)#"

.PHONY: gc
gc: ## collect garbage
	@nix-collect-garbage

.PHONY: home
home: ## rebuild home-manager specific configurations (impure)
	@nix build "$(FLAKE_ROOT)#$(HMC).$(USER).activationPackage" --impure && \
		./result/activate && \
		rm -rf result

.PHONY: rebuild
rebuild: ## rebuild system-wide configurations
	@sudo nixos-rebuild switch --flake "$(FLAKE_ROOT)#"

.PHONY: update
update: ## runs `nix flake update`
	@nix flake update $(FLAKE_ROOT)

.PHONY: upgrade
upgrade: update rebuild generate home ## updates and rebuilds system-wide & home-manager configurations

.PHONY: optimise
optimise: ## optimise the nix store
	@nix-store --optimise

.PHONY: generate
generate: ## generate node-packages.nix (impure)
	@cd modules/programs/packages && \
		nix-shell -p nodePackages.node2nix --command "node2nix --nodejs-14 -i ./node-packages.json -o node-packages.nix"
