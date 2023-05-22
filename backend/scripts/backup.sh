#!/bin/bash
if[$# -lt 1];then
echo "no file is passed in args"
exit 1
fi
log_file=$1
if[! -f "$log_file"];then
echo "invalid path"
exit 1
fi
log_file_name=$(basename "$log_file")
backup_file="backup.tar.gz"
tar -czf="$backup_file" "$log_file"
echo "task succesfull"