CREATE TABLE Event(
	eventId VARCHAR(10),
	eventTitle VARCHAR(88),
	eventDate DATETIME,
	totSpaces INTEGER,
	CONSTRAINT EventPK PRIMARY KEY (eventId)
);

CREATE TABLE Atendee(
	pId VARCHAR(7),
	eventId VARCHAR(10),
	lName VARCHAR (15),
	fName VARCHAR (15),
	CONSTRAINT AtendingEventFK FOREIGN KEY (eventId) REFERENCES Event(eventId),
	CONSTRAINT AtendeePK PRIMARY KEY (pId,eventId)
);


