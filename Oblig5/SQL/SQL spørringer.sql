SELECT SQL_NO_CACHE C.owner, P.timestamp    
FROM Car C JOIN Passing P USING(regno)    
WHERE YEAR(P.timestamp)=2018 AND MONTH(P.timestamp)=3    
AND DAYOFWEEK(P.timestamp)=1; 

-- OPT
SELECT SQL_NO_CACHE owner,timestamp   
FROM Passing2 WHERE YEAR(timestamp)=2018 AND MONTH(timestamp)=3    
AND DAYOFWEEK(timestamp)=1; 

EXPLAIN SELECT SQL_NO_CACHE owner,timestamp   
FROM Passing2 WHERE YEAR(timestamp)=2018 AND MONTH(timestamp)=3    
AND DAYOFWEEK(timestamp)=1;



--B

SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee    
FROM Car C JOIN Passing P USING(regno)        
JOIN TaxClass T ON C.taxclass=T.idTaxClass        
JOIN Fee F ON F.taxclass=T.idTaxClass        
JOIN Subscription S USING(regno)       
WHERE F.type='withsubscription'        
GROUP BY C.owner HAVING totalfee > 4000; 

EXPLAIN SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee    
FROM Car C JOIN Passing P USING(regno)        
JOIN TaxClass T ON C.taxclass=T.idTaxClass        
JOIN Fee F ON F.taxclass=T.idTaxClass        
JOIN Subscription S USING(regno)       
WHERE F.type='withsubscription'        
GROUP BY C.owner HAVING totalfee > 4000; 

SELECT SQL_NO_CACHE owner AS carowner, Sum(costPerPassing) AS totalfee 
from Passing3   
WHERE type='withsubscription'        
GROUP BY owner HAVING totalfee > 4000; 

EXPLAIN SELECT SQL_NO_CACHE owner AS carowner, Sum(costPerPassing) AS totalfee 
from Passing3   
WHERE type='withsubscription'        
GROUP BY owner HAVING totalfee > 4000; 

--C

SELECT SQL_NO_CACHE C.owner AS carowner,
Sum(F.costPerPassing) AS totalfee
 FROM Car C JOIN Passing P USING(regno)
 JOIN TaxClass T ON C.taxclass=T.idTaxClass
 JOIN Fee F ON F.taxclass=T.idTaxClass
 WHERE F.type='withsubscription'
 AND C.regno IN (SELECT regno FROM Subscription)
 GROUP BY C.owner HAVING totalfee > 4000;
 
EXPLAIN SELECT SQL_NO_CACHE C.owner AS carowner,
Sum(F.costPerPassing) AS totalfee
 FROM Car C JOIN Passing P USING(regno)
 JOIN TaxClass T ON C.taxclass=T.idTaxClass
 JOIN Fee F ON F.taxclass=T.idTaxClass
 WHERE F.type='withsubscription'
 AND C.regno IN (SELECT regno FROM Subscription)
 GROUP BY C.owner HAVING totalfee > 4000;
 
 
 --D
 
 
SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee    
FROM Car C JOIN Passing P USING(regno)        
JOIN TaxClass T ON C.taxclass=T.idTaxClass        
JOIN Fee F ON F.taxclass=T.idTaxClass        
Left JOIN Subscription S USING(regno)     
WHERE F.type='withsubscription'  
AND S.regno IS NULL    
GROUP BY C.owner HAVING totalfee > 4000; 

EXPLAIN SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee    
FROM Car C JOIN Passing P USING(regno)        
JOIN TaxClass T ON C.taxclass=T.idTaxClass        
JOIN Fee F ON F.taxclass=T.idTaxClass        
Left JOIN Subscription S USING(regno)     
WHERE F.type='withsubscription'  
AND S.regno IS NULL    
GROUP BY C.owner HAVING totalfee > 4000;

SELECT SQL_NO_CACHE owner AS carowner, Sum(costPerPassing) AS totalfee 
from Passing3   
WHERE type='regular'        
GROUP BY owner HAVING totalfee > 4000; 

--EA
SELECT SQL_NO_CACHE C.owner AS carowner,
Sum(F.costPerPassing) AS totalfee
 FROM Car C JOIN Passing P USING(regno)
 JOIN TaxClass T ON C.taxclass=T.idTaxClass
 JOIN Fee F ON F.taxclass=T.idTaxClass
 WHERE F.type='withsubscription'
 AND C.regno NOT IN (SELECT regno FROM Subscription)
 GROUP BY C.owner HAVING totalfee > 4000;
 
 
 --F
 SELECT SQL_NO_CACHE C.owner FROM Car C WHERE C.regno
 IN (SELECT P.regno FROM Passing P JOIN Tollstation T
 ON P.tollstation = T.idTollstation
 WHERE T.name LIKE 'Gravdal'
 AND YEAR(P.timestamp)=2018
 AND MONTH(P.timestamp)=2
 AND DAYOFWEEK(P.timestamp)=1
 AND HOUR(P.timestamp) = 3);
 
 EXPLAIN  SELECT SQL_NO_CACHE C.owner FROM Car C WHERE C.regno
 IN (SELECT P.regno FROM Passing P JOIN Tollstation T
 ON P.tollstation = T.idTollstation
 WHERE T.name LIKE 'Gravdal'
 AND YEAR(P.timestamp)=2018
 AND MONTH(P.timestamp)=2
 AND DAYOFWEEK(P.timestamp)=1
 AND HOUR(P.timestamp) = 3);
 
 MariaDB [Oblig5]> CREATE INDEX RegNr ON Passing (regno);

