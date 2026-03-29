#!/bin/bash
grep "$2" $1 | sed -n 's/.*cmd=\([^ "&]*\).*/\1/p' | base64 -d > $3

