USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_koski_lukio_opiskelijat_uudet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_koski_lukio_opiskelijat_uudet] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_f_koski_lukio_opiskelijat_uudet] AS


DROP TABLE ANTERO.dw.f_koski_lukio_opiskelijat_uudet

SELECT DISTINCT [opiskeluoikeus_oid]
		  ,[sisaltyy_opiskeluoikeuteen_oid]
		  ,vuosi
		  ,kuukausi
		  ,[oppija_oid]
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

INTO ANTERO.dw.f_koski_lukio_opiskelijat_uudet
FROM(
SELECT DISTINCT [opiskeluoikeus_oid]
		  ,[sisaltyy_opiskeluoikeuteen_oid]
		  ,vuosi
		  ,kuukausi
		  ,[oppija_oid]
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
		SELECT  oo.[opiskeluoikeus_oid]
		  ,oo.[sisaltyy_opiskeluoikeuteen_oid]
		  ,ooa.tila_alkanut
		  ,YEAR(ooa.tila_alkanut) AS vuosi
		  ,MONTH(ooa.tila_alkanut) AS kuukausi
		  ,oo.[oppija_oid]
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
			WHEN ps.suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'diatutkintovaihe') THEN 'Ulkomainen tutkinto'
			ELSE ps.oppimaara END AS oppimaara
		  ,ps.[vahvistus_paiva]
		  ,ps.[toimipiste_oid]
		  ,ps.[toimipiste_nimi]
		  ,Sukupuoli = (CASE WHEN CAST(SUBSTRING(henk.hetu,8,3) AS INT) % 2 = 1 THEN '2' WHEN CAST(SUBSTRING(henk.hetu,8,3) AS INT) % 2 = 0 THEN '1' ELSE NULL END)
		  ,Ika = YEAR(ooa.tila_alkanut) - YEAR(henk.syntymaaika)
		,CASE WHEN henk.aidinkieli IS NULL THEN '-1' ELSE henk.aidinkieli END AS aidinkieli
		,CASE WHEN henk.kansalaisuus IS NULL THEN '-1' ELSE henk.kansalaisuus END AS kansalaisuus
		,CASE WHEN henk.syntymaaika IS NULL THEN '-1' ELSE henk.syntymaaika END AS syntymaaika
		  ,ps.koulutusmoduuli_koodiarvo
		  ,ps.suorituksen_tyyppi
		  ,ooa.majoitus
		  ,ooa.sisaoppilaitosmainen_majoitus
	  FROM [Koski_SA].[sa].[sa_koski_opiskeluoikeus] oo
	  LEFT JOIN Koski_SA.sa.sa_koski_paatason_suoritus AS ps ON oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid
	  LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso AS ooa ON oo.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
	  LEFT JOIN Koski_SA.sa.sa_koski_henkilo AS henk ON oo.oppija_oid = henk.oppija_oid
	  WHERE ((ps.suorituksen_tyyppi IN ('ibtutkinto', 'preiboppimaara', 'lukionoppiaineenoppimaara', 
										'lukionoppimaara', 'diatutkintovaihe', 'luva', 'internationalschooldiplomavuosiluokka')
				OR
			(ps.suorituksen_tyyppi = 'internationalschoolmypvuosiluokka' AND ps.koulutusmoduuli_koodiarvo IN ('10', '11', '12'))))
	  AND ooa.tila = 'lasna'
	  AND YEAR(oo.alkamispaiva) >= 2018
	  ) q1
	) q2
WHERE rnk = 1


GO

USE [ANTERO]