{ config, pkgs, lib, ... }:
{
  # Firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ ];
    allowedUDPPorts = [ ];
    logRefusedConnections = true;
  };

  # Kernel sysctl hardening
  boot.kernel.sysctl = {
    # ICMP
    "net.ipv4.icmp_echo_ignore_broadcasts" = 1;
    "net.ipv4.icmp_ignore_bogus_error_responses" = 1;

    # Spoofing / redirect protection
    "net.ipv4.conf.all.rp_filter" = 1;
    "net.ipv4.conf.default.rp_filter" = 1;
    "net.ipv4.conf.all.send_redirects" = 0;
    "net.ipv4.conf.default.send_redirects" = 0;
    "net.ipv4.conf.all.accept_redirects" = 0;
    "net.ipv4.conf.default.accept_redirects" = 0;
    "net.ipv6.conf.all.accept_redirects" = 0;

    # TCP
    "net.ipv4.tcp_timestamps" = 0;
    "net.ipv4.tcp_syncookies" = 1;

    # Logging
    "net.ipv4.conf.all.log_martians" = 1;

    # Kernel pointer / info leaks
    "kernel.kptr_restrict" = 2;
    "kernel.dmesg_restrict" = 1;
    "kernel.yama.ptrace_scope" = 1;
    "kernel.kexec_load_disabled" = 1;
  };

  # Kernel module blacklist (your extended list, with my additions merged in)
  boot.blacklistedKernelModules = [
    # Obscure network protocols
    "ax25"
    "netrom"
    "rose"
    "dccp"
    "sctp"
    "rds"
    "tipc"
    # Rare/unaudited filesystems
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

  # Overwrite freed/allocated memory pages
  boot.kernelParams = [ "init_on_free=1" "init_on_alloc=1" ];

  # systemd service hardening
  systemd.services.systemd-journald = {
    serviceConfig = {
      UMask = "0077";
      PrivateNetwork = true;
      ProtectHostname = true;
      ProtectKernelModules = true;
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
      MemoryDenyWriteExecute = true;
      ProtectProc = "invisible";
      ProcSubset = "pid";
      RestrictNamespaces = true;
      ProtectKernelTunables = true;
      ProtectHome = true;
      PrivateTmp = true;
      UMask = "0077";
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
      PrivateDevices = true;
      NoNewPrivileges = true;
      LockPersonality = true;
      RestrictRealtime = true;
      RestrictSUIDSGID = true;
      RestrictAddressFamilies = "AF_INET AF_INET6 AF_UNIX";
      RestrictNamespaces = true;
      SystemCallArchitectures = "native";
      UMask = "0077";
    };
  };

  systemd.services.systemd-ask-password-console = {
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
      PrivateDevices = false;
      PrivateIPC = true;
      MemoryDenyWriteExecute = true;
      NoNewPrivileges = true;
      LockPersonality = true;
      RestrictRealtime = true;
      RestrictSUIDSGID = true;
      RestrictAddressFamilies = "AF_UNIX";
      RestrictNamespaces = true;
      SystemCallFilter = [ "@system-service" ];
      SystemCallArchitectures = "native";
      UMask = "0077";
    };
  };

  systemd.services.systemd-ask-password-wall = {
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
      PrivateDevices = true;
      PrivateIPC = true;
      MemoryDenyWriteExecute = true;
      NoNewPrivileges = true;
      LockPersonality = true;
      RestrictRealtime = true;
      RestrictSUIDSGID = true;
      RestrictAddressFamilies = "AF_UNIX";
      RestrictNamespaces = true;
      SystemCallFilter = [ "@system-service" ];
      SystemCallArchitectures = "native";
      UMask = "0077";
    };
  };
}
