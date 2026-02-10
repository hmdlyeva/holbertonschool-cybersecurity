#!/bin/bash

network_hardening() {
  ufw --force reset
  ufw default deny incoming
  ufw default allow outgoing

  ufw allow "$SSH_PORT"/tcp

  [ "$ALLOW_HTTP" = true ] && ufw allow 80/tcp
  [ "$ALLOW_HTTPS" = true ] && ufw allow 443/tcp

  ufw --force enable

  # Kernel hardening
  sysctl -w net.ipv4.ip_forward=0
  sysctl -w net.ipv4.icmp_echo_ignore_all=1
}
