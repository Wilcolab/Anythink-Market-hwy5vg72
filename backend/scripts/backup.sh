#!/usr/bin/env bash
log_fil="$1"


tar -czf  "backup.tar.gz" -C / "$log_fil"
