{ inputs, config, pkgs, ... }:

{ imports = [inputs.stylix.nixosModules.stylix];

stylix.enable = true; 
# stylix.image = ./foret.jpg;
stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark.yaml";
stylix.targets.nixvim.enable = false;
stylix.targets.plymouth.enable = false;
stylix.opacity.terminal = 0.75;
stylix.polarity = "dark";
  stylix.fonts = {
    sizes = {
      applications = 12;
    };
    serif = {
      package = pkgs.aporetic;
      name = "Aporetic Serif";
    };

     sansSerif = {
       package = pkgs.aporetic;
       name = "Aporetic Sans";
     };

     monospace = {
       package = pkgs.aporetic;
       name = "Aporetic Serif Mono";
     };

    emoji = {
      package = pkgs.noto-fonts-color-emoji;
      name = "Noto Color Emoji";
    };
  };
}
