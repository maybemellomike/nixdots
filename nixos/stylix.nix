{ inputs, config, pkgs, ... }:

{ imports = [inputs.stylix.nixosModules.stylix];

stylix.enable = true; 
stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";
stylix.targets.nixvim.enable = false;
stylix.polarity = "dark";

}
