#!/bin/bash
set -e
cd "$(dirname "$0")"

/opt/spark/sbin/start-master.sh --host sparkmaster

sleep infinity