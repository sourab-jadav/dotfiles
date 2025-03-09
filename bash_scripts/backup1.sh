#!/bin/bash
#
#Take a backup of the specific user home directory
#
#
USERNAME=sourab

BACKUP_LOCATION=/backup

tar -cvfz $BACKUP_LOCATION/$USERNAME.tar.gz /home/$USERNAME 


echo "Backup of  $USERNAME home directory completed"
