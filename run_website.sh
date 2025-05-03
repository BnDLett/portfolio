#!/bin/sh
SCRIPT_PATH=$(dirname "$SCRIPT")

echo "Starting auto-updater job."
"$SCRIPT_PATH"/update_website.sh &

echo "Starting gunicorn."
if [ -e server.crt ] && [ -e server.key ]
then
  gunicorn -w 4 'main:app' -b 0.0.0.0:8080 --certfile=server.crt --keyfile=server.key --reload
else
  gunicorn -w 4 'main:app' -b 0.0.0.0:8080 --reload
fi

kill "$(jobs -p)"
