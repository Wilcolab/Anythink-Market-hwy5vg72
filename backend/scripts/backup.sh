#!/bin/bash
set -x
set -e
echo "succes"

tar -cvzf "../backup.tar.gz" "$1"
exit 0