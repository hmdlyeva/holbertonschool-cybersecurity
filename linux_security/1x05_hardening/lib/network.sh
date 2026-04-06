#!/bin/bash

network_hardening() {
    # Config vars (from harden.cfg)
    : "${SSH_PORT:=22}"
    : "${ALLOW_HTTP:=true}"
    : "${ALLOW_HTTPS:=true}"

    FIREWALL_FILE="/etc/hardening/firewall.rules"

    # Create /etc/hardening dir if missing
    mkdir -p /etc/hardening

    # Idempotent firewall rules file
    {
        echo "DEFAULT_INPUT=deny"
        echo "DEFAULT_OUTPUT=allow"
        echo "ALLOW_TCP=$SSH_PORT"

        if [ "$ALLOW_HTTP" = true ]; then
            echo "ALLOW_TCP=80"
        fi

        if [ "$ALLOW_HTTPS" = true ]; then
            echo "ALLOW_TCP=443"
        fi
    } > "$FIREWALL_FILE"

    chmod 644 "$FIREWALL_FILE"

    # Kernel hardening: persistent changes in /etc/sysctl.conf
    grep -q '^net.ipv4.ip_forward=' /etc/sysctl.conf \
        && sed -i 's/^net.ipv4.ip_forward=.*/net.ipv4.ip_forward=0/' /etc/sysctl.conf \
        || echo 'net.ipv4.ip_forward=0' >> /etc/sysctl.conf

    grep -q '^net.ipv4.icmp_echo_ignore_all=' /etc/sysctl.conf \
        && sed -i 's/^net.ipv4.icmp_echo_ignore_all=.*/net.ipv4.icmp_echo_ignore_all=1/' /etc/sysctl.conf \
        || echo 'net.ipv4.icmp_echo_ignore_all=1' >> /etc/sysctl.conf
}