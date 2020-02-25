delimiter $
CREATE TRIGGER EventUpdate AFTER INSERT ON Reservation
	FOR EACH ROW
	BEGIN
		UPDATE Event
		SET spacesLeft = (totSpaces - (select count(*) from Event WHERE Event.eventId=NEW.eventId))
		WHERE eventId = NEW.eventId;
	END$
    delimiter ;
