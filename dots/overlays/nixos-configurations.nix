final: prev:

{
  nixosConfigurations = {
    liam-tpad =
      final.inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        pkgs = final;
        modules = [ 
	../nixos/configuration.nix 
          final.inputs.home-manager.nixosModules.home-manager
	  final.inputs.mangowc.nixosModules.mango
	   {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
	  home-manager.backupFileExtension = "backup";
          home-manager.users.liam = {
	     imports = [ 
	     ../home.nix
	     final.inputs.mangowc.hmModules.mango
	     ];
	    };
	   }
	];
        specialArgs = { inherit (final) inputs; };
      };
  };
}
