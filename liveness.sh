#!/bin/sh

# path to script
path=$(cd -P -- "$(dirname -- "$0")" && printf '%s\n' "$(pwd -P)")

clamdscan --stream --config-file=/app/conf/clamd.conf ${path}/eicar.com

# clamd
if clamdscan --allmatch --config-file=/app/conf/clamd.conf ${path}/eicar.com | grep -q 'Infected files: 1'; then
    echo "clamd running successfully"
    exit 0
else
    echo "clamd not running"
    exit 1
fi