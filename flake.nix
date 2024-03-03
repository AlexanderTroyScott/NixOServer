{
  description = "NixOS Server Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
  };

  outputs = { self, nixpkgs, ...}@inputs: {
    nixosConfigurations = {
      "coral" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ./coral/configuration.nix
          ./coral/hardware-configuration.nix
	];
      };
    };
  };
}
