USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[paivita_sa_koski_kotikuntahistoria]    Script Date: 29.1.2025 8.16.20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[paivita_sa_koski_kotikuntahistoria] as

DELETE Koski_SA.sa.sa_koski_kotikuntahistoria
WHERE source = 'ETL: paivita_sa_koski_kotikuntahistoria'

-- Duplikaattirivien poisto

DROP TABLE IF EXISTS #temp_kotikuntahistoria

SELECT DISTINCT * 
INTO #temp_kotikuntahistoria
FROM Koski_SA.sa.sa_koski_kotikuntahistoria

TRUNCATE TABLE Koski_SA.sa.sa_koski_kotikuntahistoria

INSERT INTO Koski_SA.sa.sa_koski_kotikuntahistoria
SELECT * FROM #temp_kotikuntahistoria

DROP TABLE IF EXISTS #temp_kotikuntahistoria

-- Asetetaan muuttopäiväksi syntymäpäivä, jos muuttopäivä on null ja kyseessä on varhaisin poismuuttopäivä

UPDATE kkh
SET 
	kkh.muutto_pvm = kkh2.syntymaaika
FROM Koski_SA.sa.sa_koski_kotikuntahistoria kkh
OUTER APPLY (
	SELECT 
		MIN(kkh2.poismuutto_pvm) as poismuutto_pvm,
		MIN(h.syntymaaika) as syntymaaika
	FROM Koski_SA.sa.sa_koski_kotikuntahistoria kkh2
	LEFT JOIN Koski_SA.sa.sa_koski_henkilo h on h.master_oid = kkh2.master_oid
	WHERE kkh2.master_oid = kkh.master_oid
) kkh2
where kkh.muutto_pvm is null and kkh.poismuutto_pvm = kkh2.poismuutto_pvm;

-- Jos muuttopäivä on null, muuttopäiväksi asetetaan edellistä poismuuttopäivää seuraava päivä

UPDATE kkh
SET 
	kkh.muutto_pvm = kkh2.muutto_pvm
from sa.sa_koski_kotikuntahistoria kkh 
LEFT JOIN (
	select
		poismuutto_pvm,
		master_oid,
		DATEADD(day,1, LAG(poismuutto_pvm) OVER( PARTITION BY master_oid ORDER BY poismuutto_pvm)) muutto_pvm
	from sa.sa_koski_kotikuntahistoria kkh 
) kkh2 on kkh2.master_oid = kkh.master_oid and kkh.poismuutto_pvm = kkh2.poismuutto_pvm
WHERE kkh.muutto_pvm is null

-- Generoidaan syntymäpäivän ja ensimmäisen muuttopäivän kotikunta

INSERT INTO Koski_SA.sa.sa_koski_kotikuntahistoria
SELECT DISTINCT
	kh.master_oid, 
	'999' as kotikunta,
	h.syntymaaika as muutto_pvm,
	DATEADD(day,-1,kh.muutto_pvm) as poismuutto_pvm,
	0 as turvakielto,
	getdate() as imp_created,
	SUSER_SNAME() as username,
	'ETL: paivita_sa_koski_kotikuntahistoria' as source
FROM (
	SELECT master_oid, MIN(muutto_pvm) as muutto_pvm
	FROM Koski_SA.sa.sa_koski_kotikuntahistoria kh
	GROUP BY master_oid
) kh
LEFT JOIN Koski_SA.sa.sa_koski_henkilo h on h.master_oid = kh.master_oid
WHERE muutto_pvm > h.syntymaaika;

-- Generoidaan muut puuttuvat ajanjaksot

INSERT INTO Koski_SA.sa.sa_koski_kotikuntahistoria
SELECT
	master_oid,
	'999' as kotikunta,
	DATEADD(day, 1, poismuutto_pvm) AS muutto_pvm,
	DATEADD(day, -1, seuraava_muutto_pvm) AS poismuutto_pvm,
	0 as turvakielto,
	getdate() as imp_created,
	SUSER_SNAME() as username,
	'ETL: paivita_sa_koski_kotikuntahistoria' as source
FROM (
	SELECT
		master_oid,
		muutto_pvm,
		poismuutto_pvm,
		LEAD(muutto_pvm) OVER (PARTITION BY master_oid ORDER BY muutto_pvm) AS seuraava_muutto_pvm
	FROM Koski_SA.sa.sa_koski_kotikuntahistoria kh
) kh
WHERE seuraava_muutto_pvm IS NOT NULL AND DATEADD(day, 1, poismuutto_pvm) < seuraava_muutto_pvm;
	
-- Nykyinen kotikunta poismuutto_pvm

UPDATE Koski_SA.sa.sa_koski_kotikuntahistoria
SET poismuutto_pvm = '9999-01-01'
WHERE poismuutto_pvm is null


GO

USE [ANTERO]