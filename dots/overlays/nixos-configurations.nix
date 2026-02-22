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
	   {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
	  home-manager.backupFileExtension = "backup";
          home-manager.users.liam = import ../home.nix;
	   }
	];
        specialArgs = { inherit (final) inputs; };
      };
  };
}
