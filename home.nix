{ config, pkgs, ... }:

{
  home = {
     username = "liam";
     homeDirectory = "/home/liam";
     stateVersion = "25.05"; # match your NixOS version
     file.".config/waybar" = {
       source = ./config/waybar;
       recursive = true;
     };
     file.".config/hypr" = {
       source = ./config/hypr;
       recursive = true;
     };
     file.".config/ghostty" = {
       source = ./config/ghostty;
       recursive = true;
     };
     file.".config/qutebrowser" = {
       source = ./config/qutebrowser;
       recursive = true;
     };
     file.".config/yazi" = {
       source = ./config/yazi;
       recursive = true;
     };
  };

}
