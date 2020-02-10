> call takeSpace ('2231232','14','Mortensen','Adrian');
Query OK, 1 row affected (0.005 sec)

> call takeSpace ('2131232','14','Mortensen','Adrian');
Query OK, 1 row affected (0.005 sec)

> call takeSpace ('2131235','14','Mortensen','Adrian');
Query OK, 0 rows affected (0.000 sec)

> select count(*) from Atendee where eventId='14';
+----------+
| count(*) |
+----------+
|        3 |
+----------+
1 row in set (0.000 sec)

> call takeSpace ('5131235','14','Mortensen','Adrian');
Query OK, 0 rows affected (0.000 sec)

> select count(*) from Atendee where eventId='14';
+----------+
| count(*) |
+----------+
|        3 |
+----------+

