#!/bin/bash
awk -F\" '{print $6}' /var/log/analysis/access.log | sort | uniq -c | awk '$1 < 10 {print $2}'

