#!/usr/bin/env bash
log_fil="$1"

path_to_file="/backend/scripts/"
full_path="$path_to_file/$log_fil"
tar -czf  "/backup.tar.gz" -C / "$full_path"
