--a
--Finnes i ../Tables.sql
--b
delimiter $
CREATE TRIGGER tr12 BEFORE INSERT ON t1
	FOR EACH ROW
	BEGIN
		INSERT INTO t2 (note)
		VALUES('tr12');
	END$

CREATE TRIGGER tr23 AFTER INSERT ON t2
	FOR EACH ROW
	BEGIN
		INSERT INTO t3 (note)
		VALUES('tr23');
	END$

CREATE TRIGGER tr13 AFTER INSERT ON t1
	FOR EACH ROW
	BEGIN
		INSERT INTO t3 (note)
		VALUES('tr13');
	END$
delimiter ;
INSERT INTO t1 (note) 
values ('Start');

select * from t1;
select * from t2;
select * from t3;

