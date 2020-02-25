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
    REFERENCES Event2 (eventId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT pIdFK
    FOREIGN KEY (pId)
    REFERENCES Atendee (pId)
)
ENGINE = InnoDB;

delimiter $
CREATE TRIGGER EventUpdate AFTER INSERT ON Reservation
	FOR EACH ROW
	BEGIN
		UPDATE Event2 SET spacesLeft = (spacesLeft-1)WHERE Event2.eventId like NEW.eventId;
	END$
delimiter ;


INSERT INTO Event2 (eventId,eventTitle,eventDate,totSpaces,spacesLeft)
SELECT DISTINCT eventId,eventTitle,eventDate,totSpaces,totSpaces
FROM auxTable;
    
--INSERT INTO Reservation (pId,eventId)SELECT pId,eventId FROM auxTable;

delimiter $
CREATE PROCEDURE takeSpace2 (pId VARCHAR(18),eventId VARCHAR(5))
	BEGIN
		IF (Select spacesLeft FROM Event2 where Event2.eventId=eventId)> 0 THEN
            	INSERT INTO Reservation (eventId,pId) VALUES (eventId, pId);
		END IF;	
	END$
delimiter ;
