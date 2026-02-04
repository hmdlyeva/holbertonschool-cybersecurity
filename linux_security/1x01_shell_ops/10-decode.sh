#!/bin/bash
grep 'shell.php' /var/log/analysis/access.log | sed -n 's/.*cmd=\([^ "&]*\).*/\1/p' | base64 -d > attacker_command.txt

