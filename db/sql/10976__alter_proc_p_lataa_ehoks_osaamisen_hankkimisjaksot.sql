USE [ANTERO]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_ehoks_osaamisen_hankkimisjaksot]    Script Date: 30.7.2025 11.30.00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [sa].[p_lataa_ehoks_osaamisen_hankkimisjaksot] AS


DROP TABLE IF EXISTS [sa].[sa_ehoks_osaamisen_hankkimisjaksot]

SELECT distinct
	id = ehoks_id
	,h.opiskeluoikeus_oid
	,coalesce(h2.master_oid,h.oppija_oid) as master_oid
	,ca2.alku
	,ca2.loppu
	,sopimusmuoto = osaamisen_hankkimistapa_koodi
	,tutkinnon_osa_koodi
	,ytunnus = tyopaikan_ytunnus
	,paivat = datediff(day,ca2.alku,ca2.loppu) + 1
	--,sopimusten_lkm_opiskeluoikeudessa = COUNT(*) OVER (PARTITION BY opiskeluoikeus_oid)
	,sopimusten_lkm_opiskeluoikeus_yritys = COUNT(*) OVER (PARTITION BY h.opiskeluoikeus_oid, tyopaikan_ytunnus)
	--,sopimuksen_jarjestys = DENSE_RANK() OVER (PARTITION BY opiskeluoikeus_oid ORDER BY alku, loppu, osaamisen_hankkimistapa_koodi, tyopaikan_ytunnus)
	--,sopimuksen_jarjestys_yritys = RANK() OVER (PARTITION BY opiskeluoikeus_oid, tyopaikan_ytunnus ORDER BY alku, loppu, osaamisen_hankkimistapa_koodi)
INTO #temp_ehoks
FROM [sa].[sa_ehoks_hato] h
LEFT JOIN Koski_SA.sa.sa_koski_henkilo h2 on h2.oppija_oid = h.oppija_oid
LEFT JOIN Koski_SA.sa.sa_koski_opiskeluoikeus oo on oo.opiskeluoikeus_oid=h.opiskeluoikeus_oid
LEFT JOIN Koski_SA.sa.sa_amm_paatason_suoritus ps on ps.opiskeluoikeus_oid=oo.opiskeluoikeus_oid
CROSS APPLY (
	SELECT 
		alkamispaiva = case when ps.suorituksen_alkamispaiva < oo.alkamispaiva then ps.suorituksen_alkamispaiva else oo.alkamispaiva end
		,paattymispaiva = coalesce(oo.paattymispaiva, ps.vahvistus_paiva)
) ca1
CROSS APPLY (
	SELECT 
		alku = case when h.alku < ca1.alkamispaiva then ca1.alkamispaiva else h.alku end
		,loppu = case when coalesce(h.loppu,'9999-12-31') > ca1.paattymispaiva then ca1.paattymispaiva else h.loppu end
) ca2
WHERE 1=1
and osaamisen_hankkimistapa_koodi is not null
and ca2.alku is not null and ca2.loppu is not null
and ca2.loppu between ca2.alku and getdate()
and ps.rnk=1


SELECT distinct
	t.[id]
	,t.[opiskeluoikeus_oid]
	,t.[master_oid]
	,t.[alku]
	,t.[loppu]
	,t.[sopimusmuoto]
	,t.tutkinnon_osa_koodi
	,t.[ytunnus]
	,paivat_kaikki = t.paivat
	,paivat_tyopaikka  = case when t.sopimusmuoto in ('koulutussopimus','oppisopimus') then t.paivat else 0 end

	--,ensimmainen_sopimus = 
	--	CASE 
	--		WHEN t.sopimuksen_jarjestys = 1 THEN 1
	--		ELSE 0 
	--	END 
	--,ensimmainen_sopimus_yritys = 
	--	CASE 
	--		WHEN t.sopimuksen_jarjestys_yritys = 1 THEN 1
	--		ELSE 0 
	--	END
	--,vahintaan_kaksi_sopimusta = 
	--	CASE 
	--		WHEN t.sopimusten_lkm_opiskeluoikeudessa > 1 THEN 1
	--		ELSE 0 
	--	END
	--,vahintaan_kaksi_sopimusta_yritys = 
	--	CASE 
	--		WHEN t.sopimusten_lkm_opiskeluoikeus_yritys > 1 THEN 1
	--		ELSE 0 
	--	END 
	--,t.[sopimusten_lkm_opiskeluoikeudessa]
	,t.[sopimusten_lkm_opiskeluoikeus_yritys]
	--,t.[sopimuksen_jarjestys]
	--,t.[sopimuksen_jarjestys_yritys]
	--,t2.sopimusmuoto AS edellinen_sopimus
	--,t3.sopimusmuoto AS edellinen_sopimus_sama_yritys
	--,edellinen_sopimus_koso = 
	--	CASE
	--		WHEN t2.sopimusmuoto = 'Koulutussopimus' THEN 1
	--		ELSE 0 
	--	END 
	--,edellinen_sopimus_opso = 
	--	CASE
	--		WHEN t2.sopimusmuoto = 'Oppisopimus' THEN 1
	--		ELSE 0 
	--	END 
	--,edellinen_sopimus_koso_yritys = 
	--	CASE
	--		WHEN t3.sopimusmuoto = 'Koulutussopimus' THEN 1
	--		ELSE 0 
	--	END 
	--,edellinen_sopimus_opso_yritys = 
	--	CASE
	--		WHEN t3.sopimusmuoto = 'Oppisopimus' THEN 1
	--		ELSE 0 
	--	END

INTO [sa].[sa_ehoks_osaamisen_hankkimisjaksot]

FROM #temp_ehoks t
--LEFT JOIN #temp_ehoks t2 ON t.opiskeluoikeus_oid = t2.opiskeluoikeus_oid AND t.sopimuksen_jarjestys = t2.sopimuksen_jarjestys + 1
--LEFT JOIN #temp_ehoks t3 ON t.opiskeluoikeus_oid = t3.opiskeluoikeus_oid AND t.sopimuksen_jarjestys_yritys = t3.sopimuksen_jarjestys_yritys + 1 AND t.ytunnus = t3.ytunnus

ORDER BY t.opiskeluoikeus_oid, t.alku

DROP TABLE IF EXISTS #temp_ehoks




GO


