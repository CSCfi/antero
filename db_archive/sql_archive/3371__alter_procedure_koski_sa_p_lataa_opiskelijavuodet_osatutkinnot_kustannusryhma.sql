USE [Koski_SA]
GO


/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_osatutkinnot_kustannusryhma]    Script Date: 15.9.2020 8:27:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER procedure [sa].[p_lataa_opiskelijavuodet_osatutkinnot_kustannusryhma] as

DROP TABLE sa.temp_opiskelijavuodet_osatutkinnot_kustannusryhma

SELECT distinct
	 opiskeluoikeus_oid
	,paatason_suoritus_id
	,kr = coalesce(min_kr_ot, okr.kustannusryhma_koodi, tkr.kustannusryhma_koodi)
	,kr_uusi = coalesce(min_kr_ot_uusi, okr.kustannusryhma_koodi, tkr_u.kustannusryhma_koodi)

INTO sa.temp_opiskelijavuodet_osatutkinnot_kustannusryhma

FROM (

	SELECT 
		 ps.opiskeluoikeus_oid
		,ps.paatason_suoritus_id
		,ps.osaamisala_koodiarvo
		,ps.koulutusmoduuli_koodiarvo
		,ps.tutkinto_koodiarvo
		,min_kr_ot = min(case when d.kr_count > 1 then d.kr_min_ilman1 else d.kr_min end)
		,min_kr_ot_uusi = min(case when d_uusi.kr_count > 1 then d_uusi.kr_min_ilman1 else d_uusi.kr_min end)
	FROM Koski_SA.sa.sa_koski_paatason_suoritus ps
	inner join Koski_SA.sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oo on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid --and osatutkinto = 1
	inner join Koski_SA.sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	left join Koski_SA.sa.sa_koski_osasuoritus os on os.paatason_suoritus_id = ps.paatason_suoritus_id 
	left join (
		select 
			 tutkinnonosa_koodi
			,kr_min = min(kustannusryhma_koodi)
			,kr_min_ilman1 = min(case when kustannusryhma_koodi='1' then '5' else kustannusryhma_koodi end)
			,kr_count = count(distinct kustannusryhma_koodi)
		from Koski_SA.dbo.kustannusryhma_osasuoritus 
		group by tutkinnonosa_koodi
	) d on cast(d.tutkinnonosa_koodi as varchar(50)) = coalesce(os.liittyy_tutkinnonosaan_koodiarvo,os.koulutusmoduuli_koodiarvo)
	left join (
		select 
			 tutkinnonosa_koodi
			,kr_min = min(kustannusryhma_koodi_uusi)
			,kr_min_ilman1 = min(case when kustannusryhma_koodi_uusi='1' then '5' else kustannusryhma_koodi_uusi end)
			,kr_count = count(distinct kustannusryhma_koodi_uusi)
		from Koski_SA.dbo.kustannusryhma_osasuoritus 
		group by tutkinnonosa_koodi
	) d_uusi on cast(d_uusi.tutkinnonosa_koodi as varchar(50)) = coalesce(os.liittyy_tutkinnonosaan_koodiarvo,os.koulutusmoduuli_koodiarvo)

	where 1=1
	and ((ps.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' and os.suorituksen_tyyppi = 'ammatillisentutkinnonosa') or ps.suorituksen_tyyppi = 'tutkinnonosaapienemmist�kokonaisuuksistakoostuvasuoritus')
	and year(ooa.loppu) >= 2018 and ooa.tila in ('loma','lasna','valmistunut')

	group by 
		 ps.opiskeluoikeus_oid
		,ps.paatason_suoritus_id
		,ps.osaamisala_koodiarvo
		,ps.koulutusmoduuli_koodiarvo
		,ps.tutkinto_koodiarvo

) q

--kustannusryhma niille joilta ei l�ydy osasuorituksia
left join ANTERO.dw.d_koulutusluokitus k3 ON k3.koulutusluokitus_koodi = COALESCE(NULLIF(q.koulutusmoduuli_koodiarvo,'999904'), q.tutkinto_koodiarvo)
left join ANTERO.sa.sa_amos_osaamisala_kustannusryhma okr ON okr.osaamisala_koodi = q.osaamisala_koodiarvo
left join ANTERO.sa.sa_amos_tutkinto_kustannusryhma tkr ON tkr.tutkinto_koodi = COALESCE(k3.uusi_eat_koodi, k3.koulutusluokitus_koodi)
left join ANTERO.sa.sa_amos_tutkinto_kustannusryhma_uusi tkr_u ON tkr_u.tutkinto_koodi = COALESCE(k3.uusi_eat_koodi, k3.koulutusluokitus_koodi)



GO

USE ANTERO