#!/bin/bash
exec >> /tmp/workload-install.log 2>&1
set -ex
date > /tmp/workload-started
cd "$(dirname "$0")"
PSQL=$(ls /usr/pgsql-*/bin/psql 2>/dev/null | tail -1)
PSQL=${PSQL:-psql}
export PGPASSWORD=$(awk -F' *= *' '/^db_password/{print $2}' /etc/odoo/odoo.conf)
"$PSQL" -h 127.0.0.1 -U odoo -d postgres -f init.sql
date > /tmp/workload-ok
