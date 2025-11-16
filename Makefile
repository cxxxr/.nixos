.PHONY: all nixos home-manager

all: nixos home-manager

nixos:
	sudo nixos-rebuild switch --flake .#myNixOS

home-manager:
	nix run nixpkgs#home-manager -- switch --flake .#myHome
