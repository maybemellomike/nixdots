{ config, pkgs, ... }:

{

#bluetooth
   systemd.services = {
      bluetooth.serviceConfig = {
      ProtectKernelTunables.lib.mkDefault = true;
      ProtectKernelModules.lib.mkDefault = true;
      ProtectKernelLogs.lib.mkDefault = true;
      ProtectHostname = true;
      ProtectControlGroups = true;
      ProtectProc = "invisible";
      SystemCallFilter = [
        "~@obsolete"
        "~@cpu-emulation"
        "~@swap"
        "~@reboot"
        "~@mount"
      ];
      SystemCallArchitectures = "native";
    };
};
services = {
  dbus.implementation = "broker";
  logrotate.enable = true;
  journald = {
    storage = "volatile"; # Store logs in memory
    upload.enable = false; # Disable remote log upload (the default)
    extraConfig = ''
      SystemMaxUse=500M
      SystemMaxFileSize=50M
    '';
  };
};

#cups
  systemd.services.cups.serviceConfig = {
    NoNewPrivileges = true;
    ProtectSystem = "full";
    ProtectHome = true;
    ProtectKernelModules = true;
    ProtectKernelTunables = true; 
    ProtectKernelLogs = true;
    ProtectControlGroups = true;
    ProtectHostname = true;
    ProtectClock = true;
    ProtectProc = "invisible";
    RestrictRealtime = true;
    RestrictNamespaces = true;
    RestrictSUIDSGID = true;
    RestrictAddressFamilies = [ 
      "AF_UNIX" 
      "AF_NETLINK"
      "AF_INET"
      "AF_INET6"
      "AF_PACKET"
    ];

    MemoryDenyWriteExecute = true;
    SystemCallFilter = [
      "~@clock"
      "~@reboot"
      "~@debug"
      "~@module"
      "~@swap"
      "~@obsolete" 
      "~@cpu-emulation" 
    ];
    SystemCallArchitectures = "native";
    LockPersonality= true; 
  };

# sysd ask-password-console

  systemd.services.systemd-ask-password-console.serviceConfig = {
    NoNewPrivileges = true;
    ProtectSystem = "strict";
    ProtectHome = true;
    ProtectClock = true; 
    ProtectHostname = true;
    ProtectKernelTunables = true;
    ProtectKernelModules = true;
    ProtectKernelLogs = true;
    ProtectProc = "invisible";
    PrivateTmp = true;
    PrivateMounts = true;
    PrivateNetwork = true;
    PrivateDevices = true;
    RestrictNamespaces = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    RestrictAddressFamilies = [ 
      "~AF_INET6"  
      "~AF_INET"
      "~AF_PACKET"
    ];
    MemoryDenyWriteExecute = true;
    DevicePolicy = "closed";
    LockPersonality = true;
    SystemCallFilter = [
      "~@keyring"
      "~@swap"
      "~@clock"         
      "~@module"
      "~@obsolete"
      "~@cpu-emulation"
    ];
  };

# sysd ask password wall

  systemd.services.systemd-ask-password-wall.serviceConfig = {
    NoNewPrivileges = true;
    ProtectSystem = "strict";
    ProtectHome = true;
    ProtectClock = true; 
    ProtectHostname = true;
    ProtectKernelTunables = true;
    ProtectKernelModules = true;
    ProtectKernelLogs = true;
    ProtectProc = "invisible";
    PrivateTmp = true;
    PrivateMounts = true;
    PrivateNetwork = true;
    PrivateDevices = true;
    RestrictNamespaces = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    RestrictAddressFamilies = [ 
      "~AF_INET6"  
      "~AF_INET"
      "~AF_PACKET"
    ];
  };
    MemoryDenyWriteExecute = true;
    DevicePolicy = "closed";
    LockPersonality = true;
    SystemCallFilter = [
      "~@keyring"
      "~@swap"
      "~@clock"         
      "~@module"
      "~@obsolete"
      "~@cpu-emulation"
    ];


}
