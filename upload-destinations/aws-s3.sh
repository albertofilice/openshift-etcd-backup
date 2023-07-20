#!/bin/bash

set -eu

echo "Sending backups to S3..."

if [[ ! -z "$S3_ENDPOINT" && ! -z "$S3_BUCKET" &&  ! -z "$AWS_SECRET_ACCESS_KEY" &&  ! -z "$AWS_ACCESS_KEY_ID" &&  ! -z "$AWS_DEFAULT_REGION" ]]; then
  aws --endpoint ${S3_ENDPOINT} --no-verify-ssl s3 sync /backups s3://$S3_BUCKET/etcd --region=${AWS_DEFAULT_REGION} --expires "$(date -d '+7 days' --utc +'%Y-%m-%dT%H:%M:%SZ')"
fi
