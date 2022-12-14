#!/bin/bash

# Restore last dated EFS backup
good_backup=`ls /var/solr/data/ | grep aws-backup-restore | tail -1`
rm -r /var/solr/data/ckan
mv /var/solr/data/$good_backup/ckan /var/solr/data/

# Download the main setup
wget -O common_setup.sh https://raw.githubusercontent.com/GSA/inventory-app/main/solr/solr_setup.sh
chmod 755 common_setup.sh

# Run the main setup
./common_setup.sh
