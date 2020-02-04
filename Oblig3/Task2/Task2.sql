INSERT INTO AnotherTable (name,note)
VALUES	('1','2'),
	('2','3'),
	('4','5'),
	('Adrian','Adrian');

Select *, row_start,row_end FROM AnotherTable;

UPDATE AnotherTable SET note='Fortsatt Adrian' Where ID=4;

Select *, row_start,row_end FROM AnotherTable;

DELETE FROM AnotherTable WHERE id=2;

Select *, row_start,row_end FROM AnotherTable;

INSERT INTO AnotherTable (name,note)
VALUES	('Hege','Ikke Adrian');

SELECT *, row_start,row_end FROM AnotherTable;


