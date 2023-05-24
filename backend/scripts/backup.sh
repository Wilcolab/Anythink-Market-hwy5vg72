#!/usr/bin/env bash
backup_file="/backup.tar.gz"  # Specify the backup file path and name

chmod +x "$0"
tar -czf "$backup_file" "$1"
exit 0
