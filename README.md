# OpenShift ETCD Backup

This image can be used to backup ETCD (copies are stored on all masters) and then uploaded to an object storage.

## Configuration

If you're using AWS S3 for storage you need to add the following environment variables to the CronJob pod:
 
`S3_BUCKET`
`AWS_SECRET_ACCESS_KEY`
`AWS_ACCESS_KEY_ID`
`AWS_DEFAULT_REGION`
