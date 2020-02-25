INSERT INTO Event
SELECT DISTINCT eventId,eventTitle,eventDate,totSpaces 
FROM auxTable;

INSERT INTO Atendee
SELECT DISTINCT pId,lName,fName
FROM auxTable;

INSERT INTO Reservation (pId,eventId)
SELECT pId,eventId 
FROM auxTable