#!/bin/bash

update_xml() {
  DART_DEFINE_PARAMS=""
  FILE_NAME="$1"
  TAG="option"
  TAG_NAME="additionalArgs"

  TEMP="temp_file.temp"
  trim_value=`echo $2 | sed -e 's/^[[:space:]]*//'`
  # echo $trim_value
  new_value="<$TAG name=\"$TAG_NAME\" value=\"$trim_value\" \/>"
  sed "s/<$TAG name=\"$TAG_NAME\" value=.*\/>/$new_value/" $FILE_NAME > $TEMP

  chmod 666 $FILE_NAME
  mv $TEMP $FILE_NAME
}

flutter_run() {
  DART_DEFINE_PARAMS=""

  if [ ! -z "$1" ]
  then
      SUPPLIED_ENV_FILE="$1"
      while IFS= read -r line || [[ -n "$line" ]];
      do
        if ! [[ $line == *"#"* ]]; then
          DART_DEFINE_PARAMS="$DART_DEFINE_PARAMS --dart-define=$line"
        fi
      done < "$SUPPLIED_ENV_FILE"
  fi

  DART_DEFINE_PARAMS=$DART_DEFINE_PARAMS | xargs

  update_xml "$2" "$DART_DEFINE_PARAMS"
}

echo '---START UPDATE---'
flutter_run ../.env ./prod.run.xml
flutter_run ../.env.dev ./dev.run.xml
flutter_run ../.env.stage ./stage.run.xml
echo '---FINISH UPDATE---'