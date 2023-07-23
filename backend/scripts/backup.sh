#!/usr/bin/env bash
set -x
set -e 
echo "hello"
file=$1

tar czf backup.tar.gz $file
