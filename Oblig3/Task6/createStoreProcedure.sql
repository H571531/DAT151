delimiter $
CREATE PROCEDURE takeSpace (pId VARCHAR(7),eventId VARCHAR(10),lName VARCHAR (15),fName VARCHAR (15))
	BEGIN
		IF (Select count(*) from Atendee where Atendee.eventId=eventId FOR UPDATE) < (SELECT totSpaces FROM Event WHERE Event.eventId=eventId) THEN
			INSERT INTO Atendee (pId,eventId,lName,fName) VALUES (pId,eventId,lName,fName);		
		END IF;	
	END$
delimiter ;
