USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[tarkista_taulujen_paivittyminen] AS

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
DECLARE @maxLatausPvm5 date = (SELECT max(imp_created) FROM [sa].[sa_koski_osasuoritus])

DECLARE @minLatausPvm date = 
(
	SELECT min(pvm) 
	FROM (
		SELECT @maxMuutosPvm pvm
		UNION SELECT @maxLatausPvm1
		UNION SELECT @maxLatausPvm2
		UNION SELECT @maxLatausPvm3
		UNION SELECT @maxLatausPvm4
		UNION SELECT @maxLatausPvm5
	) q
)

IF (@minLatausPvm < @pvmVahintaan)
RAISERROR (N'Jokin sa-päätauluista tai sen sisältö ei ole päivittynyt viikkoon, tarkista ETL.', 11, 1)
