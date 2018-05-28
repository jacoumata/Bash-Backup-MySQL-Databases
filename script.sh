#!/usr/local/bin/bash
dbUsername="username_with_root_rights"
dbHost="333.333.333.333"
dbBackup="/path/to/backup/databases"
date=$( date +%Y-%m-%d )
cd $dbBackup && mkdir $date
for db in $( mysql -u $dbUsername -Bse "show databases" ); do
mysqldump -u $dbUsername --single-transaction --opt --databases $db | gzip -9 >${dbBackup}/${date}/${db}.sql.gz
