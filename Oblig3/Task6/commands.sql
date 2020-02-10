--Laste inn data til auxTable
> SOURCE /home/admo/git/DAT151/OBLIG3/Task6/CreateTableAuxTable.sql
> LOAD DATA LOCAL INFILE '/home/admo/git/DAT151/Oblig3/Task6/data.txt' INTO TABLE auxTable FIELDS TERMINATED BY ';';
> SOURCE /home/admo/git/DAT151/OBLIG3/Task6/CreateSchemaMainTables.sql
> SOURCE /home/admo/git/DAT151/OBLIG3/Task6/moveEventData.sql
> SOURCE /home/admo/git/DAT151/OBLIG3/Task6/movePersonData.sql
> SOURCE /home/admo/git/DAT151/OBLIG3/Task6/createStoreProcedure.sql

> call takeSpace ('5131235','14','Mortensen','Adrian');


