INSERT INTO Parent (name) VALUES
	('Parent1'),
	('Parent2'),
	('Parent3');

INSERT INTO Child (name, parent) VALUES
	('Child1',1),
	('Child2',1),
	('Child3',1),
	('Child4',2),
	('Child5',2),
	('Child6',3);

Select * from Parent;
Select * from Child; 

-- Pendant Delete trigger
delimiter $
CREATE TRIGGER Pendant_Delete AFTER DELETE ON Child
FOR EACH ROW
BEGIN
	IF (Select count(*) from Child where parent=OLD.parent) < 1 THEN
		DELETE FROM Parent WHERE id=OLD.parent;
	END IF;
End$

delimiter ;
