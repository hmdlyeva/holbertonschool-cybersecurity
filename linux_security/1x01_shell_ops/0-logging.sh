#!/bin/bash
exec > execution.log 2>&1; echo "Starting Task"; echo "Doing Work"; echo "Error: Work Failed" >&2

