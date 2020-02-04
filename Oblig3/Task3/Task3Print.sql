MariaDB [privBase]> INSERT INTO teacher (name,salary,bonus) values ('Adrian',100,200);
ERROR 4025 (23000): CONSTRAINT `teacher.salary` failed for `privBase`.`teacher`
MariaDB [privBase]> INSERT INTO teacher (name,salary,bonus) values ('Adrian',1001,200);
Query OK, 1 row affected (0.004 sec)

MariaDB [privBase]> select * from teacher;
+----+--------+--------+-------+-------+
| id | name   | salary | bonus | total |
+----+--------+--------+-------+-------+
|  1 | Adrian |   1001 |   200 |  1201 |
+----+--------+--------+-------+-------+
1 row in set (0.000 sec)

