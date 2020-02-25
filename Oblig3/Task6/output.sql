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

