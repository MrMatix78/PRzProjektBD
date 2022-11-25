INSERT INTO DVC.DevicesWork(
	Device,
	Operator,
	Location,
	StartTime
	)
VALUES(
	1, -- Urzadzenie (int)
	5, -- Operator (int)
	1, -- Lokalizacja (int)
	'2022-11-19 8:03:00' -- Czas rozpoczecia (datetime)
	)

INSERT EVN.EventLogs(
	DeviceWorkSession,
	Code,
	Type,
	TimeEvent
	)
VALUES(
	'', -- Sesja urzadzenia (int)
	'MESFailureX43x4', -- Kod bledu (varchar)
	2, -- Typ zdarzenia(int)
	'2022-11-19 10:25:00' -- Czas wystąpienia (datetime)
    )