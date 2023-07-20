#!/bin/bash

set -eu

oc get no -l node-role.kubernetes.io/master --no-headers -o name | grep ${MASTER_NUMBER} | xargs -I {} --  oc debug {} -- bash -c 'chroot /host sudo -E /usr/local/bin/cluster-backup.sh /home/core/backup/ && chroot /host sudo -E find /home/core/backup/ -type f -mtime +7 -delete'

mkdir -p /backups/master-${MASTER_NUMBER}
cp -rf host/home/core/backup/* /backups/master-${MASTER_NUMBER}
