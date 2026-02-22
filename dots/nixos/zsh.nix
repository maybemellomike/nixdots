
{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
          conf = "du -a ~/dots/config | awk '{print $2}' | fzf --preview 'less {}' | xargs -r $EDITOR";
          nixconf = "du -a ~/dots/nixos | awk '{print $2}' | fzf --preview 'less {}' | xargs -r $EDITOR";
          dox = "du -a ~/dox/* | awk '{print $2}' | fzf --preview 'less {}' | xargs -r $EDITOR";
          tses = "session=$(tmux list-sessions -F '#S' | fzf) || exit tmux attach -t '$session' ";
          config = "doas vim /etc/nixos/configuration.nix";
          apps = "vim ~/dots/nixos/apps.nix";
          vimconf = "vim ~/dots/nixos/nixvim.nix";
          };
      ohMyZsh = {
        enable = true;
        plugins = ["vi-mode"];
        theme = "arrow";
      };
    };
}
