USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_opiskelijavuodet_tutkinnon_osaa_pienemmat] as

DROP TABLE IF EXISTS sa.temp_opiskelijavuodet_tutkinnon_osaa_pienemmat

SELECT DISTINCT
	opiskeluoikeus_oid
	,paatason_suoritus_id
	,tutkinto = coalesce(q2.tutkinto, q2.min_liittyy_tutkintoon)
	,tutkintotyyppi = coalesce(q2.tutkintotyyppi, q2.min_liittyy_tutkintoon_tutkintotyyppi)
	,liittyy_tutkinnonosaan_1_0

INTO sa.temp_opiskelijavuodet_tutkinnon_osaa_pienemmat

FROM (

	SELECT 
		q.opiskeluoikeus_oid
		,q.paatason_suoritus_id
		,tutkinto = min(q.tutkintokoodi) over (partition by paatason_suoritus_id)
		,tutkintotyyppi = nullif(right(concat('0', min_min_tutkintotyyppi_koodi), 2), '0')
		,liittyy_tutkinnonosaan_1_0
		--
		,q.min_liittyy_tutkintoon
		,min_liittyy_tutkintoon_tutkintotyyppi = nullif(right(concat('0', cast(nullif(kl2.tutkintotyyppi_koodi,-1) as int)), 2), '0')

	FROM (

		SELECT 
			 ps.opiskeluoikeus_oid
			,ps.paatason_suoritus_id
			,ep.tutkintokoodi
			,ep.min_tutkintotyyppi_koodi
			,min_min_tutkintotyyppi_koodi = min(ep.min_tutkintotyyppi_koodi) over (partition by ps.paatason_suoritus_id)
			,liittyy_tutkinnonosaan_1_0 = max(case when os.liittyy_tutkinnonosaan_koodiarvo is not null or os.liittyy_tutkintoon_koodiarvo is not null then 1 else 0 end) over (partition by ps.paatason_suoritus_id)
			,min_liittyy_tutkintoon = min(os.liittyy_tutkintoon_koodiarvo) over (partition by ps.paatason_suoritus_id)

		FROM sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oo
		LEFT JOIN sa.temp_opiskelijavuodet_paatason_suoritus ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid 
		LEFT JOIN sa.sa_koski_osasuoritus os on os.paatason_suoritus_id = ps.paatason_suoritus_id
		LEFT JOIN (
			SELECT DISTINCT
				tutkinnonosa_koodi
				,tutkintokoodi
				,min_tutkintotyyppi_koodi
			FROM (
				SELECT 
					tutkinnonosa_koodi = t.koodiarvo
					,ep.tutkintokoodi
					,kl.tutkintotyyppi_koodi
					,min_tutkintotyyppi_koodi = min(cast(nullif(kl.tutkintotyyppi_koodi,-1) as int)) over (partition by t.koodiarvo) 
				FROM sa.sa_eperusteet_tutkinnonosat t
				LEFT JOIN sa.sa_eperusteet ep on ep.eperusteid=t.eperusteid
				LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi = ep.tutkintokoodi
				WHERE ep.tutkintokoodi is not null 
				AND t.koodiarvo is not null
				AND t.koodiarvo not in (
					'101053',
					'101054',
					'101055',
					'106727',
					'106728',
					'106729',
					'400012',
					'400013',
					'400014',
					'600001',
					'600002'
				)
			) q
			WHERE tutkintotyyppi_koodi = min_tutkintotyyppi_koodi
		) ep on ep.tutkinnonosa_koodi = os.liittyy_tutkinnonosaan_koodiarvo

		WHERE ps.suorituksen_tyyppi = 'tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus'

	) q
	
	LEFT JOIN ANTERO.dw.d_koulutusluokitus kl2 on kl2.koulutusluokitus_koodi = q.min_liittyy_tutkintoon

	WHERE (min_tutkintotyyppi_koodi = min_min_tutkintotyyppi_koodi or min_min_tutkintotyyppi_koodi is null)

) q2

GO
