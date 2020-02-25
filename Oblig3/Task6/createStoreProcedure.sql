delimiter $
CREATE PROCEDURE takeSpace (pId VARCHAR(7),eventId VARCHAR(10),lName VARCHAR (15),fName VARCHAR (15))
	BEGIN
		IF (Select count(*) from Atendee where Atendee.eventId=eventId FOR UPDATE) < (SELECT totSpaces FROM Event WHERE Event.eventId=eventId) THEN
			INSERT INTO Atendee (pId,lName,fName) VALUES (pId,lName,fName);	
            INSERT INTO Reservation (eventId,pId) VALUES (eventId, pId);
		END IF;	
	END$
delimiter ;

delimiter $
CREATE PROCEDURE takeSpace (pId VARCHAR(18),eventId VARCHAR(5))
	BEGIN
		IF (Select count(*) from Reservation where Reservation.eventId=eventId FOR UPDATE) < (SELECT totSpaces FROM Event WHERE Event.eventId=eventId) THEN
            INSERT INTO Reservation (eventId,pId) VALUES (eventId, pId);
		END IF;	
	END$
delimiter ;
