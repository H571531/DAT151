CREATE TABLE IF NOT EXISTS Event2 (
  eventId VARCHAR(5),
  eventTitle VARCHAR(45) NULL,
  eventDate VARCHAR(45) NULL,
  totSpaces INT NULL,
  spacesLeft INT NULL,
  PRIMARY KEY (EventId))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Reservation (
  resID INT NOT NULL AUTO_INCREMENT,
  eventId VARCHAR(5) NULL,
  pId VARCHAR(18) NULL,
  PRIMARY KEY (resID),
  CONSTRAINT eventIdFK
    FOREIGN KEY (eventId)
    REFERENCES Event (eventId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT pIdFK
    FOREIGN KEY (pId)
    REFERENCES Atendee (pId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

delimiter $
CREATE TRIGGER EventUpdate AFTER INSERT ON Reservation
	FOR EACH ROW
	BEGIN
		UPDATE Event
		SET spacesLeft = spacesLeft-1
		WHERE eventId = NEW.eventId;
	END$
    delimiter ;


INSERT INTO Event2 (eventId,eventTitle,eventDate,totSpaces)
SELECT DISTINCT eventId,eventTitle,eventDate,totSpaces 
FROM auxTable;
    
INSERT INTO Reservation (pId,eventId)SELECT pId,eventId FROM auxTable

delimiter $
CREATE PROCEDURE takeSpace2 (pId VARCHAR(18),eventId VARCHAR(5))
	BEGIN
		IF (Select spacesLeft FROM Event where Event.eventId=eventId)> 0 THEN
            INSERT INTO Reservation (eventId,pId) VALUES (eventId, pId);
		END IF;	
	END$
delimiter ;