CREATE TABLE IF NOT EXISTS Atendee (
  pId VARCHAR(18),
  lName VARCHAR(45) NULL,
  fName VARCHAR(45) NULL,
  PRIMARY KEY (pId))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Event (
  eventId VARCHAR(5),
  eventTitle VARCHAR(45) NULL,
  eventDate VARCHAR(45) NULL,
  totSpaces INT NULL,
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

-- New Optimized
CREATE TABLE IF NOT EXISTS Event2 (
  eventId VARCHAR(5),
  eventTitle VARCHAR(45) NULL,
  eventDate VARCHAR(45) NULL,
  totSpaces INT NULL,
  spacesLeft INT NULL,
  PRIMARY KEY (EventId))
ENGINE = InnoDB;

--Trigger for new Event
CREATE TRIGGER EventUpdate AFTER INSERT ON Reservation
	FOR EACH ROW
	BEGIN
		DECLARE reservasjoner;
		set reservasjoner = select count(*) where Event.eventId=NEW.eventId;
		UPDATE Event
		SET spacesLeft = (totSpaces - reservasjoner)
		WHERE Event.eventId=NEW.eventId;
	END$