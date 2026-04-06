#!/bin/bash

USER="$1"
SECRET="/var/www/html/secret_config.php"
WRAPPER="/usr/local/bin/audit-read-secret"

cat << EOF > "$WRAPPER"
#!/bin/bash
cat $SECRET
EOF

chmod 755 "$WRAPPER"
chown root:root "$WRAPPER"

echo "$USER ALL=(root) NOPASSWD: $WRAPPER" > /etc/sudoers.d/audit_gateway
chmod 440 /etc/sudoers.d/audit_gateway