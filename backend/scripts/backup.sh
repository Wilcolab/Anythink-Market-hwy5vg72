#!/bin/bash
log_file=$1
tar -czf backup.tar.gz $log_file
exit 0
