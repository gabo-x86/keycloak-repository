#!/bin/sh

echo "Starting copying default configuration...";

cd /opt/keycloak/bin/;

./kc.sh import --optimized --file /opt/keycloak/data/import/global.json;

echo "Done!";
echo "Server initializing...";

./kc.sh start-dev;
