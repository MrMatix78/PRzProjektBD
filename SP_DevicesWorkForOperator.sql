CREATE PROCEDURE SP_DevicesWorkForOperator
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
		,DW.StartTime AS 'Czas rozpoczęcia'
		,DW.EndTime AS 'Czas zakończenia'
		,CONCAT((DATEDIFF(MINUTE, DW.StartTime,DW.EndTime)), ' min') AS 'Czas pracy'
	FROM DVC.DevicesWork DW
	INNER JOIN DVC.Devices D
		ON DW.Device = D.Id
	INNER JOIN DVC.Location L
		ON DW.Location = L.Id
	INNER JOIN EMP.Employees E
		ON DW.Operator = E.Id
	WHERE @Operator = E.Login AND (DW.StartTime BETWEEN @DataStart AND @DataEnd)
END