#!/bin/sh

set -e

# check if a custom server.properties exist
if [ -e /pocketmine/config/server.properties ]; then
  rm -f /pocketmine/server.properties
  ln -s /pocketmine/config/server.properties /pocketmine/server.properties
fi

# check if a custom php.ini exist
if [ -e /pocketmine/config/php.ini ]; then
  rm -f /pocketmine/php.ini
  ln -s /pocketmine/config/php.ini /pocketmine/php.ini
fi

exec "$@"
