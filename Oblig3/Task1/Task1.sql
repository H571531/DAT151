delimiter $
CREATE TRIGGER Task1Insert AFTER INSERT ON TheTable
	FOR EACH ROW
	BEGIN
		INSERT INTO LogTable (changeTimeStamp,action,tableId,name,note)
		VALUES(NOW(),'INSERT',NEW.id,NEW.name,NEW.note);
	END$

CREATE TRIGGER TASK1UPDATEa AFTER UPDATE ON TheTable
	FOR EACH ROW
	BEGIN
		INSERT INTO LogTable (changeTimeStamp,action,tableId,name,note)
		VALUES(NOW(),'UPDATEb',OLD.id,OLD.name,OLD.note);
	END$

CREATE TRIGGER TASK1UPDATEb AFTER UPDATE ON TheTable
	FOR EACH ROW
	BEGIN
		INSERT INTO LogTable (changeTimeStamp,action,tableId,name,note)
		VALUES(NOW(),'UPDATEa',NEW.id,NEW.name,NEW.note);
	END$

CREATE TRIGGER TASK1DELETE after DELETE ON TheTable
	FOR EACH ROW
	BEGIN
		INSERT INTO LogTable (changeTimeStamp,action,tableId,name,note)
		VALUES(NOW(),'DELETE',OLD.id,OLD.name,OLD.note);
	END$

delimiter ;
