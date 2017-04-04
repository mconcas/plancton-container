#! /bin/sh -e

CONFDIR=/etc/plancton
URL="https://raw.githubusercontent.com/mconcas/plancton-conf/dryrun/config.yaml"
SLEEP=30

mkdir -p $CONFDIR
( while [[ 1 ]]; do cd $CONFDIR && curl -LOk $URL || true; sleep $SLEEP; done; ) &

planctonctl nodaemon
