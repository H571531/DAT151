MariaDB [Oblig3]> select * from Event where eventId like 'abcde';
+---------+------------+------------+-----------+
| eventId | eventTitle | eventDate  | totSpaces |
+---------+------------+------------+-----------+
| abcde   | TestEvent  | 2020-02-25 |         5 |
+---------+------------+------------+-----------+
1 row in set (0.001 sec)

MariaDB [Oblig3]> select * from Atendee where pId like '203020';
+--------+--------+--------+
| pId    | lName  | fName  |
+--------+--------+--------+
| 203020 | Adrian | Adrian |
+--------+--------+--------+
1 row in set (0.000 sec)

> call takeSpace (203020,'abcde');
Query OK, 1 row affected (0.005 sec)

> call takeSpace (203020,'abcde');
Query OK, 1 row affected (0.005 sec)

> call takeSpace (203020,'abcde');
Query OK, 1 row affected (0.005 sec)

> call takeSpace (203020,'abcde');
Query OK, 1 row affected (0.004 sec)

> call takeSpace (203020,'abcde');
Query OK, 1 row affected (0.005 sec)

 call takeSpace (203020,'abcde');
Query OK, 0 rows affected (0.000 sec)

MariaDB [Oblig3]> 


-- Profiling

MariaDB [Oblig3]> SHOW PROFILES;
+----------+------------+-------------------------------------------------------------+
| Query_ID | Duration   | Query                                                       |
+----------+------------+-------------------------------------------------------------+
|        1 | 0.00005695 | REMOVE FROM Reservation where pID like '203020'             |
|        2 | 0.00439758 | DELETE FROM Reservation where pId like '203020'             |
|        3 | 0.00445177 | INSERT INTO Reservation (eventId,pId) VALUES (eventId, pId) |
|        4 | 0.00429047 | INSERT INTO Reservation (eventId,pId) VALUES (eventId, pId) |
|        5 | 0.00407900 | INSERT INTO Reservation (eventId,pId) VALUES (eventId, pId) |
+----------+------------+-------------------------------------------------------------+
5 rows in set (0.000 sec)


MariaDB [Oblig3]> SHOW PROFILE FOR QUERY 3;
+---------------------------+----------+
| Status                    | Duration |
+---------------------------+----------+
| continuing inside routine | 0.000008 |
| Checking permissions      | 0.000003 |
| Opening tables            | 0.000017 |
| After opening tables      | 0.000003 |
| System lock               | 0.000002 |
| Table lock                | 0.000003 |
| Init for update           | 0.000008 |
| Update                    | 0.000102 |
| End of update loop        | 0.000003 |
| Query end                 | 0.000002 |
| Commit                    | 0.004260 |
| Writing to binlog         | 0.000019 |
| Commit                    | 0.000005 |
| Closing tables            | 0.000003 |
| Unlocking tables          | 0.000003 |
| Closing tables            | 0.000006 |
| Starting cleanup          | 0.000007 |
+---------------------------+----------+
17 rows in set (0.000 sec)



MariaDB [Oblig3]> set profiling =1;
Query OK, 0 rows affected (0.000 sec)

MariaDB [Oblig3]> call takeSpace2 ('203020','6');
Query OK, 2 rows affected (0.077 sec)

MariaDB [Oblig3]> call takeSpace2 ('203020','3');
Query OK, 2 rows affected (0.008 sec)

MariaDB [Oblig3]> call takeSpace2 ('203020','10');
Query OK, 2 rows affected (0.002 sec)

MariaDB [Oblig3]> show profiles;
+----------+------------+------------------------------------------------------------------------------------+
| Query_ID | Duration   | Query                                                                              |
+----------+------------+------------------------------------------------------------------------------------+
|        1 | 0.00006195 | UPDATE Event2 SET spacesLeft = (spacesLeft-1)WHERE Event2.eventId like NEW.eventId |
|        2 | 0.00006318 | UPDATE Event2 SET spacesLeft = (spacesLeft-1)WHERE Event2.eventId like NEW.eventId |
|        3 | 0.00006209 | UPDATE Event2 SET spacesLeft = (spacesLeft-1)WHERE Event2.eventId like NEW.eventId |
+----------+------------+------------------------------------------------------------------------------------+
3 rows in set (0.000 sec)

MariaDB [Oblig3]> show profile fpr query 2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near 'fpr query 2' at line 1
MariaDB [Oblig3]> show profile for QUERY  2;
+---------------------------+----------+
| Status                    | Duration |
+---------------------------+----------+
| continuing inside routine | 0.000006 |
| Checking permissions      | 0.000002 |
| Opening tables            | 0.000002 |
| After opening tables      | 0.000002 |
| Init for update           | 0.000023 |
| Updating                  | 0.000018 |
| End of update loop        | 0.000004 |
| Query end                 | 0.000002 |
| Closing tables            | 0.000002 |
| Starting cleanup          | 0.000003 |
+---------------------------+----------+
10 rows in set (0.000 sec)


