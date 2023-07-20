#!/usr/bin/env bash

Sure, here is the shell script that you requested:

#!/bin/bash

log_file=$1

tar -zcvf backup.tar.gz $log_file

mv backup.tar.gz /

exit 0