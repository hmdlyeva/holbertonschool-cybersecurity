#!/bin/bash

identity_hardening() {
 # Password policy
 sed -i "s/^# minlen.*/minlen = $PASS_MIN_LEN/" /etc/security/pwquality.conf
 sed -i "s/^# dcredit.*/dcredit = -1/" /etc/security/pwquality.conf
 sed -i "s/^# ucredit.*/ucredit = -1/" /etc/security/pwquality.conf
 sed -i "s/^# lcredit.*/lcredit = -1/" /etc/security/pwquality.conf
 sed -i "s/^# ocredit.*/ocredit = -1/" /etc/security/pwquality.conf

 sed -i "s/^PASS_MAX_DAYS.*/PASS_MAX_DAYS $PASS_MAX_DAYS/" /etc/login.defs

 # Lockout
 grep -q pam_tally2 /etc/pam.d/common-auth || \
   echo "auth required pam_tally2.so deny=$FAIL_LOCK_ATTEMPTS unlock_time=600" >> /etc/pam.d/common-auth

 # Lock root
 passwd -l root
}
