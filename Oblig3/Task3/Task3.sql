CREATE TABLE teacher(
	id SMALLINT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
	name VARCHAR(80),
	salary DOUBLE NOT NULL CHECK(salary BETWEEN 1000 AND 100000), --CHECK vil gi en feilmelding om det er feile verdier som kommer inn. 
	bonus DOUBLE,
	total DOUBLE as (bonus+salary), -- MariaDB syntax, I en annen databasetype ville det kanskje vært gjort med triggers. 
	CONSTRAINT teacherPK PRIMARY KEY (id) 
);

-- Kunne også vært gjort med trigger (before) insert og update

