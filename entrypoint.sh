#!/bin/sh -e
set -o pipefail
PLANCTON_CONF_URL=${PLANCTON_CONF_URL:-"https://raw.githubusercontent.com/mconcas/plancton-conf/dryrun/config.yaml"}
PLANCTON_CONF_UPDATE=${PLANCTON_CONF_UPDATE:-600}
mkdir -p /etc/plancton && [[ -d /etc/plancton ]]
I=0
while [[ $I -lt 2 ]]; do
  curl -sSLf ${PLANCTON_CONF_NOSSLVERIFY:+-k} -o /etc/plancton/config.yaml "$PLANCTON_CONF_URL" && break || true
  sleep $I
  I=$(( I + 1 ))
done
[[ -e /etc/plancton/config.yaml ]] || { echo "Could not download configuration from $PLANCTON_CONF_URL, aborting"; exit 1; }
( while true; do curl -sSLf ${PLANCTON_CONF_NOSSLVERIFY:+-k} -o /etc/plancton/config.yaml "$PLANCTON_CONF_URL" || true; sleep "$PLANCTON_CONF_UPDATE"; done; )&
[[ $PLANCTON_START_DRAIN ]] && planctonctl drain
planctonctl nodaemon
