{ config, pkgs, ... }:

{
  home = {
     username = "liam";
     homeDirectory = "/home/liam";
     stateVersion = "25.05"; # match your NixOS version
  };

}
