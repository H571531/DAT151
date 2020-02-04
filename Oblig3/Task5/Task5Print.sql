> source /home/admo/git/DAT151/Oblig3/Task5/Task5.sql
Query OK, 3 rows affected (0.004 sec)
Records: 3  Duplicates: 0  Warnings: 0

Query OK, 6 rows affected (0.014 sec)
Records: 6  Duplicates: 0  Warnings: 0

+----+---------+
| id | name    |
+----+---------+
|  1 | Parent1 |
|  2 | Parent2 |
|  3 | Parent3 |
+----+---------+
3 rows in set (0.000 sec)

+----+--------+--------+
| id | name   | parent |
+----+--------+--------+
|  1 | Child1 |      1 |
|  2 | Child2 |      1 |
|  3 | Child3 |      1 |
|  4 | Child4 |      2 |
|  5 | Child5 |      2 |
|  6 | Child6 |      3 |
+----+--------+--------+
6 rows in set (0.000 sec)

Query OK, 0 rows affected (0.009 sec)

> DELETE FROM Child WHERE id=6;
Query OK, 1 row affected (0.005 sec)

> select * from Parent;
+----+---------+
| id | name    |
+----+---------+
|  1 | Parent1 |
|  2 | Parent2 |
+----+---------+
2 rows in set (0.000 sec)

