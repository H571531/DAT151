--Setup
> mysql -u adrian -p privBase
> source /home/admo/git/DAT151/Oblig1/SQL/CreateTable.sql
> source /home/admo/git/DAT151/Oblig1/SQL/InsertMockData.sql
> SELECT * FROM bedrift;
> SELECT * FROM person;



> ALTER TABLE person ENGINE=InnoDB;
Return: Query OK, 0 rows affected (0.091 sec)
	Records: 0  Duplicates: 0  Warnings: 0

> ALTER TABLE person ENGINE=MyISAM;
Return: ERROR 1217 (23000): Cannot delete or update a parent row: a foreign key constraint fails
--Dette er siden MyISAM ikke sjekker foreignkeys. Lager derfor nytt table "testTable" uten noen FK for å kjøre denne operasjonen.

> SHOW INDEX FROM person;
Return:	+--------+------------+-----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
	| Table  | Non_unique | Key_name  | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
	+--------+------------+-----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
	| person |          0 | PRIMARY   |            1 | enId        | A         |           4 |     NULL | NULL   |      | BTREE      |         |               |
	| person |          1 | bedriftFK |            1 | bedriftsId  | A         |           4 |     NULL | NULL   | YES  | BTREE      |         |               |
	+--------+------------+-----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
--Kan ha flere av samme FK
--Viser Null er permitted som FK dvs En person trenger ikke ha en bedrift. 

> SHOW INDEX FROM person;
Return:	+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
	| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
	+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
	| bedrift |          0 | PRIMARY  |            1 | bedriftsId  | A         |           2 |     NULL | NULL   |      | BTREE      |         |               |
	+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+

> ANALYZE TABLE person;
Return:	+-----------------+---------+----------+----------+
	| Table           | Op      | Msg_type | Msg_text |
	+-----------------+---------+----------+----------+
	| privBase.person | analyze | status   | OK       |
	+-----------------+---------+----------+----------+

> ANALYZE TABLE bedrift;
Return:	+------------------+---------+----------+----------+
	| Table            | Op      | Msg_type | Msg_text |
	+------------------+---------+----------+----------+
	| privBase.bedrift | analyze | status   | OK       |
	+------------------+---------+----------+----------+

> CHECK TABLE person;
Return:	+-----------------+-------+----------+----------+
	| Table           | Op    | Msg_type | Msg_text |
	+-----------------+-------+----------+----------+
	| privBase.person | check | status   | OK       |
	+-----------------+-------+----------+----------+
> CHECK TABLE bedrift;
Return:	+------------------+-------+----------+----------+
	| Table            | Op    | Msg_type | Msg_text |
	+------------------+-------+----------+----------+
	| privBase.bedrift | check | status   | OK       |
	+------------------+-------+----------+----------+

> REPAIR TABLE testTable;
Return:	+--------------------+--------+----------+----------+
	| Table              | Op     | Msg_type | Msg_text |
	+--------------------+--------+----------+----------+
	| privBase.testTable | repair | status   | OK       |
	+--------------------+--------+----------+----------+

> OPTIMIZE TABLE testTable;
	+--------------------+----------+----------+----------+
	| Table              | Op       | Msg_type | Msg_text |
	+--------------------+----------+----------+----------+
	| privBase.testTable | optimize | status   | OK       |
	+--------------------+----------+----------+----------+


