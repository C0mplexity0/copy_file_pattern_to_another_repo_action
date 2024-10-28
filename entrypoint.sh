#!/bin/sh

set -e
set -x

for i in $INPUT_SOURCE_PATTERN; do
    export INPUT_SOURCE_FILE = $i
    ./copy.sh
done
