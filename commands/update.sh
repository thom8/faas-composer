#!/usr/bin/env bash

FILE=build-composer

cat "${1:-/dev/stdin}" > $FILE.json
rm -rf $FILE.lock

COMPOSER="$FILE.json" composer update --no-plugins --ignore-platform-reqs > update.log 2>&1

if [ $? -eq 0 ]; then
  cat $FILE.lock
else
  echo "Composer update failed."
fi

rm -rf cat composer.lock $FILE.lock
