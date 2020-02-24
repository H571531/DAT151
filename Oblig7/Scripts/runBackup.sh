#!/bin/bash

#Faste variabler
BACKUPDIR="/extra/backup/DB"
LOGDIR="/var/lib/mysql"
NOW=$( date '+%F_%H:%M:%S' )
TIMESTAMP=$( date '+%s')


mkdir $BACKUPDIR/$TIMESTAMP
#Backup av databaser
	# Finner liste av databaser som kan kjøre vanlig prosedyre.
	# Bruker brukeren backupAdmin som har rettigheter til å gjøre backup.  
set -- $(mysql -u backupAdmin --skip-column-names -e "SHOW DATABASES WHERE \`Database\` NOT IN ('mysql','information_schema','performance_schema')")
for db
do
	mysqldump --user backupAdmin --master-data=2 --single-transaction -F --databases $db > $BACKUPDIR/$TIMESTAMP/$db'_'$NOW.sql
done
	# Egen backup av mysql databasen 
	mysqldump --user backupAdmin --single-transaction -F mysql --databases > $BACKUPDIR/$TIMESTAMP/'mysql_'$NOW.sql

#Binær log backup:
	#Flytter binærloggene
mv $LOGDIR/*-bin.0* $BACKUPDIR/$TIMESTAMP/


# lager tar.gz arkiv av backup for å spare plass. 
tar -czvf $BACKUPDIR/$TIMESTAMP'_Backup_'$NOW.tar.gz $BACKUPDIR/$TIMESTAMP
# Sletter ukomprimert mappe
rm -r $BACKUPDIR/$TIMESTAMP
exit 0
