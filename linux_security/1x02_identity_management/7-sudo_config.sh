#!/bin/bash
cat <<EOF | tee /etc/sudoers.d/junior
junior ALL=(root) /usr/bin/systemctl restart apache2, /usr/bin/journalctl
EOF

chmod 0440 /etc/sudoers.d/junior

visudo -c

