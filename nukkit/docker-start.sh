#!/bin/sh

set -e

# check if a custom nukkit.yml exist
if [ -e /nukkit/config/nukkit.yml ]; then
  rm -f /nukkit/nukkit.yml
  ln -s /nukkit/config/nukkit.yml /nukkit/nukkit.yml
fi

# check if a custom server.properties exist
if [ -e /nukkit/config/server.properties ]; then
  rm -f /nukkit/server.properties
  ln -s /nukkit/config/server.properties /nukkit/server.properties
fi

exec "$@"
