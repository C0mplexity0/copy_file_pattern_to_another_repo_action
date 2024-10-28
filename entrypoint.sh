for i in $INPUT_SOURCE_PATTERN; do
    INPUT_SOURCE_FILE = $i
    EXPORT INPUT_SOURCE_FILE
    ./copy.sh
done
