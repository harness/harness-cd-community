#!/usr/bin/env bash
set -e

FILE=images.tar.gz

if [[ -f "$FILE" ]]; then
    docker load < $FILE
    echo "Images loaded successfully, run Harness using start_harness.sh"
else
   echo "$FILE does not exist, failed to load docker images"
   exit 1
fi

