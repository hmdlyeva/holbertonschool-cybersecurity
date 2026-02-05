#!/bin/bash
awk -F: '$2~/^\$1\$/{print $1}' /etc/shadow

