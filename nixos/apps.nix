
{ config, inputs, pkgs, ... }:

{

environment.systemPackages = with pkgs; [
    hugo
    aider-chat
    zotero
    nh
    cryptsetup
    wiki-tui
    obs-studio
    tor
    tor-browser
    nix-search-cli
    sqlite
    networkmanager_dmenu
    wl-clipboard
    wofi
    waybar
    mpv
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
