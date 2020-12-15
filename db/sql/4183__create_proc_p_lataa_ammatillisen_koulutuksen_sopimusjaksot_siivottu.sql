USE [Koski_SA]
GO

DROP PROCEDURE IF EXISTS [sa].[p_lataa_ammatillisen_koulutuksen_sopimusjaksot_siivottu]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_ammatillisen_koulutuksen_sopimusjaksot_siivottu]    Script Date: 14.12.2020 16:42:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [sa].[p_lataa_ammatillisen_koulutuksen_sopimusjaksot_siivottu] AS

DROP TABLE IF EXISTS Koski_SA.sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu_valitaulu
DROP TABLE IF EXISTS Koski_SA.sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu

SELECT DISTINCT id = ROW_NUMBER() over (order by opiskeluoikeus_oid, sopimusmuoto, alku, loppu, ytunnus, sijainti)
	,opiskeluoikeus_oid
	,sopimusmuoto
	,alku
	,loppu
	,ytunnus
	,sijainti
INTO Koski_SA.sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu_valitaulu

FROM(
SELECT DISTINCT * 
	   ,rnk_ytunnus =
	    RANK() OVER (PARTITION BY opiskeluoikeus_oid, sopimusmuoto, alku, loppu, ytunnus ORDER BY sijainti DESC)
	   ,rnk_poimintatapa =
		RANK() OVER (PARTITION BY opiskeluoikeus_oid, sopimusmuoto, alku, loppu ORDER BY ytunnus DESC)
	FROM (
	SELECT DISTINCT [opiskeluoikeus_oid]
		  ,sopimusmuoto =
				CASE 
					WHEN sopimusmuoto = 'Koulutuksen järjestäminen oppisopimuskoulutuksena' THEN 'Oppisopimus'
					ELSE sopimusmuoto
					END
		  ,[alku]
		  ,[loppu]
		  ,[sijainti]
		  ,[ytunnus]
	  FROM [Koski_SA].[sa].[sa_koski_ammatillisen_koulutuksen_sopimusjaksot]
	  WHERE sopimusmuoto NOT IN ('Oppilaitosmuotoinen koulutus', 'Koulutuksen järjestäminen oppilaitosmuotoisena')) q) q2
WHERE NOT(ytunnus IS NULL AND rnk_poimintatapa != 1)
	AND NOT(rnk_ytunnus != 1 AND sijainti IS NULL)



/****** Script for SelectTopNRows command from SSMS  ******/
SELECT DISTINCT
	id,
	opiskeluoikeus_oid,
	alku = sj_alku,
	loppu = sj_loppu,
	sopimusmuoto,
	ytunnus,
	sijainti,
	paivat,
	paivat_tarkastettu = SUM(paivat_tarkastettu)
INTO [Koski_SA].[sa].[sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu]
FROM(
SELECT
	id,
	opiskeluoikeus_oid,
	sj_alku,
	sj_loppu,
	sopimusmuoto,
	ytunnus,
	sijainti,
	paivat = DATEDIFF(D, sj_alku, sj_loppu),
	paivat_tarkastettu = DATEDIFF(D, sop_alku, sop_loppu)
FROM(
SELECT sj.[opiskeluoikeus_oid]
      ,[sopimusmuoto]
	  ,id
      ,sj_alku = sj.[alku] 
      ,sj_loppu = sj.[loppu]
	  ,ooa_alku = ooa.alku
	  ,ooa_loppu = ooa.loppu
	  ,sop_alku =
		CASE 
			WHEN ooa.alku > sj.alku THEN ooa.alku
			WHEN ooa.alku <= sj.alku THEN sj.alku
			ELSE NULL END
	  ,sop_loppu =
		CASE
			WHEN ooa.loppu > sj.loppu THEN sj.loppu
			WHEN ooa.loppu <= sj.loppu THEN ooa.loppu
			ELSE NULL END
      ,[ytunnus]
      ,[sijainti]
  FROM [Koski_SA].[sa].[sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu_valitaulu] sj
  LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo ON oo.opiskeluoikeus_oid = sj.opiskeluoikeus_oid
  LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa 
	ON sj.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
		AND ooa.alku <= sj.loppu
		AND ooa.loppu >= sj.alku
	WHERE ooa.tila IN ('lasna', 'loma', 'valmistunut')) q) q2
GROUP BY
	id,
	opiskeluoikeus_oid,
	sj_alku,
	sj_loppu,
	sopimusmuoto,
	ytunnus,
	sijainti,
	paivat


DROP TABLE IF EXISTS Koski_SA.sa.sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu_valitaulu



GO

USE ANTERO
