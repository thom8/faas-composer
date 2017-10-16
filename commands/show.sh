#!/usr/bin/env bash

FILE=build-composer

cat "${1:-/dev/stdin}" > $FILE.json

COMPOSER="$FILE.json" composer show
