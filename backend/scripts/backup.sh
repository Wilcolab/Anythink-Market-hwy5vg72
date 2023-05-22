#!/bin/bash
log_file="$1"


tar -czf  "backup.tar.gz" -C / "$log_file"
