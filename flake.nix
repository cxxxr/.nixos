{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {
    nixosConfigurations = {
      # NucBox EVO-X2 configuration
      nucbox = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ./hosts/nucbox
        ];
        specialArgs = {
          inherit inputs;
        };
      };

      # Laptop configuration
      laptop = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ./hosts/laptop
        ];
        specialArgs = {
          inherit inputs;
        };
      };
    };
    homeConfigurations = {
      myHome = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import inputs.nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
          overlays = [ (import ./overlays/codex.nix) ];
        };
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [
          ./home.nix
        ];
      };
    };
  };
}
