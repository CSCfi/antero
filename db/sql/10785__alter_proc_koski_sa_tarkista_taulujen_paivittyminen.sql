USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[tarkista_taulujen_paivittyminen] AS

--1: taulujen päivittyminen (osasuoritustaulu siirretty osaksi toista tarkistusvaihetta)

DECLARE @pvmVahintaan date = DATEADD(day, -7, getdate())

DECLARE @maxMuutosPvm date = 
(
	SELECT max(oo.aikaleima)
	FROM [sa].[sa_koski_opiskeluoikeus] oo 
	JOIN [sa].[sa_koski_opiskeluoikeus_aikajakso] ooa ON ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid 
	JOIN [sa].[sa_koski_henkilo] h ON h.oppija_oid = oo.oppija_oid
)
DECLARE @maxLatausPvm1 date = (SELECT max(imp_created) FROM [sa].[sa_koski_henkilo])
DECLARE @maxLatausPvm2 date = (SELECT max(imp_created) FROM [sa].[sa_koski_opiskeluoikeus])
DECLARE @maxLatausPvm3 date = (SELECT max(imp_created) FROM [sa].[sa_koski_opiskeluoikeus_aikajakso])
DECLARE @maxLatausPvm4 date = (SELECT max(imp_created) FROM [sa].[sa_koski_paatason_suoritus])
--DECLARE @maxLatausPvm5 date = (SELECT max(imp_created) FROM [sa].[sa_koski_osasuoritus])

DECLARE @minLatausPvm date = 
(
	SELECT min(pvm) 
	FROM (
		SELECT coalesce(@maxMuutosPvm, '2000-01-01') pvm
		UNION SELECT coalesce(@maxLatausPvm1, '2000-01-01')
		UNION SELECT coalesce(@maxLatausPvm2, '2000-01-01')
		UNION SELECT coalesce(@maxLatausPvm3, '2000-01-01')
		UNION SELECT coalesce(@maxLatausPvm4, '2000-01-01')
		--UNION SELECT coalesce(@maxLatausPvm5, '2000-01-01')
	) q
)

IF (@minLatausPvm < @pvmVahintaan)
RAISERROR (N'Jokin päätauluista tyhjä tai ei ole päivittynyt viikkoon, tarkista integraatio.', 11, 1)
;

--2: päätason suoritukset ja osasuoritukset samalta päivältä

DECLARE @opiskeluoikeudetA int = (
	SELECT count(distinct oo.opiskeluoikeus_oid)
	FROM sa.sa_koski_opiskeluoikeus oo
	JOIN [sa].[sa_koski_paatason_suoritus] ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid  
	JOIN sa.sa_koski_osasuoritus os on os.paatason_suoritus_id = ps.paatason_suoritus_id  --hierarkinen liitos generoitavalla id:llä
)
DECLARE @opiskeluoikeudetB int = (
	SELECT count(distinct oo.opiskeluoikeus_oid)
	FROM sa.sa_koski_opiskeluoikeus oo
	JOIN [sa].[sa_koski_paatason_suoritus] ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid --orpojen varalta tässäkin
	JOIN sa.sa_koski_osasuoritus os on os.opiskeluoikeus_oid = oo.opiskeluoikeus_oid --varsinainen liitos karkeampi, kiinteällä tunnisteella
)

IF (@opiskeluoikeudetA != @opiskeluoikeudetB) 
RAISERROR (N'Päätason suoritukset ja osasuoritukset eri päiviltä, tarkista integraatio.', 11, 1)
;

GO
