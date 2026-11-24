#!/bin/bash
set -e
cd "$(dirname "$0")"
PSQL=$(command -v psql || ls /usr/pgsql-*/bin/psql | tail -1)
sudo -u postgres "$PSQL" -f - < init.sql
date > /tmp/workload-ok
