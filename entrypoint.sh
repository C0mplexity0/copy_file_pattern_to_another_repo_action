#!/usr/bin/env bash
shopt -s extglob

set -e
set -x

for file in $INPUT_SOURCE_PATTERN; do
    INPUT_SOURCE_FILE=$file
    export INPUT_SOURCE_FILE
    ./copy.sh
done
