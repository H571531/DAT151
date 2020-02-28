Profiling
-- A
MariaDB [Oblig5]> SELECT SQL_NO_CACHE C.owner, P.timestamp
    -> FROM Car C JOIN Passing P USING(regno)
    -> WHERE YEAR(P.timestamp)=2018 AND MONTH(P.timestamp)=3
    -> AND DAYOFWEEK(P.timestamp)=1;
+--------------------+---------------------+
| owner              | timestamp           |
+--------------------+---------------------+
| Urfan SandÃ¸y      | 2018-03-04 04:30:00 |
| Urfan SandÃ¸y      | 2018-03-04 05:42:00 |
| Birte Fossum       | 2018-03-04 02:18:00 |
| Birte Fossum       | 2018-03-04 23:31:00 |
| Stanley Ingvaldsen | 2018-03-04 02:18:00 |
| Stanley Ingvaldsen | 2018-03-04 23:31:00 |
| Amar Wiig          | 2018-03-04 05:53:00 |
| Minda Larssen      | 2018-03-04 14:24:00 |
| Storm Nordstrand   | 2018-03-04 03:09:00 |
| Marcus Hafstad     | 2018-03-04 14:24:00 |
| Mathilde Lillevik  | 2018-03-04 04:30:00 |
| Mathilde Lillevik  | 2018-03-04 05:42:00 |
| Zilan Solbakken    | 2018-03-04 05:53:00 |
| Kurt Aslaksen      | 2018-03-04 19:02:00 |
| Dilara Skar        | 2018-03-04 03:09:00 |
| Annette Sara       | 2018-03-04 19:02:00 |
+--------------------+---------------------+
16 rows in set (3.085 sec)

MariaDB [Oblig5]> SHOW PROFILES;
+----------+------------+--------------------------------------------------------+
| Query_ID | Duration   | Query                                                  |
+----------+------------+--------------------------------------------------------+
|        1 | 3.08046248 | SELECT SQL_NO_CACHE C.owner, P.timestamp               |
|          |            | FROM Car C JOIN Passing P USING(regno)                 |
|          |            | WHERE YEAR(P.timestamp)=2018 AND MONTH(P.timestamp)=3  |
|          |            | AND DAYOFWEEK(P.timestamp)=1                           |
|        2 | 3.14813736 | SELECT SQL_NO_CACHE C.owner, P.timestamp               |
|          |            | FROM Car C JOIN Passing P USING(regno)                 |
|          |            | WHERE YEAR(P.timestamp)=2018 AND MONTH(P.timestamp)=3  |
|          |            | AND DAYOFWEEK(P.timestamp)=1                           |  
|        3 | 3.15549203 | SELECT SQL_NO_CACHE C.owner, P.timestamp               |
|          |            | FROM Car C JOIN Passing P USING(regno)                 |
|          |            | WHERE YEAR(P.timestamp)=2018 AND MONTH(P.timestamp)=3  |
|          |            | AND DAYOFWEEK(P.timestamp)=1                           |
|        4 | 3.16799906 | SELECT SQL_NO_CACHE C.owner, P.timestamp               |
|          |            | FROM Car C JOIN Passing P USING(regno)                 |
|          |            | WHERE YEAR(P.timestamp)=2018 AND MONTH(P.timestamp)=3  |
|          |            | AND DAYOFWEEK(P.timestamp)=1                           |
|        5 | 3.16238553 | SELECT SQL_NO_CACHE C.owner, P.timestamp               |
|          |            | FROM Car C JOIN Passing P USING(regno)                 |
|          |            | WHERE YEAR(P.timestamp)=2018 AND MONTH(P.timestamp)=3  |
|          |            | AND DAYOFWEEK(P.timestamp)=1                           |       
+----------+------------+--------------------------------------------------------+

MariaDB [Oblig5]> SHOW PROFILE for QUERY 3;
+------------------------+----------+
| Status                 | Duration |
+------------------------+----------+
| Starting               | 0.000083 |
| Checking permissions   | 0.000004 |
| Opening tables         | 0.000032 |
| After opening tables   | 0.000006 |
| System lock            | 0.000002 |
| Table lock             | 0.000005 |
| Init                   | 0.000029 |
| Optimizing             | 0.000018 |
| Statistics             | 0.000021 |
| Preparing              | 0.000018 |
| Executing              | 0.000002 |
| Sending data           | 3.155202 |
| End of update loop     | 0.000017 |
| Query end              | 0.000003 |
| Commit                 | 0.000004 |
| Closing tables         | 0.000003 |
| Unlocking tables       | 0.000001 |
| Closing tables         | 0.000010 |
| Starting cleanup       | 0.000002 |
| Freeing items          | 0.000008 |
| Updating status        | 0.000021 |
| Reset for next command | 0.000003 |
+------------------------+----------+


+--------------------+---------------------+
| owner              | timestamp           |
+--------------------+---------------------+
| Urfan SandÃ¸y      | 2018-03-04 04:30:00 |
| Urfan SandÃ¸y      | 2018-03-04 05:42:00 |
| Birte Fossum       | 2018-03-04 02:18:00 |
| Birte Fossum       | 2018-03-04 23:31:00 |
| Stanley Ingvaldsen | 2018-03-04 02:18:00 |
| Stanley Ingvaldsen | 2018-03-04 23:31:00 |
| Amar Wiig          | 2018-03-04 05:53:00 |
| Minda Larssen      | 2018-03-04 14:24:00 |
| Storm Nordstrand   | 2018-03-04 03:09:00 |
| Marcus Hafstad     | 2018-03-04 14:24:00 |
| Mathilde Lillevik  | 2018-03-04 04:30:00 |
| Mathilde Lillevik  | 2018-03-04 05:42:00 |
| Zilan Solbakken    | 2018-03-04 05:53:00 |
| Kurt Aslaksen      | 2018-03-04 19:02:00 |
| Dilara Skar        | 2018-03-04 03:09:00 |
| Annette Sara       | 2018-03-04 19:02:00 |
+--------------------+---------------------+
16 rows in set (2.555 sec)

MariaDB [Oblig5]> EXPLAIN SELECT SQL_NO_CACHE C.owner, P.timestamp FROM Car C JOIN Passing P USING(regno) WHERE YEAR (P.timestamp)=2018 AND MONTH (P.timestamp)=3 AND DAYOFWEEK(P.timestamp)=1;
+------+-------------+-------+------+---------------+---------+---------+----------------+--------+-------------+
| id   | select_type | table | type | possible_keys | key     | key_len | ref            | rows   | Extra       |
+------+-------------+-------+------+---------------+---------+---------+----------------+--------+-------------+
|    1 | SIMPLE      | C     | ALL  | PRIMARY       | NULL    | NULL    | NULL           | 203998 |             |
|    1 | SIMPLE      | P     | ref  | PRIMARY       | PRIMARY | 7       | Oblig5.C.regno |      1 | Using where |
+------+-------------+-------+------+---------------+---------+---------+----------------+--------+-------------+
2 rows in set (0.000 sec)





MariaDB [Oblig5]> show profiles;
+----------+------------+------------------------------------------------------------------+
| Query_ID | Duration   | Query                                                            |
+----------+------------+------------------------------------------------------------------+
|        1 | 2.46529822 | SELECT SQL_NO_CACHE owner,timestamp                              |
|          |            | FROM Passing2 WHERE YEAR(timestamp)=2018 AND MONTH(timestamp)=3  |
|          |            | AND DAYOFWEEK(timestamp)=1                                       |
|        2 | 2.51719002 | SELECT SQL_NO_CACHE owner,timestamp                              |
|          |            | FROM Passing2 WHERE YEAR(timestamp)=2018 AND MONTH(timestamp)=3  |
|          |            | AND DAYOFWEEK(timestamp)=1                                       |
|        3 | 2.52976462 | SELECT SQL_NO_CACHE owner,timestamp                              |
|          |            | FROM Passing2 WHERE YEAR(timestamp)=2018 AND MONTH(timestamp)=3  |
|          |            | AND DAYOFWEEK(timestamp)=1                                       |
|        4 | 2.51797654 | SELECT SQL_NO_CACHE owner,timestamp                              |
|          |            | FROM Passing2 WHERE YEAR(timestamp)=2018 AND MONTH(timestamp)=3  |
|          |            | AND DAYOFWEEK(timestamp)=1                                       |
|        5 | 2.47903186 | SELECT SQL_NO_CACHE owner,timestamp                              |
|          |            | FROM Passing2 WHERE YEAR(timestamp)=2018 AND MONTH(timestamp)=3  |
|          |            | AND DAYOFWEEK(timestamp)=1                                       |
+----------+------------+------------------------------------------------------------------+
5 rows in set (0.000 sec)

MariaDB [Oblig5]> show profile for query 3;
+------------------------+----------+
| Status                 | Duration |
+------------------------+----------+
| Starting               | 0.000077 |
| Checking permissions   | 0.000005 |
| Opening tables         | 0.000019 |
| After opening tables   | 0.000004 |
| System lock            | 0.000003 |
| Table lock             | 0.000006 |
| Init                   | 0.000025 |
| Optimizing             | 0.000014 |
| Statistics             | 0.000014 |
| Preparing              | 0.000019 |
| Executing              | 0.000002 |
| Sending data           | 2.529506 |
| End of update loop     | 0.000018 |
| Query end              | 0.000002 |
| Commit                 | 0.000005 |
| Closing tables         | 0.000003 |
| Unlocking tables       | 0.000001 |
| Closing tables         | 0.000009 |
| Starting cleanup       | 0.000002 |
| Freeing items          | 0.000006 |
| Updating status        | 0.000021 |
| Reset for next command | 0.000003 |
+------------------------+----------+
22 rows in set (0.000 sec)

MariaDB [Oblig5]> EXPLAIN SELECT SQL_NO_CACHE owner,timestamp
    -> FROM Passing2 WHERE YEAR(timestamp)=2018 AND MONTH(timestamp)=3
    -> AND DAYOFWEEK(timestamp)=1;
+------+-------------+----------+------+---------------+------+---------+------+---------+-------------+
| id   | select_type | table    | type | possible_keys | key  | key_len | ref  | rows    | Extra       |
+------+-------------+----------+------+---------------+------+---------+------+---------+-------------+
|    1 | SIMPLE      | Passing2 | ALL  | NULL          | NULL | NULL    | NULL | 5035359 | Using where |
+------+-------------+----------+------+---------------+------+---------+------+---------+-------------+
1 row in set (0.001 sec)

MariaDB [Oblig5]> EXPLAIN SELECT SQL_NO_CACHE C.owner, P.timestamp FROM Car C JOIN Passing P USING(regno) WHERE YEAR (P.timestamp)=2018 AND MONTH (P.timestamp)=3 AND DAYOFWEEK(P.timestamp)=1;
+------+-------------+-------+------+---------------+---------+---------+----------------+--------+-------------+
| id   | select_type | table | type | possible_keys | key     | key_len | ref            | rows   | Extra       |
+------+-------------+-------+------+---------------+---------+---------+----------------+--------+-------------+
|    1 | SIMPLE      | C     | ALL  | PRIMARY       | NULL    | NULL    | NULL           | 203998 |             |
|    1 | SIMPLE      | P     | ref  | PRIMARY       | PRIMARY | 7       | Oblig5.C.regno |     13 | Using where |
+------+-------------+-------+------+---------------+---------+---------+----------------+--------+-------------+
2 rows in set (0.001 sec)




CREATE INDEX Timestamp ON Passing(timestamp);
-- b
MariaDB [Oblig5]> SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee
    -> FROM Car C JOIN Passing P USING(regno)
    -> JOIN TaxClass T ON C.taxclass=T.idTaxClass
    -> JOIN Fee F ON F.taxclass=T.idTaxClass
    -> JOIN Subscription S USING(regno)
    -> WHERE F.type='withsubscription'
    -> GROUP BY C.owner HAVING totalfee > 4000;
+----------------+----------+
| carowner       | totalfee |
+----------------+----------+
| Ansgar Oftedal |  4210.00 |
| Rina Kvalheim  |  4605.00 |
+----------------+----------+
2 rows in set (2.475 sec)

MariaDB [Oblig5]> EXPLAIN SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee
    -> FROM Car C JOIN Passing P USING(regno)
    -> JOIN TaxClass T ON C.taxclass=T.idTaxClass
    -> JOIN Fee F ON F.taxclass=T.idTaxClass
    -> JOIN Subscription S USING(regno)
    -> WHERE F.type='withsubscription'
    -> GROUP BY C.owner HAVING totalfee > 4000;
+------+-------------+-------+--------+--------------------------+------------------+---------+---------------------+------+----------------------------------------------+
| id   | select_type | table | type   | possible_keys            | key              | key_len | ref                 | rows | Extra                                        |
+------+-------------+-------+--------+--------------------------+------------------+---------+---------------------+------+----------------------------------------------+
|    1 | SIMPLE      | T     | index  | PRIMARY                  | PRIMARY          | 2       | NULL                |   10 | Using index; Using temporary; Using filesort |
|    1 | SIMPLE      | F     | ref    | TeacherFK                | TeacherFK        | 2       | Oblig5.T.idTaxClass |    1 | Using where                                  |
|    1 | SIMPLE      | C     | ref    | PRIMARY,fk_Car_TaxClass1 | fk_Car_TaxClass1 | 2       | Oblig5.T.idTaxClass |    1 |                                              |
|    1 | SIMPLE      | S     | eq_ref | PRIMARY                  | PRIMARY          | 7       | Oblig5.C.regno      |    1 | Using index                                  |
|    1 | SIMPLE      | P     | ref    | PRIMARY,reg              | PRIMARY          | 7       | Oblig5.C.regno      |   13 |                                              |
+------+-------------+-------+--------+--------------------------+------------------+---------+---------------------+------+----------------------------------------------+
5 rows in set (0.001 sec)

MariaDB [Oblig5]> show profiles;
+----------+------------+-----------------------------------------------------------------------------+
| Query_ID | Duration   | Query                                                                       |                                                                                                                                                                                                                                |
+----------+------------+-----------------------------------------------------------------------------+
|        1 | 3.51759643 | SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee  |
|          |            | FROM Car C JOIN Passing P USING(regno)									  |
|          |            | JOIN TaxClass T ON C.taxclass=T.idTaxClass								  |
|          |            | JOIN Fee F ON F.taxclass=T.idTaxClass										  |
|          |            | JOIN Subscription S USING(regno)											  |
|          |            | WHERE F.type='withsubscription'       								      |
|        2 | 3.53729194 | SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee  |
|          |            | FROM Car C JOIN Passing P USING(regno)								      |
|          |            | JOIN TaxClass T ON C.taxclass=T.idTaxClass								  |
|		   |			| JOIN Fee F ON F.taxclass=T.idTaxClass										  |
|          |			| JOIN Subscription S USING(regno)											  |
|		   | 			| WHERE F.type='withsubscription'       									  |
|        3 | 3.51002205 | SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee  |
| 		   |			| FROM Car C JOIN Passing P USING(regno) 									  |
|		   |			| JOIN TaxClass T ON C.taxclass=T.idTaxClass								  |
|		   |			| JOIN Fee F ON F.taxclass=T.idTaxClass										  |
|		   |			| JOIN Subscription S USING(regno)											  |
|		   |			| WHERE F.type='withsubscription'       									  |
|        4 | 3.47434126 | SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee  |
| 		   | 			| FROM Car C JOIN Passing P USING(regno)									  |
| 		   | 			| JOIN TaxClass T ON C.taxclass=T.idTaxClass								  |
|		   |	 	 	| JOIN Fee F ON F.taxclass=T.idTaxClass										  |
|		   |			| JOIN Subscription S USING(regno)											  |
|		   |			| WHERE F.type='withsubscription'       									  |
|        5 | 3.39511616 | SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee  |
|		   |			| FROM Car C JOIN Passing P USING(regno)									  |
|		   |			| JOIN TaxClass T ON C.taxclass=T.idTaxClass								  |
|		   |			| JOIN Fee F ON F.taxclass=T.idTaxClass										  |
|		   |			| JOIN Subscription S USING(regno)											  |
|		   |			| WHERE F.type='withsubscription'       									  |
+----------+------------+-----------------------------------------------------------------------------+
5 rows in set (0.000 sec)








--Opt

MariaDB [Oblig5]> show profiles;
+----------+------------+-------------------------------------------------------------------------+
| Query_ID | Duration   | Query                                                                   |                                                                                            |
+----------+------------+-------------------------------------------------------------------------+
|        1 | 2.65984540 | SELECT SQL_NO_CACHE owner AS carowner, Sum(costPerPassing) AS totalfee  |
|          |            | from Passing3                                                           |
|          |            | WHERE type='withsubscription'                                           |
|          |            | GROUP BY owner HAVING totalfee > 4000                                   |
|        2 | 2.66344669 | SELECT SQL_NO_CACHE owner AS carowner, Sum(costPerPassing) AS totalfee  |
|          |            | from Passing3                                                           |
|          |            | WHERE type='withsubscription'                                           |
|          |            | GROUP BY owner HAVING totalfee > 4000                                   |
|        3 | 2.66824841 | SELECT SQL_NO_CACHE owner AS carowner, Sum(costPerPassing) AS totalfee  |
|          |            | from Passing3                                                           |
|          |            | WHERE type='withsubscription'                                           |
|          |            | GROUP BY owner HAVING totalfee > 4000                                   |
|        4 | 2.67204567 | SELECT SQL_NO_CACHE owner AS carowner, Sum(costPerPassing) AS totalfee  |
|          |            | from Passing3                                                           |
|          |            | WHERE type='withsubscription'                                           |
|          |            | GROUP BY owner HAVING totalfee > 4000                                   |
|        5 | 2.66805130 | SELECT SQL_NO_CACHE owner AS carowner, Sum(costPerPassing) AS totalfee  |
|          |            | from Passing3                                                           |
|          |            | WHERE type='withsubscription'                                           |
|          |            | GROUP BY owner HAVING totalfee > 4000                                   |
+----------+------------+-------------------------------------------------------------------------+
5 rows in set (0.000 sec)


+------+-------------+----------+------+---------------+------+---------+------+---------+----------------------------------------------+
| id   | select_type | table    | type | possible_keys | key  | key_len | ref  | rows    | Extra                                        |
+------+-------------+----------+------+---------------+------+---------+------+---------+----------------------------------------------+
|    1 | SIMPLE      | Passing3 | ALL  | NULL          | NULL | NULL    | NULL | 4812140 | Using where; Using temporary; Using filesort |
+------+-------------+----------+------+---------------+------+---------+------+---------+----------------------------------------------+
1 row in set (0.001 sec)




--C
MariaDB [Oblig5]> SELECT SQL_NO_CACHE C.owner AS carowner,
    -> Sum(F.costPerPassing) AS totalfee
    ->  FROM Car C JOIN Passing P USING(regno)
    ->  JOIN TaxClass T ON C.taxclass=T.idTaxClass
    ->  JOIN Fee F ON F.taxclass=T.idTaxClass
    ->  WHERE F.type='withsubscription'
    ->  AND C.regno IN (SELECT regno FROM Subscription)
    ->  GROUP BY C.owner HAVING totalfee > 4000;
+----------------+----------+
| carowner       | totalfee |
+----------------+----------+
| Ansgar Oftedal |  4210.00 |
| Rina Kvalheim  |  4605.00 |
+----------------+----------+
2 rows in set (3.330 sec)

+------+-------------+--------------+--------+--------------------------+------------------+---------+---------------------+------+----------------------------------------------+
| id   | select_type | table        | type   | possible_keys            | key              | key_len | ref                 | rows | Extra                                        |
+------+-------------+--------------+--------+--------------------------+------------------+---------+---------------------+------+----------------------------------------------+
|    1 | PRIMARY     | T            | index  | PRIMARY                  | PRIMARY          | 2       | NULL                |   10 | Using index; Using temporary; Using filesort |
|    1 | PRIMARY     | F            | ref    | TeacherFK                | TeacherFK        | 2       | Oblig5.T.idTaxClass |    1 | Using where                                  |
|    1 | PRIMARY     | C            | ref    | PRIMARY,fk_Car_TaxClass1 | fk_Car_TaxClass1 | 2       | Oblig5.T.idTaxClass |    1 |                                              |
|    1 | PRIMARY     | Subscription | eq_ref | PRIMARY                  | PRIMARY          | 7       | Oblig5.C.regno      |    1 | Using index                                  |
|    1 | PRIMARY     | P            | ref    | PRIMARY,reg              | PRIMARY          | 7       | Oblig5.C.regno      |   13 |                                              |
+------+-------------+--------------+--------+--------------------------+------------------+---------+---------------------+------+----------------------------------------------+
5 rows in set (0.001 sec)

MariaDB [Oblig5]> show profiles;
+----------+------------+--------------------------------------------------+
| Query_ID | Duration   | Query                                            |                                                                                                                                                                                                                                                           |
+----------+------------+--------------------------------------------------+
|        1 | 3.00203704 | SELECT SQL_NO_CACHE C.owner AS carowner,         |
|                       | Sum(F.costPerPassing) AS totalfee                |
|          |            | FROM Car C JOIN Passing P USING(regno)           |
|          |            | JOIN TaxClass T ON C.taxclass=T.idTaxClass       |
|          |            | JOIN Fee F ON F.taxclass=T.idTaxClass            |
|          |            | WHERE F.type='withsubscription'                  |
|          |            | AND C.regno IN (SELECT regno FROM Subscription)  |
|          |            | GROUP BY C.owner HA                              |
|        2 | 3.05971641 | SELECT SQL_NO_CACHE C.owner AS carowner,         |
|          |            | Sum(F.costPerPassing) AS totalfee                |
|          |            | FROM Car C JOIN Passing P USING(regno)           |
|          |            | JOIN TaxClass T ON C.taxclass=T.idTaxClass       |
|          |            | JOIN Fee F ON F.taxclass=T.idTaxClass            |
|          |            | WHERE F.type='withsubscription'                  |
|          |            | AND C.regno IN (SELECT regno FROM Subscription)  |
|          |            | GROUP BY C.owner HA                              |
|        3 | 3.00294968 | SELECT SQL_NO_CACHE C.owner AS carowner,         |
|          |            | Sum(F.costPerPassing) AS totalfee                |
|          |            | FROM Car C JOIN Passing P USING(regno)           |
|          |            | JOIN TaxClass T ON C.taxclass=T.idTaxClass       |
|          |            | JOIN Fee F ON F.taxclass=T.idTaxClass            |
|          |            | WHERE F.type='withsubscription'                  |
|          |            | AND C.regno IN (SELECT regno FROM Subscription)  |
|          |            | GROUP BY C.owner HA                              | 
|        4 | 3.11308706 | SELECT SQL_NO_CACHE C.owner AS carowner,         |
|          |            | Sum(F.costPerPassing) AS totalfee                |
|          |            | FROM Car C JOIN Passing P USING(regno)           |
|          |            | JOIN TaxClass T ON C.taxclass=T.idTaxClass       |
|          |            | JOIN Fee F ON F.taxclass=T.idTaxClass            | 
|          |            | WHERE F.type='withsubscription'                  |
|          |            | AND C.regno IN (SELECT regno FROM Subscription)  |
|          |            | GROUP BY C.owner HA                              |
|        5 | 3.08940385 | SELECT SQL_NO_CACHE C.owner AS carowner,         |
|          |            | Sum(F.costPerPassing) AS totalfee                |
|          |            | FROM Car C JOIN Passing P USING(regno)           |
|          |            | JOIN TaxClass T ON C.taxclass=T.idTaxClass       |
|          |            | JOIN Fee F ON F.taxclass=T.idTaxClass            |
|          |            | WHERE F.type='withsubscription'                  |
|          |            | AND C.regno IN (SELECT regno FROM Subscription)  |
|          |            | GROUP BY C.owner HA                              | 
+----------+------------+--------------------------------------------------+
5 rows in set (0.000 sec)





MariaDB [Oblig5]> SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee
    -> FROM Car C JOIN Passing P USING(regno)
    -> JOIN TaxClass T ON C.taxclass=T.idTaxClass
    -> JOIN Fee F ON F.taxclass=T.idTaxClass
    -> Left JOIN Subscription S USING(regno)
    -> WHERE F.type='withsubscription'
    -> AND S.regno IS NULL
    -> GROUP BY C.owner HAVING totalfee > 4000;
+------------------+----------+
| carowner         | totalfee |
+------------------+----------+
| Glen FjÃ¸rtoft   |  4010.00 |
| Lasse Nakken     |  4316.00 |
| Ulva Hanssen     |  4130.00 |
| Yulia Lie        |  4260.00 |
+------------------+----------+
4 rows in set (3.746 sec)

MariaDB [Oblig5]> show profiles;
+----------+------------+-----------------------------------------------------------------------------+
| Query_ID | Duration   | Query                                                                       |                                                                                                                                                                                                                                |
+----------+------------+-----------------------------------------------------------------------------+
|        1 | 3.72908210 | SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee  |
|          |            | FROM Car C JOIN Passing P USING(regno)									  |
|          |            | JOIN TaxClass T ON C.taxclass=T.idTaxClass								  |
|          |            | JOIN Fee F ON F.taxclass=T.idTaxClass										  |
|          |            | Left JOIN Subscription S USING(regno)										  |
|          |            | WHERE F.type='withsubscription'											  |
|        2 | 3.70657548 | SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee  |
|          |            | FROM Car C JOIN Passing P USING(regno)									  |
|          |            | JOIN TaxClass T ON C.taxclass=T.idTaxClass								  |
|          |            | JOIN Fee F ON F.taxclass=T.idTaxClass										  |
|          |            | Left JOIN Subscription S USING(regno)										  |
|          |            | WHERE F.type='withsubscription'											  |
|        3 | 3.62856547 | SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee  |
|          |            | FROM Car C JOIN Passing P USING(regno)									  |
|          |            | JOIN TaxClass T ON C.taxclass=T.idTaxClass								  |
|          |            | JOIN Fee F ON F.taxclass=T.idTaxClass										  |
|          |            | Left JOIN Subscription S USING(regno)										  |
|          |            | WHERE F.type='withsubscription' 											  |			
|        4 | 3.70396787 | SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee  |
|          |            | FROM Car C JOIN Passing P USING(regno)									  |
|          |            | JOIN TaxClass T ON C.taxclass=T.idTaxClass								  |
|          |            | JOIN Fee F ON F.taxclass=T.idTaxClass										  |
|          |            | Left JOIN Subscription S USING(regno)										  |
|          |            | WHERE F.type='withsubscription'											  |
|        5 | 3.71108078 | SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee  |
|          |            | FROM Car C JOIN Passing P USING(regno)									  |
|          |            | JOIN TaxClass T ON C.taxclass=T.idTaxClass								  |
|          |            | JOIN Fee F ON F.taxclass=T.idTaxClass										  |
|          |            | Left JOIN Subscription S USING(regno)										  |
|          |            | WHERE F.type='withsubscription'											  |
+----------+------------+-----------------------------------------------------------------------------+
5 rows in set (0.000 sec)

+------+-------------+-------+--------+--------------------------+------------------+---------+---------------------+------+----------------------------------------------+
| id   | select_type | table | type   | possible_keys            | key              | key_len | ref                 | rows | Extra                                        |
+------+-------------+-------+--------+--------------------------+------------------+---------+---------------------+------+----------------------------------------------+
|    1 | SIMPLE      | T     | index  | PRIMARY                  | PRIMARY          | 2       | NULL                |   10 | Using index; Using temporary; Using filesort |
|    1 | SIMPLE      | F     | ref    | TeacherFK                | TeacherFK        | 2       | Oblig5.T.idTaxClass |    1 | Using where                                  |
|    1 | SIMPLE      | C     | ref    | PRIMARY,fk_Car_TaxClass1 | fk_Car_TaxClass1 | 2       | Oblig5.T.idTaxClass |    1 |                                              |
|    1 | SIMPLE      | S     | eq_ref | PRIMARY                  | PRIMARY          | 7       | Oblig5.C.regno      |    1 | Using where; Using index; Not exists         |
|    1 | SIMPLE      | P     | ref    | PRIMARY,reg              | PRIMARY          | 7       | Oblig5.C.regno      |   13 |                                              |
+------+-------------+-------+--------+--------------------------+------------------+---------+---------------------+------+----------------------------------------------+

--Opt


MariaDB [Oblig5]> show profiles;
+----------+------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Query_ID | Duration   | Query                                                                                                                                                       |
+----------+------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
|        1 | 3.16445208 | SELECT SQL_NO_CACHE owner AS carowner, Sum(costPerPassing) AS totalfee
from Passing3
WHERE type='regular'
GROUP BY owner HAVING totalfee > 4000 |
|        2 | 3.11762077 | SELECT SQL_NO_CACHE owner AS carowner, Sum(costPerPassing) AS totalfee
|          |            |from Passing3
|          |            | WHERE type='regular'
|          |            | GROUP BY owner HAVING totalfee > 4000 |
|        3 | 3.12460796 | SELECT SQL_NO_CACHE owner AS carowner, Sum(costPerPassing) AS totalfee
|          |            | from Passing3
|          |            | WHERE type='regular'
|          |            | GROUP BY owner HAVING totalfee > 4000 |
|        4 | 3.08037990 | SELECT SQL_NO_CACHE owner AS carowner, Sum(costPerPassing) AS totalfee
|          |            | from Passing3
|          |            | WHERE type='regular'
|          |GROUP BY owner HAVING totalfee > 4000 |
+----------+------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------+
4 rows in set (0.000 sec)


--E
MariaDB [Oblig5]> SELECT SQL_NO_CACHE C.owner AS carowner,
    -> Sum(F.costPerPassing) AS totalfee
    ->  FROM Car C JOIN Passing P USING(regno)
    ->  JOIN TaxClass T ON C.taxclass=T.idTaxClass
    ->  JOIN Fee F ON F.taxclass=T.idTaxClass
    ->  WHERE F.type='withsubscription'
    ->  AND C.regno NOT IN (SELECT regno FROM Subscription)
    ->  GROUP BY C.owner HAVING totalfee > 4000
    -> ;
+------------------+----------+
| carowner         | totalfee |
+------------------+----------+
| Glen FjÃ¸rtoft   |  4010.00 |
| Lasse Nakken     |  4316.00 |
| Ulva Hanssen     |  4130.00 |
| Yulia Lie        |  4260.00 |
+------------------+----------+
4 rows in set (3.746 sec)

--F

MariaDB [Oblig5]>  SELECT SQL_NO_CACHE C.owner FROM Car C WHERE C.regno
    ->  IN (SELECT P.regno FROM Passing P JOIN Tollstation T
    ->  ON P.tollstation = T.idTollstation
    ->  WHERE T.name LIKE 'Gravdal'
    ->  AND YEAR(P.timestamp)=2018
    ->  AND MONTH(P.timestamp)=2
    ->  AND DAYOFWEEK(P.timestamp)=1
    ->  AND HOUR(P.timestamp) = 3);
+-----------------------+
| owner                 |
+-----------------------+
| Olav HÃ¦tta           |
| Bjarnhild Reistad     |
| Jarle Aarnes          |
--!!Shortening the output--
| Noor Evensen          |
| Danny Straume         |
| Hossein Kolberg       |
| Hassan Haugland       |
| Odin Persson          |
| Enid Nicolaysen       |
| Oddveig Roald         |
| Xhavit HÃ¸iland       |
| VebjÃ¸rn Bauge        |
| Ramona SÃ¸vik         |
| Oda Dammen            |
| Nicholas Heiberg      |
+-----------------------+
177 rows in set (3.396 sec)

MariaDB [Oblig5]>  EXPLAIN  SELECT SQL_NO_CACHE C.owner FROM Car C WHERE C.regno
    ->  IN (SELECT P.regno FROM Passing P JOIN Tollstation T
    ->  ON P.tollstation = T.idTollstation
    ->  WHERE T.name LIKE 'Gravdal'
    ->  AND YEAR(P.timestamp)=2018
    ->  AND MONTH(P.timestamp)=2
    ->  AND DAYOFWEEK(P.timestamp)=1
    ->  AND HOUR(P.timestamp) = 3);
+------+-------------+-------+--------+--------------------------+---------+---------+----------------------+--------+----------------------------+
| id   | select_type | table | type   | possible_keys            | key     | key_len | ref                  | rows   | Extra                      |
+------+-------------+-------+--------+--------------------------+---------+---------+----------------------+--------+----------------------------+
|    1 | PRIMARY     | C     | ALL    | PRIMARY                  | NULL    | NULL    | NULL                 | 203998 |                            |
|    1 | PRIMARY     | P     | ref    | PRIMARY,fk_Passing_1,reg | PRIMARY | 7       | Oblig5.C.regno       |     13 | Using where                |
|    1 | PRIMARY     | T     | eq_ref | PRIMARY                  | PRIMARY | 2       | Oblig5.P.tollstation |      1 | Using where; FirstMatch(C) |
+------+-------------+-------+--------+--------------------------+---------+---------+----------------------+--------+----------------------------+
3 rows in set (0.001 sec)


