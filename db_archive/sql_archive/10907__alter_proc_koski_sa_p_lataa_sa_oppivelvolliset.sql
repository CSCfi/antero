USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_sa_oppivelvolliset]    Script Date: 29.7.2025 15.47.09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER  PROCEDURE [dbo].[p_lataa_sa_oppivelvolliset] as

-- Generoidaan jaksot Manner-Suomessa asumisesta

DROP TABLE IF EXISTS Koski_SA.[sa].[temp_oppivelvollisten_kotikuntahistoria]

SELECT 
	master_oid,
	MIN(muutto_pvm) as muutto_pvm,
	MAX(poismuutto_pvm) as poismuutto_pvm
INTO Koski_SA.[sa].[temp_oppivelvollisten_kotikuntahistoria]
FROM (
	SELECT  
		kh.master_oid,
		kh.muutto_pvm,
		kh.poismuutto_pvm,
		ms.mannersuomestamuuttopvm
	FROM Koski_SA.sa.sa_koski_kotikuntahistoria kh
	LEFT JOIN ANTERO.dw.d_alueluokitus d1 on d1.kunta_koodi = kh.kotikunta
	OUTER APPLY (
		SELECT  
			MIN(kh2.muutto_pvm) as mannersuomestamuuttopvm
		FROM Koski_SA.sa.sa_koski_kotikuntahistoria kh2
		LEFT JOIN ANTERO.dw.d_alueluokitus d2 on d2.kunta_koodi = kh2.kotikunta
		WHERE kh2.master_oid = kh.master_oid AND d2.mannersuomessa = 0 and kh.muutto_pvm < kh2.muutto_pvm
	) ms
	WHERE d1.mannersuomessa = 1
) f
GROUP BY master_oid, mannersuomestamuuttopvm

-- Varsinainen lataus

TRUNCATE TABLE  Koski_SA.sa.sa_oppivelvolliset

INSERT INTO Koski_SA.sa.sa_oppivelvolliset
SELECT 
	h.[master_oid],
	-- Oppivelvollisuuden alkamispäivä
	MAX(
		CASE
			WHEN po.alku > cast('2021-08-01' as date) and po.alku < DATEFROMPARTS(YEAR(DATEADD(YEAR, 7, h.syntymaaika)), 8, 1) and po.alku < coalesce(po2.alku, '9999-01-01') and po.alku between kh.muutto_pvm and kh.poismuutto_pvm THEN po.alku
			WHEN po2.alku > cast('2021-08-01' as date) and po2.alku < DATEFROMPARTS(YEAR(DATEADD(YEAR, 7, h.syntymaaika)), 8, 1) and po2.alku between kh.muutto_pvm and kh.poismuutto_pvm THEN po2.alku
			WHEN DATEFROMPARTS(YEAR(DATEADD(YEAR, 7, h.syntymaaika)), 8, 1) > cast('2021-08-01' as date) and DATEFROMPARTS(YEAR(DATEADD(YEAR, 7, h.syntymaaika)), 8, 1) between kh.muutto_pvm and kh.poismuutto_pvm THEN DATEFROMPARTS(YEAR(DATEADD(YEAR, 7, h.syntymaaika)), 8, 1) 
			WHEN kh.muutto_pvm > cast('2021-08-01' as date) THEN kh.muutto_pvm
			ELSE cast('2021-08-01' as date)
		END
	) as alkuPvm,
	-- Oppivelvollisuuden päättymistä edeltävä päivä
	MIN(
		CASE
			WHEN kh.poismuutto_pvm < DATEADD(day,-1,DATEADD(YEAR,18,h.syntymaaika)) and kh.poismuutto_pvm < DATEADD(day,-1,COALESCE(ts.vahvistus_paiva, '9999-01-01')) and kh.poismuutto_pvm < DATEADD(day,-1,vov.vapautettu) THEN kh.poismuutto_pvm
			WHEN DATEADD(day,-1,ts.vahvistus_paiva) < DATEADD(day,-1,DATEADD(YEAR,18,h.syntymaaika)) and DATEADD(day,-1,ts.vahvistus_paiva) < DATEADD(day,-1,vov.vapautettu) THEN cast(DATEADD(day,-1,ts.vahvistus_paiva) as date)
			WHEN DATEADD(day,-1,vov.vapautettu) < DATEADD(day,-1,DATEADD(YEAR,18,h.syntymaaika)) THEN cast(DATEADD(day,-1,vov.vapautettu) as date)
			ELSE cast(DATEADD(day,-1,DATEADD(YEAR,18,h.syntymaaika)) as date)
		END
	) as loppuPvm,
	COALESCE(pov.pidennetty_oppivelvollisuus,0) as pidennetty_oppivelvollisuus
FROM [Koski_SA].[sa].[sa_koski_henkilo_master] h
LEFT JOIN Koski_SA.[sa].[temp_oppivelvollisten_kotikuntahistoria] kh on kh.master_oid = h.master_oid
LEFT JOIN (
	SELECT DISTINCT 
		oo.master_oid
	FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
	LEFT JOIN [Koski_SA].[sa].[sa_koski_paatason_suoritus] ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
	WHERE ((ps.suorituksen_tyyppi in ('aikuistenperusopetuksenoppimaara', 'perusopetuksenoppimaara','perusopetuksenlisaopetus')) OR
			(ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' and ps.koulutusmoduuli_koodiarvo = '9') OR
			(ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and ps.koulutusmoduuli_koodiarvo = 'S4')) AND 
			YEAR(ps.vahvistus_paiva) < 2021 AND oo.oppivelvollisuuden_suorittamiseen_kelpaava = 1) oo on oo.master_oid = h.master_oid
LEFT JOIN [sa].toisen_asteen_tutkinnot ts on ts.master_oid = h.master_oid and ts.rnk = 1
OUTER APPLY (
	SELECT 
		COALESCE(MIN(vov.vapautettu),'9999-01-01') as vapautettu
	FROM [Koski_SA].[sa].[sa_valpas_oppivelvollisuudesta_vapautetut] vov 
	WHERE vov.master_oid = h.master_oid 
) vov 
LEFT JOIN (
	SELECT oo.master_oid, MIN(cast(alku as date)) as alku 
	FROM Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa
	LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	WHERE pidennetty_oppivelvollisuus = 1
	GROUP BY oo.master_oid
) po on po.master_oid = h.master_oid
LEFT JOIN (
	SELECT oo.master_oid, MIN(cast(alku as date)) as alku 
	FROM Koski_SA.sa.sa_koski_esiopetus_opiskeluoikeus_aikajakso ooa
	LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	WHERE pidennetty_oppivelvollisuus = 1
	GROUP BY oo.master_oid
) po2 on po2.master_oid = h.master_oid
LEFT JOIN (
	SELECT
		oo.master_oid,
		MIN(
			CASE
				WHEN ooa2.vaikeasti_vammainen = 1 or ooa.vaikeasti_vammainen = 1 THEN 1
				ELSE 2
			END
		) as pidennetty_oppivelvollisuus
	FROM  Koski_SA.sa.sa_koski_opiskeluoikeus oo
	LEFT JOIN  Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	LEFT JOIN  Koski_SA.sa.sa_koski_esiopetus_opiskeluoikeus_aikajakso ooa2 on ooa2.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	WHERE ooa.pidennetty_oppivelvollisuus = 1 or ooa2.pidennetty_oppivelvollisuus = 1
	GROUP BY oo.master_oid
) pov on pov.master_oid = h.master_oid
WHERE YEAR(h.syntymaaika) >= 2004 AND oo.master_oid is null AND DATEADD(YEAR,18,h.syntymaaika) > kh.muutto_pvm AND kh.poismuutto_pvm >= cast('2021-08-01' as date)
GROUP BY h.[master_oid], COALESCE(pov.pidennetty_oppivelvollisuus,0), kh.muutto_pvm

-- Ilman 1.8.2021 rajausta esi- ja perusopetuksen raporteilla

TRUNCATE TABLE  Koski_SA.sa.sa_oppivelvolliset_esi_ja_perusopetus

INSERT INTO Koski_SA.sa.sa_oppivelvolliset_esi_ja_perusopetus
SELECT 
	h.[master_oid],
	MAX(
		CASE 
			WHEN po.alku < DATEFROMPARTS(YEAR(DATEADD(YEAR, 7, h.syntymaaika)), 8, 1) and po.alku < coalesce(po2.alku, '9999-01-01') and po.alku between kh.muutto_pvm and kh.poismuutto_pvm THEN po.alku
			WHEN po2.alku < DATEFROMPARTS(YEAR(DATEADD(YEAR, 7, h.syntymaaika)), 8, 1) and po2.alku between kh.muutto_pvm and kh.poismuutto_pvm THEN po2.alku
			WHEN DATEFROMPARTS(YEAR(DATEADD(YEAR, 7, h.syntymaaika)), 8, 1) between kh.muutto_pvm and kh.poismuutto_pvm THEN DATEFROMPARTS(YEAR(DATEADD(YEAR, 7, h.syntymaaika)), 8, 1)
			ELSE kh.muutto_pvm
		END
	) as alkuPvm,
	MIN(
		CASE 
			WHEN kh.poismuutto_pvm < DATEADD(day,-1, DATEADD(YEAR,18,h.syntymaaika)) and kh.poismuutto_pvm < DATEADD(day,-1,COALESCE(ts.vahvistus_paiva, '9999-01-01')) and kh.poismuutto_pvm < DATEADD(day,-1,vov.vapautettu) THEN kh.poismuutto_pvm
			WHEN DATEADD(day,-1,ts.vahvistus_paiva) < DATEADD(day,-1,DATEADD(YEAR,18,h.syntymaaika)) and DATEADD(day,-1,ts.vahvistus_paiva) < DATEADD(day,-1,vov.vapautettu) THEN cast(DATEADD(day,-1,ts.vahvistus_paiva) as date)
			WHEN DATEADD(day,-1, vov.vapautettu) < DATEADD(day,-1,DATEADD(YEAR,18,h.syntymaaika)) THEN cast(DATEADD(day, -1, vov.vapautettu)  as date)
			ELSE DATEADD(day,-1,cast(DATEADD(YEAR,18,h.syntymaaika) as date))
		END
	) as loppuPvm
FROM [Koski_SA].[sa].[sa_koski_henkilo_master] h
LEFT JOIN Koski_SA.[sa].[temp_oppivelvollisten_kotikuntahistoria] kh on kh.master_oid = h.master_oid
LEFT JOIN [sa].toisen_asteen_tutkinnot ts on ts.master_oid = h.master_oid and ts.rnk = 1
OUTER APPLY (
	SELECT 
		COALESCE(MIN(vov.vapautettu), '9999-01-01') as vapautettu
	FROM [Koski_SA].[sa].[sa_valpas_oppivelvollisuudesta_vapautetut] vov 
	WHERE vov.master_oid = h.master_oid 
) vov 
LEFT JOIN (
	SELECT oo.master_oid, MIN(cast(alku as date)) as alku 
	FROM Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa
	LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	WHERE pidennetty_oppivelvollisuus = 1
	GROUP BY oo.master_oid
) po on po.master_oid = h.master_oid
LEFT JOIN (
	SELECT oo.master_oid, MIN(cast(alku as date)) as alku 
	FROM Koski_SA.sa.sa_koski_esiopetus_opiskeluoikeus_aikajakso ooa
	LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	WHERE pidennetty_oppivelvollisuus = 1
	GROUP BY oo.master_oid
) po2 on po2.master_oid = h.master_oid
WHERE DATEADD(YEAR,18,h.syntymaaika) > kh.muutto_pvm
GROUP BY h.[master_oid], kh.muutto_pvm

DROP TABLE IF EXISTS Koski_SA.[sa].[temp_oppivelvollisten_kotikuntahistoria]

GO


