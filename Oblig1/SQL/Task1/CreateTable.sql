DROP TABLE IF EXISTS testTable;
DROP TABLE IF EXISTS person;
DROP TABLE IF EXISTS bedrift;

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

CREATE TABLE testTable(
	testId varchar(4),
	navn varchar(8),
	CONSTRAINT testPK PRIMARY KEY (testId)
);
