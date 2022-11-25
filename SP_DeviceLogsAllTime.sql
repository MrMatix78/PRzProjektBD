CREATE PROCEDURE SP_DeviceLogsAllTime
(
@CODE AS VARCHAR(20)
)
AS
BEGIN
SET NOCOUNT ON
	SELECT   EL.Id AS [Event Id]
			,D.Name AS Urządzenie
			, EL.Code AS [Kod błędu]
			, ET.Name AS [Typ błędu]
			, EL.TimeEvent AS [Data zadarzenia]
			, E.Login AS Operator
	FROM EVN.EventLogs AS EL 
	INNER JOIN EVN.EventsType AS ET 
		ON EL.Type = ET.Id 
	INNER JOIN DVC.DevicesWork AS DW 
		ON EL.DeviceWorkSession = DW.Id 
	INNER JOIN DVC.Devices AS D 
		ON DW.Device = D.Id 
	INNER JOIN EMP.Employees AS E 
		ON DW.Operator = E.Id
	WHERE D.Code = @CODE
END