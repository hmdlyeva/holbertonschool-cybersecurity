#!/bin/bash

ssh_hardening() {
 sed -i "s/^#Port .*/Port $SSH_PORT/" /etc/ssh/sshd_config
 sed -i "s/^Port .*/Port $SSH_PORT/" /etc/ssh/sshd_config

 sed -i "s/^#PasswordAuthentication yes/PasswordAuthentication no/" /etc/ssh/sshd_config
 sed -i "s/^#PubkeyAuthentication yes/PubkeyAuthentication yes/" /etc/ssh/sshd_config

 sed -i "s/^#PermitRootLogin .*/PermitRootLogin no/" /etc/ssh/sshd_config

}
