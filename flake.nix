{
  description = "NixOS Server Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
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
