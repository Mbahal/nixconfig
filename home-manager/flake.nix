{
  description = "Home Manager configuration of mbahal";
  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
	nixvim = {
	  url = "github:nix-community/nixvim";
#	  inputs.nixpkgs.follows = "nixpkgs";
	};
  };

  outputs = inputs@{ nixpkgs, home-manager, nixvim, ... }: {
	nixosConfigurations = {
	  mbahal = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		specialArgs = inputs;
		modules =  [
		  ./mbahal/configuration.nix
		  home-manager.nixosModules.home-manager
		  {
			home-manager = {
			  useGlobalPkgs = true;
			  useUserPackages = true;
			  users.mbahal = import ./mbahal/home.nix;
			};
		  }
		  nixvim.nixosModules.nixvim
		  ./modules/home/nixvim.nix 
		];
	  };
	};
  };
}
