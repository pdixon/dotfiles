#! /bin/bash

EXCLUDEFILE=~/backup-excludes
TARFILE=/tmp/$(hostname -s)-$(date "+%Y-%m-%d").tar.gz

cd /Users/
tar -v --create --gzip --one-file-system -X ${EXCLUDEFILE} -f${TARFILE} pdixon/
