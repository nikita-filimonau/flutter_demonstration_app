#!/bin/bash

sh ./run-scripts/deploy.sh ipa $1 ios $2
sh ./run-scripts/deploy.sh appbundle $1 android $2