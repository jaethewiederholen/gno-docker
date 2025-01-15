#!/bin/sh

set -e
set -o errexit
set -o nounset
set -o pipefail

GENESIS_FILE="/data/genesis.json"
CONFIG_FILE="/data/config.toml"

cp -R /config/* /data
mkdir -p /data/secrets/

echo 

cp /config/secrets/node_key.json /data/secrets/node_key.json;
cp /config/secrets/priv_validator_key.json /data/secrets/priv_validator_key.json;
cp /config/secrets/priv_validator_state.json /data/secrets/priv_validator_state.json;

export ADDRESS=$(grep -o '"address": *"[^"]*"' /config/secrets/priv_validator_key.json | grep -o '"[^"]*"$' | sed 's/"//g')

touch /var/log/gnoland/gnoland-$(hostname -i).log
cat /proc/1/fd/2 /proc/1/fd/1 > /var/log/gnoland/gnoland-$(hostname -i).log &


exec gnoland start \
-data-dir /data \
-log-level info \
-genesis ${GENESIS_FILE} \
#-flag-config-path ${CONFIG_FILE}
2>&1