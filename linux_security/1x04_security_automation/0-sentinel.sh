#!/bin/bash
set -e

CONFIG_FILE="/opt/sentinel/sentinel.conf"

# Load configuration
if [ ! -f "$CONFIG_FILE" ]; then
  echo "ERROR: Config file missing"
  exit 1
fi

# shellcheck source=/opt/sentinel/sentinel.conf
source "$CONFIG_FILE"

# Validate config variables
[ -z "${SERVICES+x}" ] && { echo "ERROR: SERVICES not defined"; exit 1; }
[ -z "${FILES_TO_WATCH+x}" ] && { echo "ERROR: FILES_TO_WATCH not defined"; exit 1; }

echo "Configuration loaded successfully"

