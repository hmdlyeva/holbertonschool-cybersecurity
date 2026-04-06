#!/bin/bash
mkdir -p $1 && chown root:$2 $1 && chmod 2770 $1 && chmod +t $1
