#!/bin/bash

DIR="$1"
GROUP="$2"

chown root:$GROUP "$DIR"
chmod 2750 "$DIR"

cat <<EOF > /etc/logrotate.d/app
/var/log/app/*.log {
    rotate 7
    daily
    missingok
    notifempty
    compress
    create 0640 root $GROUP
}
EOF

chmod 644 /etc/logrotate.d/app