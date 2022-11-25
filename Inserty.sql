/* Dodawanie sesji urządzenia*/
INSERT INTO DVC.DevicesWork(
	Device,
	Operator,
	Location,
	StartTime
	)
VALUES(
	'', -- Urzadzenie (int)
	'', -- Operator (int)
	'', -- Lokalizacja (int)
	'' -- Czas rozpoczecia (datetime)
	)
	
/* Dodawanie zdarzenia */
INSERT EVN.EventLogs(
	DeviceWorkSession,
	Code,
	Type,
	TimeEvent
	)
VALUES(
	'', -- Sesja urzadzenia (int)
	'', -- Kod bledu (varchar)
	'', -- Typ zdarzenia(int)
	'' -- Czas wystąpienia (datetime)
    )
