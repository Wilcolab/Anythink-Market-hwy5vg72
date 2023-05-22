#!/bin/bash
log_file="$1"
backup_file="backup.tar.gz"
root_dir="/"
tar -czf "$backup_file" "$log_file"
mv "$backup_file" "$root_dir"