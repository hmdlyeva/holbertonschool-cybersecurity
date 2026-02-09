#!/bin/bash
set -e
check_services() {
  for svc in "${SERVICES[@]}"; do
    if systemctl is-active --quiet "$svc"; then
      echo "OK: $svc is running"
    else
      systemctl restart "$svc"
      echo "FIXED: Restarted $svc"
    fi
  done
}
check_services

