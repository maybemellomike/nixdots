{ config, pkgs, lib, ... }:
{
  # Kernel network hardening
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

  # Disable unused / attack-surface kernel modules
  boot.blacklistedKernelModules = [
    "dccp"
    "sctp"
    "rds"
    "tipc"
  ];

  # Overwrite freed/allocated memory pages
  boot.kernelParams = [ "init_on_free=1" "init_on_alloc=1" ];
}
