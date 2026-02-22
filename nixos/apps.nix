
{ config, inputs, pkgs, ... }:

{

environment.systemPackages = with pkgs; [
    hugo
    gimp
    cryptsetup
    wiki-tui
    obs-studio
    nix-search-cli
    networkmanager_dmenu
    wofi
    waybar
    mpv
    qutebrowser
    swaybg
    waypaper
    ripgrep
    hyprshot
    bluetuith
    pkgs.kitty
    ghostty
    pciutils
    gotop
    yazi
    fzf
    kdePackages.kdenlive
    git
    qbittorrent
    alsa-utils
    pulsemixer
    brightnessctl
    cmus
    cava
    zathura
    texliveFull
    typst
    dnsmasq
  ];
}
