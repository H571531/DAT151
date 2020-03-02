> LOAD DATA LOCAL INFILE '/home/admo/git/DAT151/Oblig5/SQL/carpassingdb.txt' INTO TABLE ImportTable FIELDS TERMINATED BY ';';

-- Tollstation
INSERT INTO Tollstation
SELECT DISTINCT idTollstation,tollname 
FROM ImportTable;

-- TaxClass
INSERT INTO TaxClass
SELECT DISTINCT taxId,taxDesc
FROM ImportTable;

-- Car
INSERT INTO Car
SELECT DISTINCT regno,OwnerName,taxId
FROM ImportTable;

-- Subscription
INSERT INTO Subscription
SELECT DISTINCT regno
FROM ImportTable 
WHERE Subscription='yes';

-- Passing
INSERT INTO Passing
SELECT DISTINCT regno,tid,idTollstation
FROM ImportTable;

--  Fee
INSERT INTO Fee (taxclass,type,costPerPassing) 
SELECT DISTINCT taxId,'regular',TollSFee
FROM ImportTable
WHERE Subscription='no';

INSERT INTO Fee (taxclass,type,costPerPassing) 
SELECT DISTINCT taxId,'withsubscription',SubFee
FROM ImportTable
WHERE Subscription='yes';

-- Passing2
INSERT INTO Passing2
SELECT DISTINCT regno,tid,idTollstation,OwnerName
FROM ImportTable;



-- Passing3
INSERT INTO Passing3 
SELECT DISTINCT regno,tid,idTollstation,OwnerName,'withsubscription',SubFee 
FROM ImportTable 
WHERE Subscription='yes';


INSERT INTO Passing3
SELECT DISTINCT regno,tid,idTollstation,OwnerName,'regular',TollSFee
FROM ImportTable
WHERE Subscription='no';

-- Passing4
INSERT INTO Passing4
SELECT DISTINCT regno,tid,idTollstation,OwnerName,tollname
FROM ImportTable;