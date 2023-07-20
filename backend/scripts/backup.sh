#!/bin/sh

set -x
set -e
tar -czvf "backup.tar.gz" "$1"

echo "success"
exit 0