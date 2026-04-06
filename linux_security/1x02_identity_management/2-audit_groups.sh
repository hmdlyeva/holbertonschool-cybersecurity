#!/bin/bash

awk -F: '$3>=1000{print $1}' "$1" | while read u; do
  for g in docker disk shadow; do
    if id -nG "$u" | tr ' ' '\n' | grep -qx "$g"; then
      echo "$u:$g"
    fi
  done
done