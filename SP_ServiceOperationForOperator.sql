CREATE PROCEDURE SP_ServiceOperationForOperator
(
	@DataStart AS DATETIME,
	@DataEnd AS DATETIME,
	@Operator AS VARCHAR(100)
)
AS
BEGIN
SET NOCOUNT ON
	SELECT 
		 D.Name AS 'Urządzenie'
		,CONCAT(L.Building,' ',L.Sector) AS 'Lokalizacja'
		,SO.StartTime AS 'Czas rozpoczęcia'
		,SO.EndTime AS 'Czas zakończenia'
		,CONCAT((DATEDIFF(MINUTE, SO.StartTime, ISNULL(SO.EndTime, GETDATE()))), ' min') AS 'Czas w serwisie'
	FROM EVN.ServiceOperations SO
	INNER JOIN EVN.EventLogs EL
		ON SO.Event_Id = EL.Id
	INNER JOIN DVC.DevicesWork DW
		ON EL.DeviceWorkSession = DW.Id
	INNER JOIN DVC.Devices D
		ON DW.Device = D.Id
	INNER JOIN DVC.Location L
		ON DW.Location = L.Id
	INNER JOIN EMP.Employees E
		ON SO.Operator = E.Id
	WHERE @Operator = E.Login AND (DW.StartTime BETWEEN @DataStart AND @DataEnd)
END

