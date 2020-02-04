> DELETE FROM TheTable WHERE id=4;
Query OK, 1 row affected (0.004 sec)

MariaDB [privBase]> select * from LogTable;
+----+-----------------+--------+---------+------+-------------+
| id | changeTimeStamp | action | tableId | name | note        |
+----+-----------------+--------+---------+------+-------------+
|  1 | 2020-02-04      | DELETE |       4 | Hege | Ikke Adrian |
+----+-----------------+--------+---------+------+-------------+
1 row in set (0.000 sec)

> INSERT INTO TheTable (name,note) VALUES ('Hege','Hege');
Query OK, 1 row affected (0.009 sec)

> UPDATE TheTable SET note = 'Ikke Adrian' where id=5;
Query OK, 1 row affected (0.009 sec)
Rows matched: 1  Changed: 1  Warnings: 0

> select * from LogTable;
+----+-----------------+--------+---------+------+-------------+
| id | changeTimeStamp | action | tableId | name | note        |
+----+-----------------+--------+---------+------+-------------+
|  1 | 2020-02-04      | DELETE |       4 | Hege | Ikke Adrian |
|  2 | 2020-02-04      | INSERT |       5 | Hege | Hege        |
|  3 | 2020-02-04      | UPDATE |       5 | Hege | Hege        |
|  4 | 2020-02-04      | UPDATE |       5 | Hege | Ikke Adrian |
+----+-----------------+--------+---------+------+-------------+
4 rows in set (0.000 sec)


