#!/bin/bash
grep -R "password =" /etc 2>/dev/null | cut -d: -f1 | sort -u

