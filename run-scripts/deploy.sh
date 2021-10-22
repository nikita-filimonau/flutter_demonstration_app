#!/bin/bash

flutter pub get
sh ./run-scripts/build.sh $1 $2
fastlane $3 fire_dev env:$4 --env $4