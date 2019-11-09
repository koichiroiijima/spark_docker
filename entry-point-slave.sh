#!/bin/bash
set -e
cd "$(dirname "$0")"

/opt/spark/sbin/start-slave.sh  spark://sparkmaster:7077

sleep infinity
