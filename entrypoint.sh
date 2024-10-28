#!/bin/sh

set -e
set -x

for i in $INPUT_SOURCE_PATTERN; do
    INPUT_SOURCE_FILE=$i
    export INPUT_SOURCE_FILE
    ./copy.sh
done
