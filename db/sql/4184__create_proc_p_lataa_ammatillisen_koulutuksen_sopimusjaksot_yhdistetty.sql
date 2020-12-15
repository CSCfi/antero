USE [Koski_SA]
GO

DROP PROCEDURE IF EXISTS [sa].[p_lataa_ammatillisen_koulutuksen_sopimusjaksot_yhdistetty]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_ammatillisen_koulutuksen_sopimusjaksot_yhdistetty]    Script Date: 14.12.2020 14:12:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE PROCEDURE [sa].[p_lataa_ammatillisen_koulutuksen_sopimusjaksot_yhdistetty] AS

DROP TABLE IF EXISTS [Koski_SA].[sa].[sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu_jarjestykset]
DROP TABLE IF EXISTS [Koski_SA].[sa].[sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu_yhdistetty]

SELECT [id]
      ,[opiskeluoikeus_oid]
      ,[alku]
      ,[loppu]
      ,[sopimusmuoto]
      ,[ytunnus]
      ,[sijainti]
      ,[paivat]
      ,[paivat_tarkastettu]
	,sopimusten_lkm_opiskeluoikeudessa = COUNT(*) OVER (PARTITION BY opiskeluoikeus_oid)
	,sopimusten_lkm_opiskeluoikeus_yritys = COUNT(*) OVER (PARTITION BY opiskeluoikeus_oid, ytunnus)
	,sopimuksen_jarjestys = RANK() OVER (PARTITION BY opiskeluoikeus_oid ORDER BY alku, loppu, sopimusmuoto, ytunnus)
	,sopimuksen_jarjestys_yritys = RANK() OVER (PARTITION BY opiskeluoikeus_oid, ytunnus ORDER BY alku, loppu, sopimusmuoto)
  INTO [Koski_SA].[sa].[sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu_jarjestykset]
  FROM [Koski_SA].[sa].[sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu]


SELECT DISTINCT t.[id]
      ,t.[opiskeluoikeus_oid]
      ,t.[alku]
      ,t.[loppu]
      ,t.[sopimusmuoto]
      ,t.[ytunnus]
      ,t.[sijainti]
      ,t.[paivat]
      ,t.[paivat_tarkastettu]
	  ,CASE 
		WHEN t.sopimuksen_jarjestys = 1 THEN 1
		ELSE 0 END
		AS ensimmainen_sopimus
	  ,CASE 
		WHEN t.sopimuksen_jarjestys_yritys = 1 THEN 1
		ELSE 0 END
		AS ensimmainen_sopimus_yritys
	  ,CASE 
		WHEN t.sopimusten_lkm_opiskeluoikeudessa > 1 THEN 1
		ELSE 0 END
		AS vahintaan_kaksi_sopimusta
	  ,CASE 
		WHEN t.sopimusten_lkm_opiskeluoikeus_yritys > 1 THEN 1
		ELSE 0 END
		AS vahintaan_kaksi_sopimusta_yritys 
      ,t.[sopimusten_lkm_opiskeluoikeudessa]
      ,t.[sopimusten_lkm_opiskeluoikeus_yritys]
      ,t.[sopimuksen_jarjestys]
      ,t.[sopimuksen_jarjestys_yritys]
	  ,t2.sopimusmuoto AS edellinen_sopimus
	  ,t3.sopimusmuoto AS edellinen_sopimus_sama_yritys
	  ,CASE
		WHEN t2.sopimusmuoto = 'Koulutussopimus' THEN 1
		ELSE 0 END
		AS edellinen_sopimus_koso
	  ,CASE
		WHEN t2.sopimusmuoto = 'Oppisopimus' THEN 1
		ELSE 0 END
		AS edellinen_sopimus_opso
	  ,CASE
		WHEN t3.sopimusmuoto = 'Koulutussopimus' THEN 1
		ELSE 0 END
		AS edellinen_sopimus_koso_yritys
	  ,CASE
		WHEN t3.sopimusmuoto = 'Oppisopimus' THEN 1
		ELSE 0 END
		AS edellinen_sopimus_opso_yritys
  INTO [Koski_SA].[sa].[sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu_yhdistetty]
  FROM [Koski_SA].[sa].[sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu_jarjestykset] t
  LEFT JOIN [Koski_SA].[sa].[sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu_jarjestykset] t2
	ON t.opiskeluoikeus_oid = t2.opiskeluoikeus_oid
	AND t.sopimuksen_jarjestys = t2.sopimuksen_jarjestys + 1
  LEFT JOIN [Koski_SA].[sa].[sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu_jarjestykset] t3
	ON t.opiskeluoikeus_oid = t3.opiskeluoikeus_oid
	AND t.sopimuksen_jarjestys_yritys = t3.sopimuksen_jarjestys_yritys + 1
	AND t.ytunnus = t3.ytunnus
ORDER BY t.opiskeluoikeus_oid, t.alku



DROP TABLE IF EXISTS [Koski_SA].[sa].[sa_ammatillisen_koulutuksen_sopimusjaksot_siivottu_jarjestykset]




GO

USE ANTERO
