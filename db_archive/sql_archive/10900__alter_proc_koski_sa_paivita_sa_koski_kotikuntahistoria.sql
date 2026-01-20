USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[paivita_sa_koski_kotikuntahistoria]    Script Date: 29.7.2025 15.19.50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [sa].[paivita_sa_koski_kotikuntahistoria] as

-- Vain testissä

IF (SELECT RIGHT(LEFT(@@SERVERNAME,4),1)) = 't'

BEGIN

	DROP TABLE IF EXISTS Koski_SA.sa.sa_koski_kotikuntahistoria_testi

	SELECT * INTO Koski_SA.sa.sa_koski_kotikuntahistoria_testi
	FROM Koski_SA.sa.sa_koski_kotikuntahistoria

END

-- Poistetaan edellisen latauksen lisäämät rivit

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

-- Poistetaan virheet

DELETE Koski_SA.sa.sa_koski_kotikuntahistoria
WHERE muutto_pvm > poismuutto_pvm and muutto_pvm is not null and poismuutto_pvm is not null

-- Jos henkilöltä löytyy ainoastaan merkintä, jossa muutto- ja poismuuttopäivät ovat tuntemattomat, määritetään alkamispäiväksi syntymäpäivä

UPDATE kkh 
SET 
	muutto_pvm = h.syntymaaika,
	poismuutto_pvm = '9999-01-01'
FROM [Koski_SA].[sa].[sa_koski_kotikuntahistoria] kkh
OUTER APPLY (
	SELECT 
		COUNT(*) as rivit
	FROM [Koski_SA].[sa].[sa_koski_kotikuntahistoria] kkh2
	WHERE kkh2.master_oid = kkh.master_oid
) kkh2
LEFT JOIN [Koski_SA].[sa].[sa_koski_henkilo_master] h on  h.master_oid = kkh.master_oid
WHERE kkh.muutto_pvm is null and kkh.poismuutto_pvm is null and kkh2.rivit = 1

-- Poistetaan rivit joissa muutto- ja poismuuttopäivät ovat tuntemattomat, jos häneltä löytyy muitakin merkintöjä

DELETE kkh 
FROM [Koski_SA].[sa].[sa_koski_kotikuntahistoria] kkh
OUTER APPLY (
	SELECT 
		COUNT(*) as rivit
	FROM [Koski_SA].[sa].[sa_koski_kotikuntahistoria] kkh2
	WHERE kkh2.master_oid = kkh.master_oid
) kkh2
WHERE kkh.muutto_pvm is null and kkh.poismuutto_pvm is null and kkh2.rivit > 1

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
	LEFT JOIN Koski_SA.sa.sa_koski_henkilo_master h on h.master_oid = kkh2.master_oid
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
		DATEADD(day,1, LAG(poismuutto_pvm) OVER(PARTITION BY master_oid ORDER BY coalesce(muutto_pvm, poismuutto_pvm))) as muutto_pvm
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
LEFT JOIN Koski_SA.sa.sa_koski_henkilo_master h on h.master_oid = kh.master_oid
WHERE muutto_pvm > h.syntymaaika;

-- Asetetaan viimeisimmälle muuttopäivälle poismuuttopäivä

UPDATE kkh 
SET poismuutto_pvm = '9999-01-01'
FROM Koski_SA.sa.sa_koski_kotikuntahistoria kkh
OUTER APPLY (
	SELECT 
		MAX(muutto_pvm) as muutto_pvm 
	FROM Koski_SA.sa.sa_koski_kotikuntahistoria kkh2
	WHERE kkh.master_oid = kkh2.master_oid and kkh2.poismuutto_pvm is null
) kkh2
WHERE kkh.poismuutto_pvm is null and kkh.muutto_pvm = kkh2.muutto_pvm

-- Poistetaan rivit, jotka osuvat kokonaan yhden muutto- ja poismuuttopäivän väliin, jossa kotikunta on Manner-Suomessa

DELETE kkh
FROM [Koski_SA].[sa].[sa_koski_kotikuntahistoria] kkh
WHERE EXISTS (
	SELECT * FROM [Koski_SA].[sa].[sa_koski_kotikuntahistoria] kkh2
	LEFT JOIN ANTERO.dw.d_alueluokitus d on d.kunta_koodi = kkh2.kotikunta
	WHERE kkh.master_oid = kkh2.master_oid and 
	kkh.muutto_pvm BETWEEN kkh2.muutto_pvm and kkh2.poismuutto_pvm and
	kkh.poismuutto_pvm BETWEEN kkh2.muutto_pvm and kkh2.poismuutto_pvm and
	(kkh.muutto_pvm <> kkh2.muutto_pvm or kkh.poismuutto_pvm <> kkh2.poismuutto_pvm) and
	d.mannersuomessa = 1
)

-- Päivitetään Suomen ulkopuolella olevan kunnan muuttopäivä ja poismuuttopäivä, jos henkilö on ollut samaan aikaan Suomessa

UPDATE kkh
	SET
		kkh.muutto_pvm =
			CASE
				WHEN kkh.muutto_pvm >= kkh2.muutto_pvm THEN DATEADD(day,1,kkh2.poismuutto_pvm)
				ELSE kkh.muutto_pvm
			END,
		kkh.poismuutto_pvm = 
			CASE 
				WHEN kkh.muutto_pvm <= kkh2.muutto_pvm THEN DATEADD(day,-1,kkh2.muutto_pvm)
				ELSE kkh.poismuutto_pvm
			END
FROM [Koski_SA].[sa].[sa_koski_kotikuntahistoria] kkh
OUTER APPLY(
	SELECT
		MAX(muutto_pvm) as muutto_pvm,
		MIN(poismuutto_pvm) as poismuutto_pvm 
	FROM [Koski_SA].[sa].[sa_koski_kotikuntahistoria] kkh2
	WHERE kkh.master_oid = kkh2.master_oid and 
	(kkh2.muutto_pvm BETWEEN kkh.muutto_pvm and kkh.poismuutto_pvm or
	kkh2.poismuutto_pvm BETWEEN kkh.muutto_pvm and kkh.poismuutto_pvm) and
	(kkh2.muutto_pvm <> kkh.muutto_pvm or kkh2.poismuutto_pvm <> kkh.poismuutto_pvm) and
	kkh2.kotikunta not in ('-1', '198', '199', '200', '999')
) kkh2
WHERE kkh2.poismuutto_pvm is not null and kkh.kotikunta in ('-1', '198', '199', '200', '999')

-- Poistetaan edellisen updaten tuottamat virheet

DELETE Koski_SA.sa.sa_koski_kotikuntahistoria
WHERE muutto_pvm > poismuutto_pvm 

-- Päivitetään jälkimmäisen päällekkäisen jakson muuttopäivä

UPDATE kkh
	SET kkh.muutto_pvm = DATEADD(day, 1, kkh2.edellinen_poismuutto_pvm)
FROM [Koski_SA].[sa].[sa_koski_kotikuntahistoria] kkh
LEFT JOIN (
	SELECT 
		kkh2.master_oid,
		kkh2.kotikunta,
		kkh2.muutto_pvm,
		kkh2.poismuutto_pvm,
		LAG(kkh2.poismuutto_pvm) OVER (PARTITION BY kkh2.master_oid ORDER BY kkh2.muutto_pvm, kkh2.poismuutto_pvm) as edellinen_poismuutto_pvm
	FROM [Koski_SA].[sa].[sa_koski_kotikuntahistoria] kkh2
) kkh2 on kkh.master_oid = kkh2.master_oid and kkh.muutto_pvm = kkh2.muutto_pvm and kkh.poismuutto_pvm = kkh2.poismuutto_pvm
WHERE kkh2.edellinen_poismuutto_pvm >= kkh.muutto_pvm

-- Poistetaan edellisen updaten tuottamat virheet

DELETE Koski_SA.sa.sa_koski_kotikuntahistoria
WHERE muutto_pvm > poismuutto_pvm 

-- Generoidaan puuttuvat ajanjaksot

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
WHERE seuraava_muutto_pvm IS NOT NULL AND DATEADD(day, 1, poismuutto_pvm) < seuraava_muutto_pvm 


GO


