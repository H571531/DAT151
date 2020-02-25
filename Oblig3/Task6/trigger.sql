delimiter $
CREATE TRIGGER EventUpdate AFTER INSERT ON Reservation
	FOR EACH ROW
	BEGIN
		UPDATE Event2
		SET spacesLeft = (totSpaces - (select count(*) from Reservation WHERE eventId=NEW.eventId))
		WHERE eventId = NEW.eventId;
	END$
    delimiter ;
