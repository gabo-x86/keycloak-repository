#!/bin/sh

echo "Starting copying default configuration...";

cd /opt/keycloak/bin/;

./kc.sh import --optimized --file /opt/keycloak/data/import/global.json;

echo "Importing done!";
echo "Server initializing...";

./kc.sh start-dev;
