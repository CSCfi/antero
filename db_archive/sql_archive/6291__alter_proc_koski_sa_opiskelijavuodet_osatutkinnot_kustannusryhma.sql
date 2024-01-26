USE [Koski_SA]
GO
/****** Object:  StoredProcedure [sa].[p_lataa_opiskelijavuodet_osatutkinnot_kustannusryhma]    Script Date: 7.7.2022 13:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_opiskelijavuodet_osatutkinnot_kustannusryhma] @date as date as


DROP TABLE IF EXISTS sa.temp_opiskelijavuodet_osatutkinnot_kustannusryhma

SELECT distinct
	 opiskeluoikeus_oid
	,paatason_suoritus_id
	,kr = coalesce(min_kr_ot, okr.kustannusryhma_koodi, tkr.kustannusryhma_koodi)

INTO sa.temp_opiskelijavuodet_osatutkinnot_kustannusryhma

FROM (

	SELECT 
		 ps.opiskeluoikeus_oid
		,ps.paatason_suoritus_id
		,ps.osaamisala_koodiarvo
		,ps.koulutusmoduuli_koodiarvo
		,ps.tutkinto_koodiarvo
		,oo.pvm
		,min_kr_ot = min(case when d.kr_count > 1 then d.kr_min_ilman1 else d.kr_min end)
	FROM sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oo
	left join sa.temp_opiskelijavuodet_paatason_suoritus ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid 
	left join sa.sa_koski_opiskeluoikeus_aikajakso ooa on ooa.opiskeluoikeus_oid = oo.opiskeluoikeus_oid
	left join sa.sa_koski_osasuoritus os on os.paatason_suoritus_id = ps.paatason_suoritus_id and ((ps.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' and os.suorituksen_tyyppi = 'ammatillisentutkinnonosa') or ps.suorituksen_tyyppi = 'tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus')
	--kustannusryhmä
	left join (
		select 
			 tutkinnonosa_koodi
			,kr_min = min(ca.kustannusryhma_koodi)
			,kr_min_ilman1 = min(case when ca.kustannusryhma_koodi='1' then '5' else ca.kustannusryhma_koodi end)
			,kr_count = count(distinct ca.kustannusryhma_koodi)
		from dbo.kustannusryhma_osasuoritus os
		left join ANTERO.dw.d_amos_tutkinto_kustannusryhma kr1 on kr1.osaamisala_koodi = os.osaamisala_koodi and year(@date) between year(kr1.alkupvm) and year(coalesce(kr1.loppupvm,'9999-12-31'))
		left join ANTERO.dw.d_amos_tutkinto_kustannusryhma kr2 on kr2.tutkinto_koodi = os.tutkinto_koodi and year(@date) between year(kr2.alkupvm) and year(coalesce(kr2.loppupvm,'9999-12-31'))
		cross apply (select kustannusryhma_koodi = coalesce(kr1.kustannusryhma_koodi, kr2.kustannusryhma_koodi)) ca
		where @date between os.voimassaoloalkaa and coalesce(os.siirtymapaattyy, os.voimassaololoppuu)
		group by tutkinnonosa_koodi
	) d on cast(d.tutkinnonosa_koodi as varchar(50)) = coalesce(os.liittyy_tutkinnonosaan_koodiarvo, os.koulutusmoduuli_koodiarvo)

	where 1=1
	and ps.suorituksen_tyyppi in ('ammatillinentutkintoosittainen', 'tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus')
	and year(ooa.loppu) >= 2018 

	group by 
		 ps.opiskeluoikeus_oid
		,ps.paatason_suoritus_id
		,ps.osaamisala_koodiarvo
		,ps.koulutusmoduuli_koodiarvo
		,ps.tutkinto_koodiarvo
		,oo.pvm

) q

--kustannusryhma niille joilta ei löydy osasuorituksia
left join ANTERO.dw.d_koulutusluokitus k3 ON k3.koulutusluokitus_koodi = COALESCE(NULLIF(q.koulutusmoduuli_koodiarvo,'999904'), q.tutkinto_koodiarvo)
left join ANTERO.dw.d_amos_tutkinto_kustannusryhma okr ON okr.osaamisala_koodi = q.osaamisala_koodiarvo and year(q.pvm) between year(okr.alkupvm) and year(coalesce(okr.loppupvm,'9999-12-31'))
left join ANTERO.dw.d_amos_tutkinto_kustannusryhma tkr ON tkr.tutkinto_koodi = COALESCE(k3.uusi_eat_koodi, k3.koulutusluokitus_koodi)  and year(q.pvm) between year(tkr.alkupvm) and year(coalesce(tkr.loppupvm,'9999-12-31'))

GO
USE ANTERO