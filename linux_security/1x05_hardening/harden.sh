#!/bin/bash

set -e

if [[ "$EUID" -ne 0 ]]; then
  echo "ERROR: Must be run as root"
  exit 1
fi

source config/harden.cfg
source lib/network.sh
source lib/ssh.sh
source lib/identity.sh
source lib/system.sh

log() {
  echo "$(date '+%F %T') $1" >> /var/log/hardening.log
}

network_hardening
ssh_hardening
identity_hardening
system_hardening


log "Hardening framework initialized"
