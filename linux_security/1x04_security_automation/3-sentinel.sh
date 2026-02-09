#!/bin/bash
set -e

check_ports() {
  ss -lntH | awk '{print $4}' | while read addr; do
    port="${addr##*:}"

    allowed=0
    for p in "${ALLOWED_PORTS[@]}"; do
      [[ "$port" == "$p" ]] && allowed=1 && break
    done
    [ "$allowed" -eq 1 ] && continue

    fuser -k "${port}/tcp" >/dev/null 2>&1 || true
    echo "ALERT: Killed rogue process on port $port"
  done
}

check_ports

