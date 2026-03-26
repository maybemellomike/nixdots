{ config, pkgs, ... }:

{
  ## Internet
    networking.firewall.enable = true;

  ## SystemD
systemd.services.systemd-journald = {
  serviceConfig = {
  UMask = 0077;
  PrivateNetwork= true;
  ProtectHostname= true;
  ProtectKernelModules= true;
  };
};

systemd.services.NetworkManager-dispatcher = {
  serviceConfig = {
    ProtectHome = true;
    ProtectKernelTunables = true;
    ProtectKernelModules = true;
    ProtectControlGroups = true;
    ProtectKernelLogs = true;
    ProtectHostname = true;
    ProtectClock = true;
    ProtectProc = "invisible";
    ProcSubset = "pid";
    # PrivateUsers removed — breaks NixOS store ELF loading
    PrivateDevices = true;
    NoNewPrivileges = true;
    LockPersonality = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    RestrictAddressFamilies = "AF_INET AF_INET6 AF_UNIX";  # needs AF_UNIX for dbus
    RestrictNamespaces = true;
    # SystemCallFilter removed — whitelist was too narrow, causing linker crash
    SystemCallArchitectures = "native";
    UMask = "0077";
  };
};

systemd.services.NetworkManager = {
  serviceConfig = {
  NoNewPrivileges = true;
  ProtectClock = true;
  ProtectKernelLogs = true;
  ProtectControlGroups = true;
  ProtectKernelModules = true; 
  SystemCallArchitectures = "native";
  MemoryDenyWriteExecute= true;
  ProtectProc = "invisible";
  ProcSubset = "pid";  
  RestrictNamespaces = true;
  ProtectKernelTunables= true;
  ProtectHome = true;
  PrivateTmp = true;
  UMask = "0077";
  };
};

systemd.services."dbus" = {
    serviceConfig = {
      PrivateTmp = true;
      PrivateNetwork = true;
      ProtectSystem = "full";
      ProtectHome = true;
      SystemCallFilter = "~@clock @cpu-emulation @module @mount @obsolete @raw-io @reboot @swap";
      ProtectKernelTunables = true;
      NoNewPrivileges = true;
      CapabilityBoundingSet=["~CAP_SYS_TIME" "~CAP_SYS_PACCT" "~CAP_KILL" "~CAP_WAKE_ALARM" "~CAP_SYS_BOOT" "~CAP_SYS_CHROOT" "~CAP_LEASE" "~CAP_MKNOD" "~CAP_NET_ADMIN" "~CAP_SYS_ADMIN" "~CAP_SYSLOG" "~CAP_NET_BIND_SERVICE" "~CAP_NET_BROADCAST" "~CAP_AUDIT_WRITE" "~CAP_AUDIT_CONTROL" "~CAP_SYS_RAWIO" "~CAP_SYS_NICE" "~CAP_SYS_RESOURCE" "~CAP_SYS_TTY_CONFIG" "~CAP_SYS_MODULE" "~CAP_IPC_LOCK" "~CAP_LINUX_IMMUTABLE" "~CAP_BLOCK_SUSPEND" "~CAP_MAC_*" "~CAP_DAC_*" "~CAP_FOWNER" "~CAP_IPC_OWNER" "~CAP_SYS_PTRACE" "~CAP_SETUID" "~CAP_SETGID" "~CAP_SETPCAP" "~CAP_FSETID" "~CAP_SETFCAP" "~CAP_CHOWN"];
      ProtectKernelModules= true;
ProtectKernelLogs= true;
ProtectClock= true;
ProtectControlGroups= true;
RestrictNamespaces= true;
MemoryDenyWriteExecute= true;
RestrictAddressFamilies= ["~AF_PACKET" "~AF_NETLINK"];
ProtectHostname= true;
LockPersonality= true;
RestrictRealtime= true;
PrivateUsers= true;
    };
  };

systemd.services."systemd-ask-password-console" = {
  serviceConfig = {
    ProtectSystem = "strict";
    ProtectHome = true;
    ProtectKernelTunables = true;
    ProtectKernelModules = true;
    ProtectControlGroups = true;
    ProtectKernelLogs = true;
    ProtectClock = true;
    ProtectProc = "invisible";
    ProcSubset = "pid";
    PrivateTmp = true;
    PrivateUsers = true;
    PrivateDevices = false;   # needs TTY/console device access
    PrivateIPC = true;
    MemoryDenyWriteExecute = true;
    NoNewPrivileges = true;
    LockPersonality = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    RestrictAddressFamilies = "AF_UNIX";  # uses Unix sockets for IPC, not inet
    RestrictNamespaces = true;
    SystemCallFilter = [ "@system-service" ];
    SystemCallArchitectures = "native";
    UMask = "0077";
    # Remove IPAddressDeny entirely — it's irrelevant without inet and causes issues
  };
};

systemd.services."systemd-ask-password-wall" = {
  serviceConfig = {
    ProtectSystem = "strict";
    ProtectHome = true;
    ProtectKernelTunables = true;
    ProtectKernelModules = true;
    ProtectControlGroups = true;
    ProtectKernelLogs = true;
    ProtectClock = true;
    ProtectProc = "invisible";
    ProcSubset = "pid";
    PrivateTmp = true;
    PrivateUsers = true;
    PrivateDevices = true;    # wall only writes to logged-in terminals, no raw dev needed
    PrivateIPC = true;
    MemoryDenyWriteExecute = true;
    NoNewPrivileges = true;
    LockPersonality = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    RestrictAddressFamilies = "AF_UNIX";  # same fix as above
    RestrictNamespaces = true;
    SystemCallFilter = [ "@system-service" ];
    SystemCallArchitectures = "native";
    UMask = "0077";
    # Remove IPAddressDeny here too
  };
};

# Kernal Disabling weird stuff
  boot.blacklistedKernelModules = [
    # Obscure network protocols
    "ax25"
    "netrom"
    "rose"
    # Old or rare or insufficiently audited filesystems
    "adfs"
    "affs"
    "bfs"
    "befs"
    "cramfs"
    "efs"
    "erofs"
    "exofs"
    "freevxfs"
    "f2fs"
    "vivid"
    "gfs2"
    "ksmbd"
    "nfsv4"
    "nfsv3"
    "cifs"
    "nfs"
    "cramfs"
    "freevxfs"
    "jffs2"
    "hfs"
    "hfsplus"
    "squashfs"
    "udf"
    "hpfs"
    "jfs"
    "minix"
    "nilfs2"
    "omfs"
    "qnx4"
    "qnx6"
    "sysv"
  ];
}
