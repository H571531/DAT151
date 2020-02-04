CREATE TABLE teacher(
	id SMALLINT(1) UNSIGNED NOT NULL AUTO_INCREMENT,
	name VARCHAR(80),
	salary DOUBLE NOT NULL CHECK(salary BETWEEN 1000 AND 100000),
	bonus DOUBLE,
	total DOUBLE as (bonus+salary),
	CONSTRAINT teacherPK PRIMARY KEY (id) 
);

-- Kunne også vært gjort med trigger (before) insert og update

