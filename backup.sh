#!/bin/bash
set -euo pipefail
 
SOURCE="${1:-/home/$USER/Documents}"
BACKUP_DIR="${2:-/home/$USER/Backups}"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
RETENTION_DAYS=7
 
if [ ! -d "$SOURCE" ]; then
    echo "Error: source directory '$SOURCE' not found" >&2
    exit 1
fi
 
mkdir -p "$BACKUP_DIR"
 
ARCHIVE="$BACKUP_DIR/backup_$DATE.tar.gz"
tar -czf "$ARCHIVE" "$SOURCE"
 
echo "Backup created: $ARCHIVE"

find "$BACKUP_DIR" -name "backup_*.tar.gz" -mtime +"$RETENTION_DAYS" -delete
 
echo "Old backups (older than $RETENTION_DAYS days) removed"
