#!/bin/bash

#Installation:
# chmod +x /pfad/zur/backup_wireguard.sh
# dann mit "sudo crontab -e"
# diese Zeile hinzufügen: "44 3 * * * /pfad/zur/backup_wireguard.sh"



# Definiere Backup-Ordner
BACKUP_DIR="/backup/wireguard-volume" # Sicherstellen, dass dieser Pfad auch existiert
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/wireguard_backup_$TIMESTAMP.tar.gz"

# Backup erstellen
tar -czf $BACKUP_FILE /var/lib/docker/volumes/wg-easy_etc_wireguard/

# Lösche Backups die älter als 91 Tage alt sind.
find $BACKUP_DIR -name "wireguard_backup_*.tar.gz" -type f -mtime +91 -exec rm -f {} \;
