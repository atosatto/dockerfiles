#!/bin/sh

set -e

# check if a custom server.properties exist
if [ -e /genisys/config/server.properties ]; then
  rm -f /genisys/server.properties
  ln -s /genisys/config/server.properties /genisys/server.properties
fi

# check if a custom php.ini exist
if [ -e /genisys/config/php.ini ]; then
  rm -f /genisys/php.ini
  ln -s /genisys/config/php.ini /genisys/php.ini
fi

exec "$@"
