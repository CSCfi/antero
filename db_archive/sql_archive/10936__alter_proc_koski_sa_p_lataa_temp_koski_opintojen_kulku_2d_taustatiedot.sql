USE [Koski_SA]
GO

/****** Object:  StoredProcedure [sa].[p_lataa_temp_koski_opintojen_kulku_2d_taustatiedot]    Script Date: 30.7.2025 8.26.12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [sa].[p_lataa_temp_koski_opintojen_kulku_2d_taustatiedot] AS

DROP TABLE IF EXISTS sa.temp_koski_perusaste_keskiarvot 
DROP TABLE IF EXISTS sa.temp_koski_opintojen_kulku_2d_taustatiedot

/* Keskiarvojen laskenta */

SELECT * 
INTO sa.temp_koski_perusaste_keskiarvot 
FROM (
	SELECT 
		f.master_oid, 
		f.perusopetuksen_suoritusvuosi, 
		f.keskiarvo, 
		f2.keskiarvo_lukuaineet 
	FROM (
		SELECT 
			f.master_oid
			,min(f.perusopetuksen_suoritusvuosi) as 'perusopetuksen_suoritusvuosi' --vain muutamalla ja pääasiassa vain yksittäisiä korotuksia
			,cast(avg(cast(f.arvosana as decimal(10,5))) as decimal(10,5)) as 'keskiarvo'
		FROM (
			SELECT 
				d.master_oid, 
				f.koulutusmoduuli_koodiarvo
				,min(year(d2.vahvistus_paiva)) as 'perusopetuksen_suoritusvuosi'
				,max(f.arviointi_arvosana_koodiarvo) as 'arvosana'
			FROM [Koski_SA].[sa].[sa_koski_osasuoritus] f
			left join [Koski_SA].[sa].[sa_koski_opiskeluoikeus] d on d.opiskeluoikeus_oid = f.opiskeluoikeus_oid
			left join [Koski_SA].[sa].[sa_koski_paatason_suoritus] d2 on d2.paatason_suoritus_id = f.paatason_suoritus_id
			where f.koulutusmoduuli_koodisto = 'koskioppiaineetyleissivistava' 
			and f.arviointi_arvosana_koodiarvo not in ('S', 'H', 'O') 
			and f.arviointi_arvosana_koodiarvo is not null 
			and d2.vahvistus_paiva is not null 
			and d2.suorituksen_tyyppi = 'perusopetuksenoppimaara'
			and f.koulutusmoduuli_pakollinen = 1
			group by d.master_oid, f.koulutusmoduuli_koodiarvo
		) f
		group by f.master_oid
	) f
	left join (
		SELECT 
			f.master_oid
			,cast(avg(cast(f.arvosana as decimal(10,5))) as decimal(10,5)) as 'keskiarvo_lukuaineet'
		FROM (
			SELECT 
				d.master_oid, 
				f.koulutusmoduuli_koodiarvo
				,max(f.arviointi_arvosana_koodiarvo) as 'arvosana' 
			FROM [Koski_SA].[sa].[sa_koski_osasuoritus] f
			left join [Koski_SA].[sa].[sa_koski_opiskeluoikeus] d on d.opiskeluoikeus_oid = f.opiskeluoikeus_oid
			left join [Koski_SA].[sa].[sa_koski_paatason_suoritus] d2 on d2.paatason_suoritus_id = f.paatason_suoritus_id
			where f.koulutusmoduuli_koodisto = 'koskioppiaineetyleissivistava' 
			and f.arviointi_arvosana_koodiarvo not in ('S', 'H', 'O') 
			and f.arviointi_arvosana_koodiarvo is not null 
			and f.koulutusmoduuli_koodiarvo not in ('MU', 'KS', 'LI', 'KO', 'KU') 
			and d2.vahvistus_paiva is not null 
			and d2.suorituksen_tyyppi = 'perusopetuksenoppimaara' 
			and f.koulutusmoduuli_pakollinen = 1
			group by d.master_oid, f.koulutusmoduuli_koodiarvo
		) f
		group by f.master_oid
	) f2 on f2.master_oid = f.master_oid
) q


/* Taustatiedot */

SELECT DISTINCT 
	k1.koulutus_kytkin
	,k1.kohortti_vp
	,k1.master_oid
	/*
	,perusopetuksen_suoritusvuosi_keskiarvoluokka = year(oa_rahoitus.perusopetuksen_paattymispaiva)
	,lahde_keskiarvoluokka = oa_rahoitus.keskiarvo_lahde
	,keskiarvoluokka = oa_rahoitus.keskiarvoluokka
	,yksilollistaminen_keskiarvoluokka = oa_rahoitus.yksilollistaminen
	*/
	,ka.perusopetuksen_suoritusvuosi
	,keskiarvo_kategoria =
		CASE 
			WHEN ka.keskiarvo IS NULL THEN 99
			WHEN ka.keskiarvo >= 9.5 THEN 1
			WHEN ka.keskiarvo < 9.5 AND ka.keskiarvo >= 9.0 THEN 2
			WHEN ka.keskiarvo < 9.0 AND ka.keskiarvo >= 8.5 THEN 3
			WHEN ka.keskiarvo < 8.5 AND ka.keskiarvo >= 8.0 THEN 4
			WHEN ka.keskiarvo < 8.0 AND ka.keskiarvo >= 7.5 THEN 5
			WHEN ka.keskiarvo < 7.5 AND ka.keskiarvo >= 7.0 THEN 6
			WHEN ka.keskiarvo < 7.0 AND ka.keskiarvo >= 6.5 THEN 7
			WHEN ka.keskiarvo < 6.5 AND ka.keskiarvo >= 6.0 THEN 8
			WHEN ka.keskiarvo < 6.0 AND ka.keskiarvo >= 5.5 THEN 9
			WHEN ka.keskiarvo < 5.5 AND ka.keskiarvo >= 5.0 THEN 10
			WHEN ka.keskiarvo < 5.0 AND ka.keskiarvo >= 4.5 THEN 11
			WHEN ka.keskiarvo < 4.5 AND ka.keskiarvo >= 4.0 THEN 12
			ELSE 99
		END
	,keskiarvo_lukuaineet_kategoria =
		CASE 
			WHEN ka.keskiarvo_lukuaineet IS NULL THEN 99
			WHEN ka.keskiarvo_lukuaineet >= 9.5 THEN 1
			WHEN ka.keskiarvo_lukuaineet < 9.5 AND ka.keskiarvo_lukuaineet >= 9.0 THEN 2
			WHEN ka.keskiarvo_lukuaineet < 9.0 AND ka.keskiarvo_lukuaineet >= 8.5 THEN 3
			WHEN ka.keskiarvo_lukuaineet < 8.5 AND ka.keskiarvo_lukuaineet >= 8.0 THEN 4
			WHEN ka.keskiarvo_lukuaineet < 8.0 AND ka.keskiarvo_lukuaineet >= 7.5 THEN 5
			WHEN ka.keskiarvo_lukuaineet < 7.5 AND ka.keskiarvo_lukuaineet >= 7.0 THEN 6
			WHEN ka.keskiarvo_lukuaineet < 7.0 AND ka.keskiarvo_lukuaineet >= 6.5 THEN 7
			WHEN ka.keskiarvo_lukuaineet < 6.5 AND ka.keskiarvo_lukuaineet >= 6.0 THEN 8
			WHEN ka.keskiarvo_lukuaineet < 6.0 AND ka.keskiarvo_lukuaineet >= 5.5 THEN 9
			WHEN ka.keskiarvo_lukuaineet < 5.5 AND ka.keskiarvo_lukuaineet >= 5.0 THEN 10
			WHEN ka.keskiarvo_lukuaineet < 5.0 AND ka.keskiarvo_lukuaineet >= 4.5 THEN 11
			WHEN ka.keskiarvo_lukuaineet < 4.5 AND ka.keskiarvo_lukuaineet >= 4.0 THEN 12
			ELSE 99
		END
	,keskiarvo_kvintiili_koodi = 
		CASE
			WHEN ka.keskiarvo IS NULL THEN 9
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, koulutus_kytkin, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.8 THEN 1
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, koulutus_kytkin, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.6 THEN 2
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, koulutus_kytkin, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.4 THEN 3
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, koulutus_kytkin, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.2 THEN 4
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, koulutus_kytkin, CASE WHEN ka.keskiarvo IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo) >= 0.0 THEN 5
			ELSE 9 
		END
	,keskiarvo_lukuaineet_kvintiili_koodi = 
		CASE
			WHEN ka.keskiarvo_lukuaineet IS NULL THEN 9
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, koulutus_kytkin, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.8 THEN 1
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, koulutus_kytkin, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.6 THEN 2
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, koulutus_kytkin, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.4 THEN 3
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, koulutus_kytkin, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.2 THEN 4
			WHEN PERCENT_RANK() OVER (PARTITION BY k1.kohortti_vp, koulutus_kytkin, CASE WHEN ka.keskiarvo_lukuaineet IS NULL THEN 1 ELSE 0 END ORDER BY ka.keskiarvo_lukuaineet) >= 0.0 THEN 5
			ELSE 9 
		END

INTO sa.temp_koski_opintojen_kulku_2d_taustatiedot

FROM sa.temp_opintojen_kulku_tarkastelupaivat_1 k1
LEFT JOIN sa.temp_koski_perusaste_keskiarvot ka ON ka.master_oid = k1.master_oid
WHERE ka.master_oid is not null
/*
CROSS APPLY (
	SELECT TOP 1
		perusopetuksen_paattymispaiva
		,keskiarvo_lahde
		,keskiarvoluokka
		,yksilollistaminen
	FROM sa.perusopetuksen_keskiarvot
	WHERE master_oid = k1.master_oid
	ORDER BY coalesce(nullif(keskiarvo_lahde, 'KOSKI'), 'ööö') DESC
) oa_rahoitus
*/

GO


