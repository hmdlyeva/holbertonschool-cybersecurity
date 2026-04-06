#!/bin/bash
cat <<EOF | tee /etc/sudoers.d/$1
junior ALL=(root) /usr/bin/systemctl restart apache2, /usr/bin/journalctl
EOF

chmod 0440 /etc/sudoers.d/$1

visudo -c

