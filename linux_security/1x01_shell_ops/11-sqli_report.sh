#!/bin/bash
grep -i "$2" "$1" | awk '{print substr($4,2) "," $1}' | sort -t, -k2,2 > "$3"
