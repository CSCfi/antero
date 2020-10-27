USE [Koski_SA]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_tutkinnon_osaa_pienemmat]    Script Date: 27.10.2020 16:52:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_opiskelijavuodet_tutkinnon_osaa_pienemmat] as

DROP TABLE IF EXISTS sa.temp_opiskelijavuodet_tutkinnon_osaa_pienemmat

SELECT distinct
	 opiskeluoikeus_oid
	,paatason_suoritus_id
	,tutkinto
	,tutkintotyyppi

INTO sa.temp_opiskelijavuodet_tutkinnon_osaa_pienemmat

FROM (

	SELECT 
		q.opiskeluoikeus_oid
		,q.paatason_suoritus_id
		,tutkinto = case when tutkinto_lkm > 1 then null else q.tutkinto end
		,tutkintotyyppi = nullif(right(concat('0',tutkintotyyppi),2),'0')
	FROM (

		SELECT 
			 ps.opiskeluoikeus_oid
			,ps.paatason_suoritus_id
			,tutkinto_lkm =  dense_rank() over (partition by ps.paatason_suoritus_id order by ep.tutkinto) + dense_rank() over (partition by ps.paatason_suoritus_id order by ep.tutkinto desc) - 1	
			,tutkinto = ep.tutkinto
			,tutkintotyyppi = max(cast(ep.tutkintotyyppi as int)) over (partition by ps.paatason_suoritus_id)
		FROM Koski_SA.sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oo
		left join Koski_SA.sa.temp_opiskelijavuodet_paatason_suoritus ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid 
		left join Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
		left join Koski_SA.sa.sa_koski_osasuoritus os on os.paatason_suoritus_id = ps.paatason_suoritus_id
		left join (
			SELECT distinct
				tutkinnonosa_koodi
				,tutkinto = case when t_lkm > 1 then null else tutkintokoodi end
				,tutkintotyyppi = right(concat('0',tt_maks),2)
			FROM (
				SELECT 
					tutkinnonosa_koodi = t.koodiarvo
					,ep.tutkintokoodi
					,t_lkm = dense_rank() over (partition by t.koodiarvo order by ep.tutkintokoodi) + dense_rank() over (partition by t.koodiarvo order by ep.tutkintokoodi desc) - 1	
					,tt_maks = max(cast(nullif(kl.tutkintotyyppi_koodi,-1) as int)) over (partition by t.koodiarvo)
				FROM sa.sa_eperusteet_tutkinnonosat t
				LEFT JOIN sa.sa_eperusteet ep on ep.eperusteid=t.eperusteid
				LEFT JOIN ANTERO.dw.d_koulutusluokitus kl on kl.koulutusluokitus_koodi=ep.tutkintokoodi
				WHERE ep.tutkintokoodi is not null
			) q
		) ep on ep.tutkinnonosa_koodi = os.liittyy_tutkinnonosaan_koodiarvo
	

		where 1=1
		and ps.suorituksen_tyyppi = 'tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus'
		and year(ooa.loppu) >= 2018 
		--and ooa.tila in ('loma','lasna','valmistunut')
		

	) q


) q2








GO
USE ANTERO