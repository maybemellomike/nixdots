{ config, pkgs, ... }:

{
  home = {
     username = "liam";
     homeDirectory = "/home/liam";
     stateVersion = "25.05"; # match your NixOS version
     # xdg.userDirs = {
	 # enable = true;
	 # download = "~/down";
	 # documents = "~/dox";
	 # videos = "~/vids";
	 # pictures = "~/pix";
     # };

     file.".config/user-dirs.dirs" = {
       source = ./config/user-dirs.dirs;
     };
     file.".config/waybar" = {
       source = ./config/waybar;
       recursive = true;
     };
     file.".config/networkmanager-dmenu" = {
       source = ./config/networkmanager-dmenu;
       recursive = true;
     };
     file.".config/kitty" = {
       source = ./config/kitty;
       recursive = true;
     };
     file.".config/waypaper" = {
       source = ./config/waypaper;
       recursive = true;
     };
     file.".config/hypr" = {
       source = ./config/hypr;
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
