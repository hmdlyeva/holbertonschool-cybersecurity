#!/bin/bash
awk -F: '$3>=1000{print $1}' /etc/passwd | while read u; do
  for g in docker disk shadow; do
    id "$u" | grep -qw "$g" && echo "$u:$g"
  done
done

