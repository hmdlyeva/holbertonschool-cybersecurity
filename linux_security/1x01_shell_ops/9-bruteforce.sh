#!/bin/bash
grep "Failed password" $1 | awk '{print $(NF-3)}' | sort | uniq -c | sort -nr | awk '{print $1, $2}'
