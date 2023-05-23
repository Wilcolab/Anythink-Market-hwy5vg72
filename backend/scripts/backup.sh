#!/bin/bash

backup=backup.tar.gz
tar -zcvf $backup  $1
mv backup.tar.gz /