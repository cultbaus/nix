HOME:=${HOME}
CONFIG_DIR:=nix
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

.PHONY: gcu
gcu: ## collect garbage for the user
	@nix-collect-garbage -d

.PHONY: gcs
gcs: ## collect garbage for the system
	@sudo nix-collect-garbage -d

.PHONY: home
home: ## rebuild home-manager specific configurations
	@nix build "$(FLAKE_ROOT)#$(HMC).$(USER).activationPackage" && \
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
optimise: clean ## clean & optimise the nix store
	@nix-store --optimise

.PHONY: generate
generate: ## generate node-packages.nix
	@cd modules/dev/packages && \
		nix-shell -p nodePackages.node2nix --command "node2nix --nodejs-14 -i ./node-packages.json -o node-packages.nix"

.PHONY: clean
clean: ## cleans & deletes old generations, collects garbage
	@nix-env --delete-generations old && \
		nix-store --gc && \
		nix-collect-garbage -d
