DROP TABLE IF EXISTS bedrift;
DROP TABLE IF EXISTS person;

CREATE TABLE bedrift(
	bedriftsId varchar(4),
	navn varchar(8),
	CONSTRAINT bedriftPK PRIMARY KEY (bedriftsId)
);

CREATE TABLE person(
	enId varchar(4),
	navn varchar(8),
	alder int,
	bedriftsId varchar(4),
	CONSTRAINT bedriftFK FOREIGN KEY (bedriftsId) REFERENCES bedrift(bedriftsId),
	CONSTRAINT personPK PRIMARY KEY (enId)
);



