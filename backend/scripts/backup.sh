#!/bin/bash
hugo
set -x
set -e 
echo "hello"
file=$1

tar czf ~/backup.tar.gz "$file"

echo "Backup created successfully: ~/backup.tar.gz"
exit 0
