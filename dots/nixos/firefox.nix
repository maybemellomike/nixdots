
{ config, pkgs, ... }:

{

  programs.firefox = {
    enable = true;
    policies = {
        EnableTrackingProtection = {
          Value= true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
          };
        ExtensionSettings = {
            # uBlock Origin:
            "uBlock0@raymondhill.net" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
              installation_mode = "force_installed";
               };
            # Privacy Badger:
            "jid1-MnnxcxisBPnSXQ@jetpack" = {
              install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
              installation_mode = "force_installed";
               };
             };
          };
    preferences = {
       "sidebar.verticaltabs" = true;
       "sidebar.verticaltabs.dragtopinpromo.dismissed" = true;
       DisableTelemetry = true;
       DisableFirefoxStudies = true;
      };
    };


}
