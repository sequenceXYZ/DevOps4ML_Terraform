#!/bin/bash

# set local directory for backup
BACKUP_DIR="/opt"

# set S3 backup directory 
S3_BUCKET="S3_bucket_backup"

# Set the interval between backups in seconds
BACKUP_INTERVAL=60

# Start a loop that will backup the directory every 1 minute
while true; do

  # Create a timestamp for the backup file
  TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

  # Create a backup file with the timestamp
  sudo tar -czvf "$BACKUP_DIR/$TIMESTAMP.tar.gz" "$BACKUP_DIR"

  # Remove any older backup files with the same name
  sudo rm -f "$BACKUP_DIR/$TIMESTAMP.tar.gz*"
  
  # Wait for 1 minute before backing up again
  sleep $BACKUP_INTERVAL

done

# Backup the /opt directory to the S3 bucket
aws s3 sync "$BACKUP_DIR" "s3://$S3_BUCKET"


-------
# optional commands:
# Backup the /opt directory to the S3 bucket
# aws s3 sync /opt s3://sftp-server-backup/${DATE}/${TIME}
# Overwrite any existing files with the same names
# aws s3 sync --overwrite s3://sftp-server-backup/${DATE}/${TIME} /opt
