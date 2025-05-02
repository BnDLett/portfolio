#!/bin/sh

SCRIPT_PATH=$(dirname "$SCRIPT")
cd "$SCRIPT_PATH" || (echo "Failed to start program." && exit)

while true
do
        git pull
        # Sleeps for 43200 seconds; aka 12 hours.
        sleep 43200
done
