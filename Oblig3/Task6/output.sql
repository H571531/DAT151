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

