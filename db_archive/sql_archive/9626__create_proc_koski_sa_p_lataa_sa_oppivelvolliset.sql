USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_sa_oppivelvolliset]    Script Date: 23.2.2024 8:12:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dbo].[p_lataa_sa_oppivelvolliset] as

TRUNCATE TABLE  Koski_SA.sa.sa_oppivelvolliset

INSERT INTO Koski_SA.sa.sa_oppivelvolliset
SELECT 
	h.[oppija_oid],
	MAX(
		CASE 
			WHEN po.alku > cast('2021-08-01' as date) and po.alku < DATEFROMPARTS(YEAR(DATEADD(YEAR, 7, h.syntymaaika)), 8, 1) and po.alku < coalesce(po2.alku, '9999-01-01') THEN po.alku
			WHEN po2.alku > cast('2021-08-01' as date) and po2.alku < DATEFROMPARTS(YEAR(DATEADD(YEAR, 7, h.syntymaaika)), 8, 1) THEN po2.alku
			WHEN DATEFROMPARTS(YEAR(DATEADD(YEAR, 7, h.syntymaaika)), 8, 1) > cast('2021-08-01' as date) THEN DATEFROMPARTS(YEAR(DATEADD(YEAR, 7, h.syntymaaika)), 8, 1)
			ELSE cast('2021-08-01' as date)
		END
	) as alkuPvm,
	MIN(
		CASE 
			WHEN ts.tutkinto_suoritettu < DATEADD(YEAR,18,h.syntymaaika) and ts.tutkinto_suoritettu < vov.vapautettu THEN cast(ts.tutkinto_suoritettu as date)
			WHEN vov.vapautettu < DATEADD(YEAR,18,h.syntymaaika) THEN cast(vov.vapautettu  as date)
		ELSE  cast(DATEADD(YEAR,18,h.syntymaaika) as date)
	END
	) as loppuPvm
FROM [Koski_SA].[sa].[sa_koski_henkilo] h
LEFT JOIN [ANTERO].[dw].[d_alueluokitus] d on d.kunta_koodi = h.kotikunta
LEFT JOIN (
	SELECT DISTINCT 
		oo.oppija_oid
	FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
	LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
	WHERE ((ps.suorituksen_tyyppi in ('aikuistenperusopetuksenoppimaara', 'perusopetuksenoppimaara','perusopetuksenlisaopetus')) OR
			(ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' and ps.koulutusmoduuli_koodiarvo = '9') OR
			(ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and ps.koulutusmoduuli_koodiarvo = 'S4')) AND 
			YEAR(ps.vahvistus_paiva) < 2021 AND oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1) oo on oo.oppija_oid = h.oppija_oid
LEFT JOIN (
	SELECT 
		oo.oppija_oid, 
		MIN(COALESCE(ooy.alku, ps.vahvistus_paiva)) as tutkinto_suoritettu
	FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
	LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
	LEFT JOIN [Koski_SA].[sa].[sa_koski_opiskeluoikeus_ytr] ooy on oo.opiskeluoikeus_oid = ooy.opiskeluoikeus_oid and ooy.tila_koodiarvo = 'valmistunut'
	WHERE	((ps.vahvistus_paiva is not null) AND
			((ps.suorituksen_tyyppi in('ammatillinentutkinto','ibtutkinto','diatutkintovaihe')) OR
			(ps.suorituksen_tyyppi = 'internationalschooldiplomavuosiluokka' AND ps.koulutusmoduuli_koodiarvo = '12'))) OR
			(ooy.tila_koodiarvo = 'valmistunut')
	GROUP BY oo.oppija_oid) ts on ts.oppija_oid = h.oppija_oid
OUTER APPLY (
	SELECT 
		MIN(vov.vapautettu) as vapautettu
	FROM [Koski_SA].[sa].[sa_valpas_oppivelvollisuudesta_vapautetut] vov 
	WHERE vov.oppija_oid = h.oppija_oid 
) vov 
LEFT JOIN (
	SELECT oo.oppija_oid, MIN(cast(alku as date)) as alku 
	FROM Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa
	LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	WHERE pidennetty_oppivelvollisuus = 1
	GROUP BY oo.oppija_oid
) po on po.oppija_oid = h.oppija_oid
LEFT JOIN (
	SELECT oo.oppija_oid, MIN(cast(alku as date)) as alku 
	FROM Koski_SA.sa.sa_koski_esiopetus_opiskeluoikeus_aikajakso ooa
	LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	WHERE pidennetty_oppivelvollisuus = 1
	GROUP BY oo.oppija_oid
) po2 on po2.oppija_oid = h.oppija_oid
WHERE YEAR(syntymaaika) >= 2004 AND d.mannersuomessa = 1 AND oo.oppija_oid is null
GROUP BY h.[oppija_oid]

GO

USE [ANTERO]