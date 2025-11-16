#!/bin/sh -ex

sudo nixos-rebuild switch --flake .#myNixOS
nix run nixpkgs#home-manager -- switch --flake .#myHome
