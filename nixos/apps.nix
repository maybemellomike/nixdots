
{ config, inputs, pkgs, ... }:

{

environment.systemPackages = with pkgs; [
    hugo
    zotero
    nh
    cryptsetup
    wiki-tui
    obs-studio
    nix-search-cli
    sqlite
    networkmanager_dmenu
    wl-clipboard
    wofi
    waybar
    mpv
    xorg.xrandr
    xorg.xsetroot
    qutebrowser
    swaybg
    waypaper
    ripgrep
    hyprshot
    hyprcursor
    bluetuith
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
