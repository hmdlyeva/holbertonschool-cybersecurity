#!/bin/bash
apt-get install -y $1
sed -i '/pam_unix.so/i password requisite pam_pwquality.so minlen=12 minclass=3' $2
