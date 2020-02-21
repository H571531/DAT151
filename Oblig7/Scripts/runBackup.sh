#!/bin/bash

#Faste variabler
BACKUPDIR="/extra/backup/DB"
NOW=$( date '+%F_%H:%M:%S' )
TIMESTAMP=$( date '+%s')

mkdir $BACKUPDIR/$TIMESTAMP
#Backup av databaser
	# Finner liste av databaser som kan kjøre vanlig prosedyre. 
set -- $(mysql -u backupAdmin --skip-column-names -e "SHOW DATABASES WHERE \`Database\` NOT IN ('mysql','information_schema')")
for db
do
	mysqldump --user backupAdmin --single-transaction  $db > $BACKUPDIR/$TIMESTAMP/$db'_'$NOW.sql
done
	# Egen backup av mysql databasen 
	mysqldump --user backupAdmin --single-transaction  mysql > $BACKUPDIR/$TIMESTAMP/'mysql_'$NOW.sql

#Binær log backup:



# lager tar.gz arkiv av backup for å spare plass. 
tar -czvf $BACKUPDIR/$TIMESTAMP'_Backup_'$NOW.tar.gz $BACKUPDIR/$TIMESTAMP
rm -r $BACKUPDIR/$TIMESTAMP
exit 0
