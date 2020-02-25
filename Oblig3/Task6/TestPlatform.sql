delimiter $
CREATE TRIGGER EventUpdate AFTER INSERT ON Reservation
	FOR EACH ROW
	BEGIN
		UPDATE Event2
		SET spacesLeft = (spacesLeft-1)
		WHERE Event2.eventId = NEW.eventId;
	END$
delimiter ;
