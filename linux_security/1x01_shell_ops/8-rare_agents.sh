#!/bin/bash
awk -F\" '{print $6}' $1 | sort | uniq -c | awk '$1 < 10 {print $2}'

