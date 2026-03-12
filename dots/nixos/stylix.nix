{ inputs, config, pkgs, ... }:

{ imports = [inputs.stylix.nixosModules.stylix];

stylix.enable = true; 
stylix.image = ./foret.jpg;
#stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
stylix.targets.nixvim.enable = false;
stylix.targets.plymouth.enable = false;
stylix.opacity.terminal = 0.75;
stylix.polarity = "dark";
  stylix.fonts = {
    sizes = {
      applications = 12;
    };
    serif = {
      package = pkgs.newcomputermodern;
      name = "New Computer Modern";
    };

     sansSerif = {
       package = pkgs.ubuntu-sans;
       name = "Ubuntu Sans";
     };

     monospace = {
       package = pkgs.fantasque-sans-mono;
       name = "Fantasque Sans Mono";
     };

    emoji = {
      package = pkgs.noto-fonts-color-emoji;
      name = "Noto Color Emoji";
    };
  };
}
