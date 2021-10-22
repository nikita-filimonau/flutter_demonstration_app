#!/bin/bash

DART_DEFINE_PARAMS="flutter build $1"

if [ ! -z "$2" ]
then
    SUPPLIED_ENV_FILE="$2"
    while IFS= read -r line || [[ -n "$line" ]];
    do
      if ! [[ $line == *"#"* ]]; then
        DART_DEFINE_PARAMS="$DART_DEFINE_PARAMS --dart-define=$line"
      fi
    done < "$SUPPLIED_ENV_FILE"
fi

eval $DART_DEFINE_PARAMS