#!/bin/bash

SOURCE="/home/$USER/Documents"
BACKUP_DIR="/home/$USER/Backups"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_DIR/backup_$DATE.tar.gz" "$SOURCE"

echo "Backup created: $BACKUP_DIR/backup_$DATE.tar.gz"
