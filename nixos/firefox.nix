{ config, pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    policies = {
      # --- Tracking & Fingerprinting ---
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };

      # --- Privacy ---
      DisableTelemetry = true;          # moved from preferences (correct location)
      DisableFirefoxStudies = true;     # moved from preferences (correct location)
      DisableFirefoxAccounts = true;
      DisablePocket = true;
      DisableFormHistory = true;
      DontCheckDefaultBrowser = true;
      PasswordManagerEnabled = false;
      FirefoxSuggest = {
        WebSuggestions = false;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
      };

      # --- Extensions ---
      ExtensionSettings = {
        # uBlock Origin
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        # Privacy Badger
        "jid1-MnnxcxisBPnSXQ@jetpack" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };

    preferences = {
      # --- Your existing ---
      "sidebar.verticaltabs" = true;
      "sidebar.verticaltabs.dragtopinpromo.dismissed" = true;

      # --- Fingerprinting resistance ---
      "privacy.resistFingerprinting" = true;
      "privacy.fingerprintingProtection" = true;

      # --- WebRTC leak prevention ---
      "media.peerconnection.enabled" = false;

      # --- DNS-over-HTTPS (second layer on top of resolved) ---
      "network.trr.mode" = 3;
      "network.trr.uri" = "https://cloudflare-dns.com/dns-query";

      # --- Disable prefetch/speculative connections ---
      "network.prefetch-next" = false;
      "network.dns.disablePrefetch" = true;
      "network.predictor.enabled" = false;
      "network.http.speculative-parallel-limit" = 0;

      # --- Telemetry (belt-and-suspenders with policies above) ---
      "toolkit.telemetry.enabled" = false;
      "toolkit.telemetry.unified" = false;
      "datareporting.healthreport.uploadEnabled" = false;
      "browser.ping-centre.telemetry" = false;
      "app.shield.optoutstudies.enabled" = false;
      "app.normandy.enabled" = false;

      # --- Safe browsing (keeps local list, stops phoning Google) ---
      "browser.safebrowsing.downloads.remote.enabled" = false;

      # --- Session & form data ---
      "browser.sessionstore.privacy_level" = 2;
      "browser.formfill.enable" = false;
    };
  };
}
