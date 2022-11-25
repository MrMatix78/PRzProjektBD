CREATE TRIGGER EVN.TRG_addServiceOperation
ON EVN.EventLogs
AFTER INSERT
AS
BEGIN
	INSERT INTO EVN.ServiceOperations(
		Event_Id,
		Operator,
		Status
		)
	SELECT
		i.Id,
		1003,
		1
	FROM 
		inserted i
END