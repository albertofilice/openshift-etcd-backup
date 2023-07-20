#!/bin/bash

set -eu

# This runs the backup using the built in OC cluster backup
./backup.sh

# Run the uploads for various destinations
./upload-destinations/aws-s3.sh
