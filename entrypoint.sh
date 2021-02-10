#!/usr/bin/env sh
set -e

echo "mjpeg-proxy commit: $(cat /usr/local/share/mjpeg-proxy/VERSION)"

exec "$@"
