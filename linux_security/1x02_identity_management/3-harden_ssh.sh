#!/bin/bash
set -e

sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' $1
sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' $1
sed -i 's/^#PubkeyAuthentication yes/PubkeyAuthentication yes/' $1

sshd -t

