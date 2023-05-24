#!/usr/bin/env bash
backup_file="/backup.tar.gz"  


backup_file="/backup.tar.gz"
tar -czf "$backup_file" "$1"
exit 0
