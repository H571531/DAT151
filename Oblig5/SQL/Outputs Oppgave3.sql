> SELECT SQL_NO_CACHE C.owner, P.timestamp
    -> FROM Car C JOIN Passing P USING(regno)
    -> WHERE YEAR(P.timestamp)=2018 AND MONTH(P.timestamp)=3
    -> AND DAYOFWEEK(P.timestamp)=1;
+--------------------+---------------------+
| owner              | timestamp           |
+--------------------+---------------------+
| Urfan Sandøy       | 2018-03-04 04:30:00 |
| Urfan Sandøy       | 2018-03-04 05:42:00 |
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
16 rows in set (18.286 sec)

MariaDB [oblig5]> SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee
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
2 rows in set (1 min 21.136 sec)

MariaDB [oblig5]> SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee
    -> FROM Car C JOIN Passing P USING(regno)
    -> JOIN TaxClass T ON C.taxclass=T.idTaxClass
    -> JOIN Fee F ON F.taxclass=T.idTaxClass
    -> WHERE F.type='withsubscription'
    -> AND C.regno IN (SELECT regno FROM Subscription)
    -> GROUP BY C.owner HAVING totalfee > 4000;
+----------------+----------+
| carowner       | totalfee |
+----------------+----------+
| Ansgar Oftedal |  4210.00 |
| Rina Kvalheim  |  4605.00 |
+----------------+----------+

MariaDB [oblig5]> SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee
    -> FROM Car C JOIN Passing P USING(regno)
    -> JOIN TaxClass T ON C.taxclass=T.idTaxClass
    -> JOIN Fee F ON F.taxclass=T.idTaxClass
    -> JOIN Subscription S USING(regno)
    -> WHERE F.type='regular'
    -> GROUP BY C.owner HAVING totalfee > 4000;
+----------------+----------+
| carowner       | totalfee |
+----------------+----------+
| Ansgar Oftedal |  4300.00 |
| Rina Kvalheim  |  4605.00 |
+----------------+----------+
2 rows in set (1 min 18.016 sec)

MariaDB [oblig5]> SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee
    -> FROM Car C JOIN Passing P USING(regno)
    -> JOIN TaxClass T ON C.taxclass=T.idTaxClass
    -> JOIN Fee F ON F.taxclass=T.idTaxClass
    -> WHERE F.type='regular'
    -> AND C.regno IN (SELECT regno FROM Subscription)
    -> GROUP BY C.owner HAVING totalfee > 4000;
+----------------+----------+
| carowner       | totalfee |
+----------------+----------+
| Ansgar Oftedal |  4300.00 |
| Rina Kvalheim  |  4605.00 |
+----------------+----------+
2 rows in set (1 min 18.017 sec)



MariaDB [oblig5]> SELECT SQL_NO_CACHE C.owner FROM Car C WHERE C.regno
    -> IN (SELECT P.regno FROM Passing P JOIN Tollstation T
    -> ON P.tollstation = T.idTollstation
    -> WHERE T.name LIKE 'Gravdal'
    -> AND YEAR(P.timestamp)=2018
    -> AND MONTH(P.timestamp)=2
    -> AND DAYOFWEEK(P.timestamp)=1
    -> AND HOUR(P.timestamp) = 3);
+--------------------+
| owner              |
+--------------------+
| Olav Hætta         |
| Bjarnhild Reistad  |
| Jarle Aarnes       |
| Årstein Sele       |
| Kay Nesset         |
|----Forkortning-----|
| Noor Evensen       |
| Danny Straume      |
| Hossein Kolberg    |
| Hassan Haugland    |
| Odin Persson       |
| Enid Nicolaysen    |
| Oddveig Roald      |
| Xhavit Høiland     |
| Vebjørn Bauge      |
| Ramona Søvik       |
| Oda Dammen         |
| Nicholas Heiberg   |
+--------------------+
177 rows in set (0.526 sec)
