#!/bin/bash

HASH=$1
REMOTE=$2
HOST="$(echo $REMOTE | sed -e 's/^.*@//' -e 's/:/\//' -e 's/\.git$//')"

URL="https://$HOST/-/commit/$HASH"

open "$URL"
