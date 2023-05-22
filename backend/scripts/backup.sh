#!/bin/bash
log_file="$1"
# log file 
backup_file="/backup.tar.gz"
# this is the name of the dir
tar -czf ="$backup_file" "$log_file"
# create archive of log_file which is present in the dir backup_file
mv "$backup_file" "/"
#this moves the arhive in root dir
echo "done" 