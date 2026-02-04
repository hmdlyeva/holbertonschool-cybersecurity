#!/bin/bash
grep "Failed password" /var/log/analysis/auth.log | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr | awk '{print $1, $2}'

