#!/bin/sh
log_file=$1
tar -czf backup.tar.gz $log_file

echo "success"
exit 0