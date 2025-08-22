USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [sa].[p_lataa_opiskelijavuodet_osatutkinnot_kustannusryhma] @date as date as

DROP TABLE IF EXISTS sa.temp_opiskelijavuodet_osatutkinnot_kustannusryhma
DROP TABLE IF EXISTS sa.temp_opiskelijavuodet_osatutkinnot_kustannusryhma_uusi

SELECT DISTINCT
	 opiskeluoikeus_oid
	,paatason_suoritus_id
	,kr = 
		coalesce(
			case 
				when (q.tutkinnonosan_kustannusryhmien_maara_maks > 1 or q.paatason_kustannusryhmien_maara > 1) and q.kr_min = 1 then '2'
				else q.kr_min 
			end
			,okr_kustannusryhma_koodi
			,tkr_kustannusryhma_koodi
			,'2' -- tutkinnon osaa pienemmistä kokonaisuuksista koostuvissa suorituksissa ei pääosin ole tutkintokoodia päätason suorituksessa eikä osasuorituksia välttämättä ole tai niistä puuttuu liittyy_tutkinnonosaan_koodiarvo, tällöin mikään aiemmista kohdista ei tuota tulosta
		)
	,kr_uusi = cast(null as varchar(10)) --update lopussa

INTO sa.temp_opiskelijavuodet_osatutkinnot_kustannusryhma

FROM (

	SELECT 
		 ps.opiskeluoikeus_oid
		,ps.paatason_suoritus_id
		,okr_kustannusryhma_koodi = okr.kustannusryhma_koodi
		,tkr_kustannusryhma_koodi = tkr.kustannusryhma_koodi
		,kr_min = min(d.kr_min) over (partition by ps.paatason_suoritus_id)
		,tutkinnonosan_kustannusryhmien_maara_maks = max(d.kr_count) over (partition by ps.paatason_suoritus_id)
		,paatason_kustannusryhmien_maara = dense_rank() over (partition by ps.paatason_suoritus_id order by d.kr_min) + dense_rank() over (partition by ps.paatason_suoritus_id order by d.kr_min desc) - 1
	FROM sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oo
	left join sa.temp_opiskelijavuodet_paatason_suoritus ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid 
	left join sa.sa_koski_osasuoritus os on os.paatason_suoritus_id = ps.paatason_suoritus_id and not (ps.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' and os.suorituksen_tyyppi != 'ammatillisentutkinnonosa')

	--kustannusryhmä
	left join (
		select 
			 tutkinnonosa_koodi
			,kr_min = min(ca.kustannusryhma_koodi)
			,kr_count = count(distinct ca.kustannusryhma_koodi)
		from dbo.eperusteet_tutkinnonosa_osaamisala_laajuus os
		left join ANTERO.dw.d_amos_tutkinto_kustannusryhma kr1 on kr1.osaamisala_koodi = os.osaamisala_koodi and year(@date) between year(kr1.alkupvm) and year(coalesce(kr1.loppupvm,'9999-12-31'))
		left join ANTERO.dw.d_amos_tutkinto_kustannusryhma kr2 on kr2.tutkinto_koodi = os.tutkinto_koodi and year(@date) between year(kr2.alkupvm) and year(coalesce(kr2.loppupvm,'9999-12-31'))
		outer apply (select kustannusryhma_koodi = coalesce(kr1.kustannusryhma_koodi, kr2.kustannusryhma_koodi)) ca
		where @date between os.voimassaoloalkaa and coalesce(os.siirtymapaattyy, os.voimassaololoppuu)
		group by tutkinnonosa_koodi
	) d on cast(d.tutkinnonosa_koodi as varchar(50)) = coalesce(os.liittyy_tutkinnonosaan_koodiarvo, os.koulutusmoduuli_koodiarvo)

	--kustannusryhma niille joilta ei löydy osasuorituksia
	left join ANTERO.dw.d_koulutusluokitus k3 ON k3.koulutusluokitus_koodi = coalesce(nullif(case when isnumeric(ps.koulutusmoduuli_koodiarvo)=1 and len(ps.koulutusmoduuli_koodiarvo)=6 then ps.koulutusmoduuli_koodiarvo end,'999904'), ps.tutkinto_koodiarvo)
	left join ANTERO.dw.d_amos_tutkinto_kustannusryhma okr ON okr.osaamisala_koodi = ps.osaamisala_koodiarvo and year(oo.pvm) between year(okr.alkupvm) and year(coalesce(okr.loppupvm,'9999-12-31'))
	left join ANTERO.dw.d_amos_tutkinto_kustannusryhma tkr ON tkr.tutkinto_koodi = coalesce(k3.uusi_eat_koodi, k3.koulutusluokitus_koodi) and year(oo.pvm) between year(tkr.alkupvm) and year(coalesce(tkr.loppupvm,'9999-12-31'))

	WHERE 1=1
	and ps.suorituksen_tyyppi in ('ammatillinentutkintoosittainen', 'tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus')

	--GROUP BY ps.opiskeluoikeus_oid,ps.paatason_suoritus_id,okr.kustannusryhma_koodi,tkr.kustannusryhma_koodi

) q


--kr_uusi
SELECT DISTINCT
	 opiskeluoikeus_oid
	,paatason_suoritus_id
	,kr_uusi = 
		coalesce(
			case 
				when (q.tutkinnonosan_kustannusryhmien_maara_maks > 1 or q.paatason_kustannusryhmien_maara > 1) and q.kr_min = 1 then '2' 
				else q.kr_min 
			end
			,okr_kustannusryhma_koodi
			,tkr_kustannusryhma_koodi
			,'2' -- tutkinnon osaa pienemmistä kokonaisuuksista koostuvissa suorituksissa ei pääosin ole tutkintokoodia päätason suorituksessa eikä osasuorituksia välttämättä ole tai niistä puuttuu liittyy_tutkinnonosaan_koodiarvo, tällöin mikään aiemmista kohdista ei tuota tulosta
		)

INTO sa.temp_opiskelijavuodet_osatutkinnot_kustannusryhma_uusi

FROM (

	SELECT 
		 ps.opiskeluoikeus_oid
		,ps.paatason_suoritus_id
		,okr_kustannusryhma_koodi = okr.kustannusryhma_koodi
		,tkr_kustannusryhma_koodi = tkr.kustannusryhma_koodi
		,kr_min = min(d.kr_min) over (partition by ps.paatason_suoritus_id)
		,tutkinnonosan_kustannusryhmien_maara_maks = max(d.kr_count) over (partition by ps.paatason_suoritus_id)
		,paatason_kustannusryhmien_maara = dense_rank() over (partition by ps.paatason_suoritus_id order by d.kr_min) + dense_rank() over (partition by ps.paatason_suoritus_id order by d.kr_min desc) - 1
	FROM sa.temp_opiskelijavuodet_opiskeluoikeus_oidit oo
	left join sa.temp_opiskelijavuodet_paatason_suoritus ps on oo.opiskeluoikeus_oid = ps.opiskeluoikeus_oid 
	left join sa.sa_koski_osasuoritus os on os.paatason_suoritus_id = ps.paatason_suoritus_id and not (ps.suorituksen_tyyppi = 'ammatillinentutkintoosittainen' and os.suorituksen_tyyppi != 'ammatillisentutkinnonosa')

	--kustannusryhmä
	left join (
		select 
			 tutkinnonosa_koodi
			,kr_min = min(ca.kustannusryhma_koodi)
			,kr_count = count(distinct ca.kustannusryhma_koodi)
		from dbo.eperusteet_tutkinnonosa_osaamisala_laajuus os
		left join ANTERO.dw.d_amos_tutkinto_kustannusryhma_uusi kr1 on kr1.osaamisala_koodi = os.osaamisala_koodi and year(@date) between year(kr1.alkupvm) and year(coalesce(kr1.loppupvm,'9999-12-31'))
		left join ANTERO.dw.d_amos_tutkinto_kustannusryhma_uusi kr2 on kr2.tutkinto_koodi = os.tutkinto_koodi and year(@date) between year(kr2.alkupvm) and year(coalesce(kr2.loppupvm,'9999-12-31'))
		outer apply (select kustannusryhma_koodi = coalesce(kr1.kustannusryhma_koodi, kr2.kustannusryhma_koodi)) ca
		where @date between os.voimassaoloalkaa and coalesce(os.siirtymapaattyy, os.voimassaololoppuu)
		group by tutkinnonosa_koodi
	) d on cast(d.tutkinnonosa_koodi as varchar(50)) = coalesce(os.liittyy_tutkinnonosaan_koodiarvo, os.koulutusmoduuli_koodiarvo)

	--kustannusryhma niille joilta ei löydy osasuorituksia
	left join ANTERO.dw.d_koulutusluokitus k3 ON k3.koulutusluokitus_koodi = coalesce(nullif(case when isnumeric(ps.koulutusmoduuli_koodiarvo)=1 and len(ps.koulutusmoduuli_koodiarvo)=6 then ps.koulutusmoduuli_koodiarvo end,'999904'), ps.tutkinto_koodiarvo)
	left join ANTERO.dw.d_amos_tutkinto_kustannusryhma_uusi okr ON okr.osaamisala_koodi = ps.osaamisala_koodiarvo and year(oo.pvm) between year(okr.alkupvm) and year(coalesce(okr.loppupvm,'9999-12-31'))
	left join ANTERO.dw.d_amos_tutkinto_kustannusryhma_uusi tkr ON tkr.tutkinto_koodi = coalesce(k3.uusi_eat_koodi, k3.koulutusluokitus_koodi) and year(oo.pvm) between year(tkr.alkupvm) and year(coalesce(tkr.loppupvm,'9999-12-31'))

	WHERE 1=1
	and ps.suorituksen_tyyppi in ('ammatillinentutkintoosittainen', 'tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus')

	--GROUP BY ps.opiskeluoikeus_oid,ps.paatason_suoritus_id,okr.kustannusryhma_koodi,tkr.kustannusryhma_koodi

) q


--kr_uusi samaan tauluun vanhan kanssa
update t1
set kr_uusi = t2.kr_uusi
from sa.temp_opiskelijavuodet_osatutkinnot_kustannusryhma t1
left join sa.temp_opiskelijavuodet_osatutkinnot_kustannusryhma_uusi t2 
	on t2.opiskeluoikeus_oid = t1.opiskeluoikeus_oid 
	and t2.paatason_suoritus_id = t1.paatason_suoritus_id

GO
