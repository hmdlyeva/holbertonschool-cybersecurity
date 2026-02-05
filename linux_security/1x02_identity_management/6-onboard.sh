#!/bin/bash
set -e

useradd -m "$1"
passwd -l "$1"
mkdir -p /home/$1/.ssh
echo "$2" | sudo tee /home/$1/.ssh/authorized_keys >/dev/null
chmod 700 /home/$1/.ssh
chmod 600 /home/$1/.ssh/authorized_keys
chown -R $1:$1 /home/$1/.ssh

