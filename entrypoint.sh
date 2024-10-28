#!/usr/bin/env bash
shopt -s extglob

set -e
set -x

echo $INPUT_SOURCE_PATTERN

for file in $INPUT_SOURCE_PATTERN; do
    INPUT_SOURCE_FILE=$i
    export INPUT_SOURCE_FILE
    ./copy.sh
done
