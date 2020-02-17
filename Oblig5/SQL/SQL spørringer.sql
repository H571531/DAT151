SELECT SQL_NO_CACHE C.owner, P.timestamp    
FROM Car C JOIN Passing P USING(regno)    
WHERE YEAR(P.timestamp)=2018 AND MONTH(P.timestamp)=3    
AND DAYOFWEEK(P.timestamp)=1; 

