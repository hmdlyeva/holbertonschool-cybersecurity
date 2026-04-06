#!/bin/bash

# task 0
CONF="/home/student/sentinel.conf"

[ -f "$CONF" ] || { echo "Config missing"; exit 1; }

source "sentinel.conf"

[ -z "${SERVICES+x}" ] && exit 1
[ -z "${FILES_TO_WATCH+x}" ] && exit 1


# task 4
log() {
    ts=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
    echo "{\"timestamp\":\"$ts\",\"component\":\"$1\",\"target\":\"$2\",\"status\":\"$3\",\"details\":\"$4\"}" \
        >> /var/log/sentinel.log
}

# task 1
check_services() {
    for svc in "${SERVICES[@]}"; do
        if pgrep -f "$svc" >/dev/null; then
            echo "OK: $svc is running"
            log "SERVICE" "$svc" "OK" "$svc is running"
        else
            eval "$svc"
            echo "FIXED: Restarted $svc"
            log "SERVICE" "$svc" "FIXED" "Restarted $svc"
        fi
    done
}
check_services

# task 2
check_integrity() {
    for f in "${FILES_TO_WATCH[@]}"; do
        base=$(basename "$f")
        gold="/var/backups/sentinel/$base.gold"

        h1=$(md5sum "$f" | awk '{print $1}')
        h2=$(md5sum "$gold" | awk '{print $1}')

        if [[ "$h1" == "$h2" ]]; then
            echo "OK: $f integrity verified"
            log "INTEGRITY" "$f" "OK" "Integrity verified"
        else
            cp "$gold" "$f"
            echo "FIXED: Restored $f"
            log "INTEGRITY" "$f" "FIXED" "Restored from golden copy"
        fi
    done
}
check_integrity

# task 3
check_ports() {
    ports=$(ss -lnt | awk 'NR>1 {print $4}' | awk -F: '{print $NF}')

    for p in $ports; do
        allowed=0
        for ap in "${ALLOWED_PORTS[@]}"; do
            [[ "$p" == "$ap" ]] && allowed=1
        done

        if [[ $allowed -eq 0 ]]; then
            fuser -k "$p"/tcp 2>/dev/null
            echo "ALERT: Killed rogue process on port $p"
            log "PORT" "$p" "ALERT" "Killed rogue process"
        else
            log "PORT" "$p" "OK" "Port allowed"
        fi
    done
}
check_ports

