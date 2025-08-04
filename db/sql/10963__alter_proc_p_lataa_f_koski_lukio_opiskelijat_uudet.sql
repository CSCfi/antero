USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_lukio_opiskelijat_uudet]    Script Date: 30.7.2025 10.31.00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_koski_lukio_opiskelijat_uudet] AS

DROP TABLE IF EXISTS dw.f_koski_lukio_opiskelijat_uudet

SELECT DISTINCT 
	[opiskeluoikeus_oid]
	,[sisaltyy_opiskeluoikeuteen_oid]
	,vuosi
	,kuukausi
	,[master_oid]
	,[oppilaitos_oid]
	,[koulutustoimija_oid]
	,[koulutusmuoto]
	,[koulutusmoduuli_koodiarvo]
	,[alkamispaiva]
	,[paattymispaiva]
	,oppimaara
	,suorituksen_tyyppi
	,[toimipiste_oid]
	,[toimipiste_nimi]
	,Sukupuoli
	,ika
	,aidinkieli
	,kansalaisuus
	,syntymaaika
	,majoitus
	,sisaoppilaitosmainen_majoitus

INTO dw.f_koski_lukio_opiskelijat_uudet

FROM (

	SELECT DISTINCT 
		[opiskeluoikeus_oid]
		,[sisaltyy_opiskeluoikeuteen_oid]
		,vuosi
		,kuukausi
		,[master_oid]
		,[oppilaitos_oid]
		,[oppilaitos_nimi]
		,[oppilaitos_kotipaikka]
		,[oppilaitosnumero]
		,[koulutustoimija_oid]
		,[koulutustoimija_nimi]
		,[koulutusmuoto]
		,[alkamispaiva]
		,[paattymispaiva]
		,oppimaara
		,suorituksen_tyyppi
		,[koulutusmoduuli_koodiarvo]
		,[toimipiste_oid]
		,[toimipiste_nimi]  
		,Sukupuoli
		,ika
		,aidinkieli
		,kansalaisuus
		,syntymaaika
		,majoitus
		,sisaoppilaitosmainen_majoitus
		,rnk = rank() over (partition by opiskeluoikeus_oid, koulutustoimija_oid order by tila_alkanut)
	
	FROM (
		
		SELECT oo.[opiskeluoikeus_oid]
			,oo.[sisaltyy_opiskeluoikeuteen_oid]
			,CASE WHEN ooa.tila_alkanut > lps.alku THEN ooa.tila_alkanut ELSE lps.alku END as tila_alkanut
			,YEAR(CASE WHEN ooa.tila_alkanut > lps.alku THEN ooa.tila_alkanut ELSE lps.alku END) AS vuosi
			,MONTH(CASE WHEN ooa.tila_alkanut > lps.alku THEN ooa.tila_alkanut ELSE lps.alku END) AS kuukausi
			,oo.[master_oid]
			,oo.[oppilaitos_oid]
			,oo.[oppilaitos_nimi]
			,oo.[oppilaitos_kotipaikka]
			,oo.[oppilaitosnumero]
			,oo.[koulutustoimija_oid]
			,oo.[koulutustoimija_nimi]
			,oo.[koulutusmuoto]
			,oo.[alkamispaiva]
			,oo.[paattymispaiva]
			,CASE 
				WHEN ps.suorituksen_tyyppi LIKE 'internati%' THEN 'Ulkomainen tutkinto' 
				WHEN ps.suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'diatutkintovaihe', 'ebtutkinto', 'europeanschoolofhelsinkivuosiluokkasecondaryupper') THEN 'Ulkomainen tutkinto'
				WHEN ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and ps.koulutusmoduuli_koodiarvo = 'S5' THEN 'Ulkomainen tutkinto'
				ELSE ps.oppimaara 
			END AS oppimaara
			,ps.[vahvistus_paiva]
			,ps.[toimipiste_oid]
			,ps.[toimipiste_nimi]
			,Sukupuoli = henk.sukupuoli
			,Ika = YEAR(CASE WHEN ooa.tila_alkanut > lps.alku THEN ooa.tila_alkanut ELSE lps.alku END) - YEAR(henk.syntymaaika)
			,CASE WHEN henk.aidinkieli IS NULL THEN '-1' ELSE henk.aidinkieli END AS aidinkieli
			,CASE WHEN henk.kansalaisuus IS NULL THEN '-1' ELSE henk.kansalaisuus END AS kansalaisuus
			,henk.syntymaaika --CASE WHEN henk.syntymaaika IS NULL THEN '-1' ELSE henk.syntymaaika END AS syntymaaika
			,ps.koulutusmoduuli_koodiarvo
			,ps.suorituksen_tyyppi
			,ooa.majoitus
			,ooa.sisaoppilaitosmainen_majoitus

		  FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
		  LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus AS ps ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
		  LEFT JOIN (SELECT DISTINCT opiskeluoikeus_oid, alku FROM Koski_SA.sa.sa_lukio_paatason_suoritus) lps on lps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		  LEFT JOIN (
				SELECT MIN(ps.suorituksen_alkamispaiva) as alku, oo.opiskeluoikeus_oid FROM Koski_SA.sa.sa_koski_opiskeluoikeus oo
				LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
				WHERE ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondaryupper' OR (ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and ps.koulutusmoduuli_koodiarvo = 'S5') OR
					  (ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' and ps.koulutusmoduuli_koodiarvo = '10') OR ps.suorituksen_tyyppi = 'internationalschooldiplomavuosiluokka'
				GROUP BY oo.opiskeluoikeus_oid
			) alku ON alku.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		  LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso AS ooa ON oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid and ooa.loppu >= lps.alku
		  LEFT JOIN Koski_SA.sa.sa_koski_henkilo_master AS henk ON oo.master_oid = henk.master_oid

		  WHERE (
			ps.suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'lukionoppiaineenoppimaara', 'lukionoppimaara', 'diatutkintovaihe', 'luva', 'internationalschooldiplomavuosiluokka', 'europeanschoolofhelsinkivuosiluokkasecondaryupper')
			OR oo.tuva_jarjestamislupa = 'lukio'
			OR (ps.suorituksen_tyyppi = 'europeanschoolofhelsinkivuosiluokkasecondarylower' and ps.koulutusmoduuli_koodiarvo = 'S5')
			OR (ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12'))
			OR (ps.suorituksen_tyyppi = 'ebtutkinto' and alku.alku is not null)	
		  )
		  AND ooa.tila = 'lasna'
		  AND YEAR(oo.alkamispaiva) >= 2018

	) q1

	WHERE NOT EXISTS (
		SELECT * FROM Koski_SA.sa.tuva_lasna_loma_jaksot tuvat
		WHERE q1.koulutusmuoto != 'tuva'
		AND tuvat.master_oid = q1.master_oid
		AND q1.tila_alkanut between tuvat.alku and tuvat.loppu
	)

) q2

WHERE rnk = 1


-- f_koski_perusaste_keskiarvot-taulun lataus
-- Perusjoukko muodostetaan f_koski_lukio_opiskelijat_uudet-taulun pohjalta
EXEC [dw].[p_lataa_f_koski_perusaste_keskiarvot]

GO


