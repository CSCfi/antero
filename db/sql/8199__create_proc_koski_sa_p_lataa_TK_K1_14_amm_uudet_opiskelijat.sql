USE [Koski_SA]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_TK_K1_14_amm_uudet_opiskelijat]    Script Date: 12.10.2023 14:44:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP PROCEDURE IF EXISTS [dbo].[p_lataa_TK_K1_14_amm_uudet_opiskelijat]



--Proseduuri, joka poimii yhden vuoden ammatillisen koulutuksen uusien opiskelijoiden henkilötunnistetiedot. Lopputulos toimitetaan TK:een.

CREATE PROCEDURE [dbo].[p_lataa_TK_K1_14_amm_uudet_opiskelijat] @vuosi int = 2018 AS

DECLARE @vuosi2 as int = @vuosi
DECLARE @taulu_rahoitus TABLE (koodi int)

INSERT INTO @taulu_rahoitus 
SELECT distinct koodi FROM ANTERO.dw.d_opintojenrahoitus WHERE sisaltyy_okm_perusrahoitus = 1


DROP TABLE IF EXISTS [dbo].[TK_K1_14_amm_uudet_opiskelijat]
--DELETE FROM [dbo].[TK_K1_14_amm_uudet_opiskelijat] WHERE vuosi=@vuosi2


SELECT 
	opiskeluoikeus_oid,
	1 AS boo_suoraannayttoon
INTO #amm_uudetopiskelijat_1_suoraannayttoon
FROM sa.sa_koski_opiskeluoikeus_aikajakso
GROUP BY opiskeluoikeus_oid
HAVING SUM(osa_aikaisuus) = 0 


SELECT distinct
	opiskeluoikeus_oid,
	1 AS boo_pelkkaakeskeytysta
INTO #amm_uudetopiskelijat_1_keskeytykset
FROM (
	SELECT 
		opiskeluoikeus_oid,
		kytkin = case when tila IN ('lasna', 'loma', 'valmistunut') then 1 else 0 end
	FROM sa.sa_koski_opiskeluoikeus_aikajakso
) AS q
GROUP BY opiskeluoikeus_oid
HAVING SUM(kytkin) = 0


SELECT distinct
	master_oid,
	vuosi
INTO #amm_uudetopiskelijat_2_etusuodatus
FROM (
	SELECT
		vuosi
		,kuukausi
		,paattymispaiva 
		,master_oid
		,organisaatio_koodi
		,tila
		,organisaatio_fi
		,suorituksen_tyyppi
		,suorituksen_alkamispaiva
		,lasna_loma
		,rnk = rank() over (partition by master_oid, organisaatio_koodi, vuosi order by alkamispaiva, suorituksen_tyyppi)
	FROM (
		SELECT 
			-- vuosi = year(alkamispaiva) 
			--,kuukausi = month(alkamispaiva)
			--,alkamispaiva
			paattymispaiva
			,master_oid = coalesce(h.master_oid, h.oppija_oid)
			,CASE 
				--WHEN o.oid_amos_spl IS NULL THEN o.ytunnus_avain
				WHEN o.voimaan_alkaen IS NULL THEN o.ytunnus_amos_spl
				WHEN YEAR(o.voimaan_alkaen) > YEAR(case when ps.suorituksen_alkamispaiva < oo.alkamispaiva then ps.suorituksen_alkamispaiva else oo.alkamispaiva end) THEN o.ytunnus_avain
				ELSE o.ytunnus_amos_spl 
			END
				AS organisaatio_koodi
			,CASE 
				WHEN o.voimaan_alkaen IS NULL THEN o.nimi_amos_spl
				WHEN YEAR(o.voimaan_alkaen) > YEAR(case when ps.suorituksen_alkamispaiva < oo.alkamispaiva then ps.suorituksen_alkamispaiva else oo.alkamispaiva end) THEN o.nimi_ennen_fuusiota
				ELSE o.nimi_amos_spl 
			END
				AS organisaatio_fi
			,ps.suorituksen_tyyppi
			,ps.suorituksen_alkamispaiva
			,CASE 
				WHEN ps.suorituksen_alkamispaiva IS NULL THEN YEAR(oo.alkamispaiva)
				WHEN (oo.alkamispaiva > ps.suorituksen_alkamispaiva) THEN YEAR(ps.suorituksen_alkamispaiva)
				ELSE YEAR(oo.alkamispaiva) 
			END
				AS vuosi
			,CASE 
				WHEN ps.suorituksen_alkamispaiva IS NULL THEN MONTH(oo.alkamispaiva)
				WHEN (oo.alkamispaiva > ps.suorituksen_alkamispaiva) THEN MONTH(ps.suorituksen_alkamispaiva)
				ELSE MONTH(oo.alkamispaiva) 
			END
				AS kuukausi
			,CASE 
				WHEN ps.suorituksen_alkamispaiva IS NULL THEN oo.alkamispaiva
				WHEN (oo.alkamispaiva > ps.suorituksen_alkamispaiva) THEN ps.suorituksen_alkamispaiva
				ELSE oo.alkamispaiva 
			END
				AS alkamispaiva
			,ooa.tila
			,ooa.osa_aikaisuus
			,lasna_loma
		FROM [sa].[sa_koski_opiskeluoikeus] oo
		LEFT JOIN #amm_uudetopiskelijat_1_suoraannayttoon sn ON sn.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		JOIN sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid
		JOIN [ANTERO].[dw].[d_amos_spl_jarjestaja_linkki] o on o.oid_avain = oo.koulutustoimija_oid
		JOIN sa.sa_koski_paatason_suoritus ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		LEFT JOIN sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid AND (oo.alkamispaiva between ooa.alku and ooa.loppu  OR (year(alkamispaiva)=year(alku) and month(alkamispaiva)=month(alku)))
		LEFT JOIN ANTERO.dw.d_opintojenrahoitus ora on ora.koodi = ooa.opintojen_rahoitus
		LEFT JOIN #amm_uudetopiskelijat_1_keskeytykset kesk ON kesk.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		LEFT JOIN (
			SELECT distinct
				opiskeluoikeus_oid,
				lasna_loma = 1
			FROM sa.sa_koski_opiskeluoikeus_aikajakso
			WHERE tila in ('lasna', 'loma') AND YEAR(tila_alkanut) = @vuosi2
		) lasna ON lasna.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid

		WHERE (oo.koulutusmuoto = 'ammatillinenkoulutus' or oo.tuva_jarjestamislupa = 'ammatillinen')
		AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL
		AND ooa.tila in ('lasna', 'loma', 'valiaikaisestikeskeytynyt', 'valmistunut')
		AND ps.suorituksen_tyyppi NOT IN (
			'muuammatillinenkoulutus'
			,'nayttotutkintoonvalmistavakoulutus'
			,'tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus'
		)	
		AND ora.koodi IN (select * from @taulu_rahoitus)
		AND sn.boo_suoraannayttoon IS NULL 
		AND kesk.boo_pelkkaakeskeytysta IS NULL
	) q1
) q2

WHERE rnk = 1
AND vuosi = @vuosi2
AND (
	(lasna_loma = 1 AND tila = 'valiaikaisestikeskeytynyt')
	OR
	tila IN ('lasna', 'loma', 'valmistunut')
)


/*
Tarkista etusuodatinta vasten kaikki hetut, joilla on ennen vuotta alkanut opiskeluoikeus, joka on ollut voimassa kyseisenä vuonna
*/
SELECT distinct
	q1.master_oid,
	q1.organisaatio_koodi,
	q1.organisaatio_fi
INTO #amm_uudetopiskelijat_3_voimassa
FROM (
	SELECT 
		master_oid = coalesce(h.master_oid, h.oppija_oid)
		,CASE 
			--WHEN o.oid_amos_spl IS NULL THEN o.ytunnus_avain
			WHEN o.voimaan_alkaen IS NULL THEN o.ytunnus_amos_spl
			WHEN YEAR(o.voimaan_alkaen) > @vuosi2 THEN o.ytunnus_avain
			ELSE o.ytunnus_amos_spl 
		END
			AS organisaatio_koodi
		,CASE 
			WHEN o.voimaan_alkaen IS NULL THEN o.nimi_amos_spl
			WHEN YEAR(o.voimaan_alkaen) > @vuosi2 THEN o.nimi_ennen_fuusiota
			ELSE o.nimi_amos_spl 
		END
			AS organisaatio_fi
		,oo.opiskeluoikeus_oid
	FROM [sa].[sa_koski_opiskeluoikeus] oo 
	JOIN sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid
	JOIN [ANTERO].[dw].[d_amos_spl_jarjestaja_linkki] o on o.oid_avain = oo.koulutustoimija_oid
	JOIN sa.sa_koski_paatason_suoritus ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	LEFT JOIN sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid AND (oo.alkamispaiva between ooa.alku and ooa.loppu  OR (year(alkamispaiva)=year(alku) and month(alkamispaiva)=month(alku)))
	LEFT JOIN ANTERO.dw.d_opintojenrahoitus ora on ora.koodi = ooa.opintojen_rahoitus
	LEFT JOIN #amm_uudetopiskelijat_1_suoraannayttoon sn ON oo.opiskeluoikeus_oid = sn.opiskeluoikeus_oid
	LEFT JOIN #amm_uudetopiskelijat_1_keskeytykset kesk ON kesk.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	LEFT JOIN (
		SELECT distinct
			opiskeluoikeus_oid,
			1 AS lasnaloma
		FROM sa.sa_koski_opiskeluoikeus_aikajakso
		WHERE tila in ('lasna', 'loma')
	) lasnaloma ON lasnaloma.opiskeluoikeus_oid = oo.opiskeluoikeus_oid

	WHERE (oo.koulutusmuoto = 'ammatillinenkoulutus' or oo.tuva_jarjestamislupa = 'ammatillinen')
	AND YEAR(case when ps.suorituksen_alkamispaiva < oo.alkamispaiva then ps.suorituksen_alkamispaiva else oo.alkamispaiva end) < @vuosi2
	AND (YEAR(paattymispaiva) >= @vuosi2 OR paattymispaiva IS NULL)
	AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL
	AND ps.suorituksen_tyyppi NOT IN (
		'muuammatillinenkoulutus'
		,'nayttotutkintoonvalmistavakoulutus'
		,'tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus'
	)	
	AND ora.koodi IN (select * from @taulu_rahoitus)
	AND sn.boo_suoraannayttoon IS NULL
	AND kesk.boo_pelkkaakeskeytysta IS NULL
	AND lasnaloma = 1
) q1


SELECT distinct
	q3.vuosi
	,q3.kuukausi
	,q3.master_oid
	,q3.organisaatio_koodi
	,q3.organisaatio_fi
	,q3.suorituksen_tyyppi 
INTO #amm_uudetopiskelijat_4
FROM (
	SELECT distinct
		vuosi
		,kuukausi
		,master_oid
		,organisaatio_koodi
		,organisaatio_fi
		,suorituksen_tyyppi
	FROM (
		SELECT
			vuosi
			,kuukausi
			,paattymispaiva 
			,master_oid
			,organisaatio_koodi
			,organisaatio_fi
			,suorituksen_tyyppi
			,suorituksen_alkamispaiva
			,tila
			,osa_aikaisuus
			,lasna_loma
			,rnk = rank() over (partition by master_oid, organisaatio_koodi, vuosi order by alkamispaiva, suorituksen_tyyppi) 
		FROM (
			SELECT 
				-- vuosi = year(alkamispaiva) 
				--,kuukausi = month(alkamispaiva)
				--,alkamispaiva
				paattymispaiva
				,master_oid = coalesce(h.master_oid, h.oppija_oid)
				,CASE 
					--WHEN o.oid_amos_spl IS NULL THEN o.ytunnus_avain
					WHEN o.voimaan_alkaen IS NULL THEN o.ytunnus_amos_spl
					WHEN YEAR(o.voimaan_alkaen) > YEAR(case when ps.suorituksen_alkamispaiva < oo.alkamispaiva then ps.suorituksen_alkamispaiva else oo.alkamispaiva end) THEN o.ytunnus_avain
					ELSE o.ytunnus_amos_spl 
				END
					AS organisaatio_koodi
				,CASE 
					WHEN o.voimaan_alkaen IS NULL THEN o.nimi_amos_spl
					WHEN YEAR(o.voimaan_alkaen) > YEAR(case when ps.suorituksen_alkamispaiva < oo.alkamispaiva then ps.suorituksen_alkamispaiva else oo.alkamispaiva end) THEN o.nimi_ennen_fuusiota
					ELSE o.nimi_amos_spl 
				END
					AS organisaatio_fi
				,ps.suorituksen_tyyppi
				,ps.suorituksen_alkamispaiva
				,CASE 
					WHEN ps.suorituksen_alkamispaiva IS NULL THEN YEAR(oo.alkamispaiva)
					WHEN (oo.alkamispaiva > ps.suorituksen_alkamispaiva) THEN YEAR(ps.suorituksen_alkamispaiva)
					ELSE YEAR(oo.alkamispaiva) 
				END
					AS vuosi
				,CASE 
					WHEN ps.suorituksen_alkamispaiva IS NULL THEN MONTH(oo.alkamispaiva)
					WHEN (oo.alkamispaiva > ps.suorituksen_alkamispaiva) THEN MONTH(ps.suorituksen_alkamispaiva)
					ELSE MONTH(oo.alkamispaiva) 
				END
					AS kuukausi
				,CASE 
					WHEN ps.suorituksen_alkamispaiva IS NULL THEN oo.alkamispaiva
					WHEN (oo.alkamispaiva > ps.suorituksen_alkamispaiva) THEN ps.suorituksen_alkamispaiva
					ELSE oo.alkamispaiva 
				END
					AS alkamispaiva
				,ooa.tila
				,ooa.osa_aikaisuus
				,lasna_loma
			FROM [sa].[sa_koski_opiskeluoikeus] oo
			JOIN sa.sa_koski_henkilo h on h.oppija_oid = oo.oppija_oid
			JOIN [ANTERO].[dw].[d_amos_spl_jarjestaja_linkki] o on o.oid_avain = oo.koulutustoimija_oid
			JOIN sa.sa_koski_paatason_suoritus ps on ps.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
			LEFT JOIN sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid AND (oo.alkamispaiva between ooa.alku and ooa.loppu  OR (year(alkamispaiva)=year(alku) and month(alkamispaiva)=month(alku)))
			LEFT JOIN ANTERO.dw.d_opintojenrahoitus ora on ora.koodi = ooa.opintojen_rahoitus
			LEFT JOIN (
				SELECT distinct
					opiskeluoikeus_oid,
					lasna_loma = 1
				FROM sa.sa_koski_opiskeluoikeus_aikajakso
				WHERE tila in ('lasna', 'loma', 'valmistunut') AND YEAR(tila_alkanut) = @vuosi2
			) lasna ON lasna.opiskeluoikeus_oid = ooa.opiskeluoikeus_oid
			LEFT JOIN #amm_uudetopiskelijat_1_suoraannayttoon sn ON oo.opiskeluoikeus_oid = sn.opiskeluoikeus_oid
			LEFT JOIN #amm_uudetopiskelijat_1_keskeytykset kesk ON kesk.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
			WHERE (oo.koulutusmuoto = 'ammatillinenkoulutus' or oo.tuva_jarjestamislupa = 'ammatillinen')
			AND oo.sisaltyy_opiskeluoikeuteen_oid IS NULL
			AND ooa.tila in ('lasna', 'loma', 'valiaikaisestikeskeytynyt')
				
			AND ps.suorituksen_tyyppi NOT IN (
				'muuammatillinenkoulutus'
				,'nayttotutkintoonvalmistavakoulutus'
				,'tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus'
			)	
			AND ora.koodi IN (select * from @taulu_rahoitus)
			AND sn.boo_suoraannayttoon IS NULL
			AND kesk.boo_pelkkaakeskeytysta IS NULL
		) q1
	) q2

	WHERE rnk = 1
	AND vuosi = @vuosi2
	AND (
		(lasna_loma = 1 AND tila = 'valiaikaisestikeskeytynyt')
		OR
		tila IN ('lasna', 'loma', 'valmistunut')
	)
) q3


--INSERT INTO dbo.TK_K1_14_amm_uudet_opiskelijat
SELECT distinct
	q4.vuosi,
	q4.kuukausi,
	master_oppija = q4.master_oid,
	q4.organisaatio_koodi,
	q4.organisaatio_fi,
	q4.suorituksen_tyyppi
INTO dbo.TK_K1_14_amm_uudet_opiskelijat
FROM (
	SELECT distinct
		q3.vuosi,
		q3.kuukausi,
		q3.master_oid,
		q3.organisaatio_koodi,
		q3.organisaatio_fi,
		q3.suorituksen_tyyppi,
		kytkin =
			CASE
				WHEN q3.vuosi = @vuosi2 AND (q.master_oid IS NULL OR q3.organisaatio_koodi <> q.organisaatio_koodi) THEN 0
				WHEN q3.master_oid = q.master_oid AND q3.vuosi = @vuosi2 AND (q3.organisaatio_koodi = q.organisaatio_koodi OR q3.organisaatio_fi = q.organisaatio_fi) THEN 1
				ELSE 0 
			END
	FROM #amm_uudetopiskelijat_4 q3
	LEFT JOIN #amm_uudetopiskelijat_3_voimassa q ON q3.master_oid = q.master_oid
) q4
GROUP BY 
	q4.vuosi,
	q4.kuukausi,
	q4.master_oid,
	q4.organisaatio_koodi,
	q4.organisaatio_fi,
	q4.suorituksen_tyyppi
HAVING SUM(kytkin) = 0


DROP TABLE IF EXISTS #amm_uudetopiskelijat_1_suoraannayttoon
DROP TABLE IF EXISTS #amm_uudetopiskelijat_1_keskeytykset
DROP TABLE IF EXISTS #amm_uudetopiskelijat_2_etusuodatus
DROP TABLE IF EXISTS #amm_uudetopiskelijat_3_voimassa
DROP TABLE IF EXISTS #amm_uudetopiskelijat_4

GO
