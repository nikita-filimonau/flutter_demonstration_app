#!/bin/bash

flutter pub get
sh ./run-scripts/build.sh $1 $2
firebase deploy