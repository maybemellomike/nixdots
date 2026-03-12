{ config, pkgs, ... }:

{

imports = [
      ./mangowc.nix
   ];


  home = {
     username = "liam";
     homeDirectory = "/home/liam";
     stateVersion = "25.05"; # match your NixOS version

     file.".config/user-dirs.dirs" = {
       source = ./config/user-dirs.dirs;
     };
     file.".config/waybar" = {
       source = ./config/waybar/waybar_mango;
       recursive = true;
     };
     file.".config/hypr" = {
       source = ./config/hypr;
       recursive = true;
     };
     file.".config/networkmanager-dmenu" = {
       source = ./config/networkmanager-dmenu;
       recursive = true;
     };
     file.".config/waypaper" = {
       source = ./config/waypaper;
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

programs.kitty = {
   enable = true; 
   extraConfig = ''
      window_padding_width 8
      draw_minimal_borders yes
      confirm_os_window_close 0
      macos_titlebar_color background
      '';
   };


}
