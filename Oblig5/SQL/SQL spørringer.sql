SELECT SQL_NO_CACHE C.owner, P.timestamp    
FROM Car C JOIN Passing P USING(regno)    
WHERE YEAR(P.timestamp)=2018 AND MONTH(P.timestamp)=3    
AND DAYOFWEEK(P.timestamp)=1; 

SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee    
FROM Car C JOIN Passing P USING(regno)        
JOIN TaxClass T ON C.taxclass=T.idTaxClass        
JOIN Fee F ON F.taxclass=T.idTaxClass        
JOIN Subscription S USING(regno)       
WHERE F.type='withsubscription'        
GROUP BY C.owner HAVING totalfee > 4000; 

SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee   
FROM Car C JOIN Passing P USING(regno)       
JOIN TaxClass T ON C.taxclass=T.idTaxClass       
JOIN Fee F ON F.taxclass=T.idTaxClass       
WHERE F.type='withsubscription'       
AND C.regno IN (SELECT regno FROM Subscription)      
GROUP BY C.owner HAVING totalfee > 4000; 

SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee    
FROM Car C JOIN Passing P USING(regno)        
JOIN TaxClass T ON C.taxclass=T.idTaxClass        
JOIN Fee F ON F.taxclass=T.idTaxClass        
JOIN Subscription S USING(regno)       
WHERE F.type='regular'        
GROUP BY C.owner HAVING totalfee > 4000; 

SELECT SQL_NO_CACHE C.owner AS carowner, Sum(F.costPerPassing) AS totalfee   
FROM Car C JOIN Passing P USING(regno)       
JOIN TaxClass T ON C.taxclass=T.idTaxClass       
JOIN Fee F ON F.taxclass=T.idTaxClass       
WHERE F.type='regular'       
AND C.regno IN (SELECT regno FROM Subscription)      
GROUP BY C.owner HAVING totalfee > 4000; 


SELECT SQL_NO_CACHE C.owner FROM Car C WHERE C.regno    
IN (SELECT P.regno FROM Passing P JOIN Tollstation T            
ON P.tollstation = T.idTollstation            
WHERE T.name LIKE 'Gravdal'                
AND YEAR(P.timestamp)=2018                
AND MONTH(P.timestamp)=2                
AND DAYOFWEEK(P.timestamp)=1                
AND HOUR(P.timestamp) = 3); 