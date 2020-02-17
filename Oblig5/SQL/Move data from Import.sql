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
