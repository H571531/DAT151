INSERT INTO Event
SELECT DISTINCT eventId,eventTitle,eventDate,totSpaces 
FROM auxTable;
