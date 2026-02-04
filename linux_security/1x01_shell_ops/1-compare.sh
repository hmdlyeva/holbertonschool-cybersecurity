#!/bin/bash
diff <(cut -d: -f1 /etc/passwd) <(cut -d: -f1 /etc/passwd | sort)

