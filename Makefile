.PHONY: all nixos home-manager

all: nixos home-manager

nixos:
	sudo nixos-rebuild switch --flake .

home-manager:
	nix run nixpkgs#home-manager -- switch --flake .#myHome
