#!/usr/bin/env bash

MAIN_FOLDER_PATH=${PWD}
echo ${MAIN_FOLDER_PATH}

mvn -U clean install -DskipTests -DskipITs=true || exit 1

echo "build finished"
