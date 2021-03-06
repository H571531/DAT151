--Oppgave1
CREATE TABLE TheTable (
	id SMALLINT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
	name varchar(25) NOT NULL,
	note varchar(25) NOT NULL,
	CONSTRAINT TheTablePK PRIMARY KEY (id)
);

CREATE TABLE LogTable (
	id SMALLINT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
	changeTimeStamp DATE,
	action varchar(8),
	tableId SMALLINT(1) UNSIGNED NOT NULL, 
	name varchar(25) NOT NULL,
	note varchar(25) NOT NULL,
	CONSTRAINT LogPK PRIMARY KEY (id)
);

--Oppgave2
CREATE TABLE AnotherTable (
	id SMALLINT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
	name varchar(25) NOT NULL,
	note varchar(25) NOT NULL,
	CONSTRAINT TheTablePK PRIMARY KEY (id)
)WITH SYSTEM VERSIONING;
--Oppgave3
CREATE TABLE teacher(
	id SMALLINT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
	name VARCHAR(80),
	salary DOUBLE NOT NULL CHECK(salary BETWEEN 1000 AND 100000),
	bonus DOUBLE,
	total DOUBLE as (bonus+salary),
	CONSTRAINT teacherPK PRIMARY KEY (id) 
);
--Oppgave4
CREATE TABLE t1 (
	id SMALLINT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
	fyllt timestamp default now() on update now(),
	note varchar(25) NOT NULL,
	CONSTRAINT t1PK PRIMARY KEY (id)
);


CREATE TABLE t2 (
	id SMALLINT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
	fyllt timestamp default now() on update now(),
	note varchar(25) NOT NULL,
	CONSTRAINT t2PK PRIMARY KEY (id)
);


CREATE TABLE t3 (
	id SMALLINT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
	fyllt timestamp default now() on update now(),
	note varchar(25) NOT NULL,
	CONSTRAINT t3PK PRIMARY KEY (id)
);

--Oppgave5
CREATE TABLE Parent(
	id SMALLINT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
	name varchar(25),
	CONSTRAINT ParentPK PRIMARY KEY (id)
);
CREATE TABLE Child(
	id SMALLINT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
	name varchar(25),
	parent SMALLINT(1) UNSIGNED NOT NULL,
	CONSTRAINT ChildPK PRIMARY KEY (id),
	CONSTRAINT CHildParentFK FOREIGN KEY (parent) REFERENCES Parent(id)
);


