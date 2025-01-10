#!/bin/bash

NO_LOCK_REQUIRED=false

. ./.env.sh
. ./.common.sh

echo "${bold}*************************************"
echo "Gnoland Dev Quickstart "
echo "*************************************${normal}"
echo "Stop and remove network..."

docker compose down -v
docker compose rm -sfv

rm ${LOCK_FILE}
echo "Lock file ${LOCK_FILE} removed"