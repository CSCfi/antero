USE [Koski_SA]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER PROCEDURE [dbo].[p_lataa_TK_amm_tutkinnot_rahoituskausittain] AS

--ks. HUOM, päivitä tarvittaessa vuodet

DROP TABLE IF EXISTS dbo.TK_amm_tutkinnot_rahoituskausittain

;WITH ep AS (
	SELECT
		tutkintokoodi
		,nimi_fi
		,voimassaoloalkaa = case when diaarinumero='OPH-2596-2019' then '2018-01-01' else voimassaoloalkaa end --Tieto- ja viestintätekniikan perustutkinto hyväksytään jo ennen varsinaista voimaantuloa
		,voimassaololoppuu
		,siirtymapaattyy
		,min_alkaa = min(voimassaoloalkaa) over (partition by tutkintokoodi)
	FROM sa.sa_eperusteet
	WHERE nimi_fi not like '%kokeilu%'
)

SELECT 
	rahoituskausi = '01.07.2023 - 30.06.2025' --HUOM. 2-v. rahoituskausi mutta rajauksessa 3-v. poiminta, koska erotellaan jälkikäteen tutkinnot ja sijoittumisaineisto
	,tarkastelukausi
	,tarkasteluvuosi
	,tutkinnon_suorituskausi
	,tutkinnon_suoritusvuosi

	,master_oppija
	,opiskeluoikeus

	,ikar20
	,aikielir1
	--
	,pvm --apumuuttuja
	,alkamispaiva
	,maksuton
	,oikeutta_maksuttomuuteen_pidennetty
	,maksuttomuuden_piirissa --update
	,maksuttomuuden_piirissa_simulointi --update
	--

	,alvv
	,allk

	,jarj_opisk
	,jarjnimi_opisk
	,jarj_tutk
	,jarjnimi_tutk
	,oppilaitos_opisk
	,oppilaitos_tutk
	,toimipiste_opisk
	,toimipiste_tutk
	
	,toteuma_tutk
	,koulk
	,oppis
	,kustannusryhma
	,rahoitus
	,tyov

	,rnk

INTO dbo.TK_amm_tutkinnot_rahoituskausittain

FROM (

	SELECT
		tarkastelukausi = d2.rahoituskausi_amm
		,tarkasteluvuosi = year(oa.pvm) + 1
		,tutkinnon_suorituskausi = d1.rahoituskausi_amm
		,tutkinnon_suoritusvuosi = year(oa.pvm)

		,master_oppija = q.master_oid
		,opiskeluoikeus = q.opiskeluoikeus_oid

		,ikar20 = --tästä saa tarvittaessa ikar21, ikar20vs21
			case 
				when year(oa.pvm) - year(h.syntymaaika) between 0 and 19 then 1
				when year(oa.pvm) - year(h.syntymaaika) = 20 then 2
				when year(oa.pvm) - year(h.syntymaaika) <= 100 then 3
			end
		,aikielir1 =
			case
				when h.aidinkieli in ('fi','se') then 'fs'
				when h.aidinkieli = 'sv' then 'sv'
				else '99'
			end
		--
		,oa.pvm --apumuuttuja
		,q.alkamispaiva
		,oa.maksuton
		,oa.oikeutta_maksuttomuuteen_pidennetty
		,maksuttomuuden_piirissa = null --update
		,maksuttomuuden_piirissa_simulointi = null --update
		--

		,alvv = year(q.alkamispaiva)
		,allk = case when month(q.alkamispaiva) between 1 and 7 then 1 else 2 end

		,jarj_opisk = d0.ytunnus_amos_spl
		,jarjnimi_opisk = d0.nimi_amos_spl
		,jarj_tutk = d0b.ytunnus_amos_spl
		,jarjnimi_tutk = d0b.nimi_amos_spl
		,oppilaitos_opisk = q.oppilaitos_oid
		,oppilaitos_tutk = q.oppilaitos_oid_pihvi
		,toimipiste_opisk = coalesce(oo_hankittu.sisaltyy_opiskeluoikeuteen_toimipiste_oid, q.toimipiste_oid)
		,toimipiste_tutk = case when oo_hankittu.sisaltyy_opiskeluoikeuteen_toimipiste_oid is not null then q.toimipiste_oid end

		,toteuma_tutk = case when q.suorittaa_koko_tutkintoa = 1 then 1 else 2 end
		,koulk = q.tutkinto_koodi
		,oppis = case when oa.oppisopimus_koodi = 1 then 1 else 2 end
		,kustannusryhma = coalesce(sa1.kustannusryhma_koodi, sa2.kustannusryhma_koodi)
		,rahoitus = oa.opintojen_rahoitus_koodi
		,tyov = case opr.tyovoimakoulutus when 1 then 1 else 2 end

		,rnk = 
			row_number() over (
				partition by d1.rahoituskausi_amm, d0.ytunnus_amos_spl, q.master_oid
				order by q.suorittaa_koko_tutkintoa desc, oa.pvm, q.opiskeluoikeus_oid
			)

	FROM dbo.tutkinnot_ja_tutkinnonosat_valitaulu q
	left join sa.sa_koski_henkilo_master h on h.master_oid = q.master_oid

	left join (
		select 
			oo.opiskeluoikeus_oid
			,oo.sisaltyy_opiskeluoikeuteen_oid
			,sisaltyy_opiskeluoikeuteen_toimipiste_oid = min(ps.toimipiste_oid)
		from sa.sa_koski_opiskeluoikeus oo
		join sa.sa_koski_paatason_suoritus ps on ps.opiskeluoikeus_oid = oo.sisaltyy_opiskeluoikeuteen_oid
		where oo.sisaltyy_opiskeluoikeuteen_oid is not null
		group by 
			oo.opiskeluoikeus_oid
			,oo.sisaltyy_opiskeluoikeuteen_oid
	) oo_hankittu on oo_hankittu.opiskeluoikeus_oid = q.opiskeluoikeus_oid
	outer apply (
		select 
			oo.opiskeluoikeus_oid
			,oo.paattymispaiva
			,maksuton = coalesce(aj.maksuton, aj2.maksuton)
			,oikeutta_maksuttomuuteen_pidennetty = coalesce(aj.oikeutta_maksuttomuuteen_pidennetty, aj2.oikeutta_maksuttomuuteen_pidennetty)
			,opintojen_rahoitus_koodi = coalesce(aj.opintojen_rahoitus, aj2.opintojen_rahoitus)
			,oppisopimus_koodi = coalesce(aj.oppisopimus_jossain_paatason_suorituksessa, aj2.oppisopimus_jossain_paatason_suorituksessa)
		from sa.sa_koski_opiskeluoikeus oo
		join sa.sa_koski_opiskeluoikeus_aikajakso aj on aj.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and aj.tila = 'valmistunut'
		left join sa.sa_koski_opiskeluoikeus_aikajakso aj2 on aj2.opiskeluoikeus_oid = oo.opiskeluoikeus_oid and dateadd(day, 1, nullif(aj2.loppu, '9999-12-31')) = oo.paattymispaiva
		where 1=1
		and q.suorittaa_koko_tutkintoa != 1
		and oo.opiskeluoikeus_oid = coalesce(oo_hankittu.sisaltyy_opiskeluoikeuteen_oid, q.opiskeluoikeus_oid)
	) oo_osatutk
	outer apply (
		select 
			maksuton = case when q.suorittaa_koko_tutkintoa != 1 then oo_osatutk.maksuton else q.maksuton end
			,oikeutta_maksuttomuuteen_pidennetty = case when q.suorittaa_koko_tutkintoa != 1 then oo_osatutk.oikeutta_maksuttomuuteen_pidennetty else q.oikeutta_maksuttomuuteen_pidennetty end
			,opintojen_rahoitus_koodi = case when q.suorittaa_koko_tutkintoa != 1 then oo_osatutk.opintojen_rahoitus_koodi else q.opintojen_rahoitus_koodi end
			,oppisopimus_koodi = case when q.suorittaa_koko_tutkintoa != 1 then oo_osatutk.oppisopimus_koodi else q.oppisopimus_koodi end
			,pvm = case when q.suorittaa_koko_tutkintoa != 1 then oo_osatutk.paattymispaiva else q.vahvistus_paiva end
	) oa
	
	LEFT JOIN ANTERO.dw.d_amos_spl_jarjestaja_linkki d0 ON d0.oid_avain = q.koulutustoimija_oid
	LEFT JOIN ANTERO.dw.d_amos_spl_jarjestaja_linkki d0b ON d0b.oid_avain = q.koulutustoimija_oid_pihvi
	LEFT JOIN ANTERO.dw.d_kalenteri d1 ON d1.paivays = oa.pvm
	LEFT JOIN ANTERO.dw.d_kalenteri d2 ON d2.paivays = dateadd(year, 1, oa.pvm)
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus ol1 ON ol1.organisaatio_oid = q.koulutustoimija_oid_pihvi
	LEFT JOIN ANTERO.dw.d_organisaatioluokitus ol2 ON ol2.organisaatio_oid = q.koulutustoimija_oid
	LEFT JOIN ANTERO.dw.d_koulutusluokitus kl ON kl.koulutusluokitus_koodi = q.tutkinto_koodi
	LEFT JOIN ANTERO.dw.d_amos_tutkinto_kustannusryhma_uusi sa1 
		ON sa1.osaamisala_koodi = q.osaamisala_koodiarvo AND year(oa.pvm) between year(sa1.alkupvm) and year(coalesce(sa1.loppupvm,'9999-12-31'))
	LEFT JOIN ANTERO.dw.d_amos_tutkinto_kustannusryhma_uusi sa2 
		ON sa2.tutkinto_koodi = coalesce(kl.uusi_eat_koodi, kl.koulutusluokitus_koodi) AND year(oa.pvm) between year(sa2.alkupvm) and year(coalesce(sa2.loppupvm,'9999-12-31'))
	LEFT JOIN ANTERO.dw.d_opintojenrahoitus opr ON opr.koodi = oa.opintojen_rahoitus_koodi
	
	OUTER APPLY (
		select top 1 *
		from ep
		where tutkintokoodi = q.tutkinto_koodi 
		and (
			case
				when oa.pvm < ep.min_alkaa then ep.min_alkaa
				else oa.pvm
			end
		) between ep.voimassaoloalkaa and coalesce(ep.siirtymapaattyy, ep.voimassaololoppuu, '9999-12-31') 
	) kl2 
	
	LEFT JOIN ANTERO.dw.d_amos_spl_jarjestaja_linkki sjl on sjl.oid_avain = coalesce(q.koulutustoimija_oid_pihvi_hist, q.koulutustoimija_oid_pihvi, q.koulutustoimija_oid_hist, q.koulutustoimija_oid)
	OUTER APPLY (
		SELECT 
			jarj =
				case 
					when oa.pvm < sjl.voimaan_alkaen then sjl.ytunnus_avain
					else coalesce(sjl.ytunnus_amos_spl,sjl.ytunnus_avain)
				end
	) ca2

	--ammatillisen koulutuksen luvat
	OUTER APPLY (
		select top 1 jarjestajaYtunnus
		from ANTERO.sa.sa_amos_oiva_opetuskielet v0 
		where oa.pvm between v0.alkupvm and v0.loppupvm 
		and v0.jarjestajaYtunnus = ca2.jarj
	) l
	--tutkinto-oikeudet
	OUTER APPLY (
		select top 1 jarjestajaYtunnus
		from ANTERO.sa.sa_amos_oiva_tutkinto_oikeudet v1 
		where oa.pvm between v1.alkupvm and coalesce(v1.siirtymapaattyy, v1.loppupvm)
		and v1.jarjestajaYtunnus = ca2.jarj
		and kl2.nimi_fi in (v1.tutkinto_nimi1, v1.tutkinto_nimi2, v1.tutkinto_nimi3, v1.tutkinto_nimi4, v1.tutkinto_nimi5)
	) v1
	--muut oikeudet
	OUTER APPLY (
		select top 1 *
		from ANTERO.sa.v_amos_oiva_muut_oikeudet v2
		where oa.pvm between v2.alkupvm and v2.loppupvm 
		and v2.jarjestajaYtunnus = ca2.jarj
	) v2
	--kielet, opetus
	OUTER APPLY (
		select top 1 jarjestajaYtunnus
		from ANTERO.sa.sa_amos_oiva_opetuskielet v3 
		where oa.pvm between v3.alkupvm and v3.loppupvm 
		and v3.jarjestajaYtunnus = ca2.jarj 
		and q.suorituskieli_koodiarvo in (v3.kieli1, v3.kieli2, v3.kieli3)
	) v3
	--kielet, tutkinto
	OUTER APPLY (
		select top 1 jarjestajaYtunnus
		from ANTERO.sa.sa_amos_oiva_tutkintokielet v4
		where oa.pvm between v4.alkupvm and coalesce(v4.siirtymapaattyy, v4.loppupvm) 
		and v4.jarjestajaYtunnus = ca2.jarj 
		and q.suorituskieli_koodiarvo in (v4.kieli1, v4.kieli2, v4.kieli3) 
		and v4.tutkintokoodi = kl.koulutusluokitus_koodi
	) v4	
	OUTER APPLY (
		select	
			luvallinen = 
				case
					when v1.jarjestajaYtunnus is null and (oa.oppisopimus_koodi=0 or (oa.oppisopimus_koodi=1 and v2.laaja_oppis=0)) then 0
					else 1
				end
			,lupa_suorituskieli =
				case 		
					when v3.jarjestajaYtunnus is null and v4.jarjestajaYtunnus is null and l.jarjestajaYtunnus is not null then -2
					when l.jarjestajaYtunnus is null and q.suorituskieli_koodiarvo != 'FI' then -2
					else 1
				end
	) ca3
	
	WHERE 1=1
	AND q.paataso = 1
	AND oa.pvm between '2022-07-01' and '2025-06-30' --HUOM. 3-v. poiminta, erotellaan vasta jälkikäteen tutkinnot ja sijoittumisaineisto
	AND ca3.luvallinen = 1
	AND ca3.lupa_suorituskieli != -2
	AND opr.sisaltyy_okm_suoritusrahoitus = 1
	AND q.duplikaatti_suorituskausittain = 0
	AND q.paallekkainen_tuva = 0 
	AND d0.sisaltyy_amos_spl = 1
	
) Q
;


UPDATE t
SET maksuttomuuden_piirissa = oa.maksuttomuus
	,maksuttomuuden_piirissa_simulointi = oa.maksuttomuus_simulointi
FROM dbo.TK_amm_tutkinnot_rahoituskausittain t
LEFT JOIN sa.sa_koski_henkilo_master h on h.master_oid = t.master_oppija
OUTER APPLY (
	SELECT TOP 1
		perusopetuksen_paattymispaiva
		,keskiarvoluokka
	FROM sa.perusopetuksen_keskiarvot
	WHERE master_oid = t.master_oppija
	AND tarkasteluajankohta < t.alkamispaiva
	ORDER BY tarkasteluajankohta DESC 
) oa1
OUTER APPLY (
	select 
		toisen_asteen_pohjakoulutus_2018 =
			concat(
				min(case when tat.sektori='ammatillinen' then 'amm' end)
				,min(case when tat.sektori='lukio' then 'yo' end)
			)
	from sa.toisen_asteen_tutkinnot tat
	where tat.master_oid = t.master_oppija
	and tat.vahvistus_paiva < t.alkamispaiva
	and tat.vahvistus_paiva > '2017-12-31'
) oa2
OUTER APPLY (
	select 
		toisen_asteen_tutkinto_2018 = 
			concat(
				min(case when tat.sektori='ammatillinen' then 'amm' end)
				,min(case when tat.sektori='lukio' then 'yo' end)
			)
	from sa.toisen_asteen_tutkinnot tat
	where tat.master_oid = t.master_oppija
	and tat.vahvistus_paiva < t.pvm
	and tat.vahvistus_paiva > '2017-12-31'
) oa2b
OUTER APPLY (
	select 
		kotikunta_mannersuomessa_18v_mennessa = coalesce(max(0+d.mannersuomessa), 0)
	from sa.sa_koski_kotikuntahistoria kkh
	left join ANTERO.dw.d_alueluokitus d on d.kunta_koodi = kkh.kotikunta
	where kkh.master_oid = h.master_oid
	and coalesce(kkh.muutto_pvm, '1900-01-01') < dateadd(year, 18, h.syntymaaika)
) oa3
OUTER APPLY (
	select 
		vapautettu_oppivelvollisuudesta = coalesce(max(1), 0)
	from sa.sa_valpas_oppivelvollisuudesta_vapautetut ovv
	left join sa.sa_koski_henkilo_master h2 on h2.master_oid = ovv.master_oid
	where h2.master_oid = h.master_oid
	and ovv.vapautettu < t.pvm
	and coalesce(year(ovv.mitatoity), 9999) = 9999
) oa4
OUTER APPLY (
	select 
		maksuttomuus = 
			case 
				when 
					t.maksuton = 1
					and year(h.syntymaaika) > 2003
					and coalesce(year(oa1.perusopetuksen_paattymispaiva), 9999) > 2020
					and (
						year(t.pvm) - year(h.syntymaaika) < 21
						or (
							t.oikeutta_maksuttomuuteen_pidennetty = 1
							and year(t.alkamispaiva) - year(h.syntymaaika) < 21
						)
					)
					and	(
						oa3.kotikunta_mannersuomessa_18v_mennessa = 1
						or h.turvakielto = 1
					)
					and oa4.vapautettu_oppivelvollisuudesta = 0
					and oa2.toisen_asteen_pohjakoulutus_2018 = ''
					and oa2b.toisen_asteen_tutkinto_2018 not like '%amm%'
					--and suorituksen_tyyppi != 'tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus'
					--and kustannusryhma_koodi != 'muu'
				then 1
				else 0
			end
		,maksuttomuus_simulointi = 
			case 
				when 
					(
						(
							--perustapaus, jolle pohjana Koski-tieto
							t.maksuton = 1
							and year(h.syntymaaika) >= 2004
							and coalesce(year(oa1.perusopetuksen_paattymispaiva), 9999) >= 2021
						)
						or (
							--syntv puolesta juuri ja juuri lain piirissä, perusopetuksen suorv puolesta ei (toisin kuin samalla suoritusiällä syntv 2005 alkaen)
							year(h.syntymaaika) = 2004
							and year(oa1.perusopetuksen_paattymispaiva) = 2020
						)
						or (
							--ei syntv puolesta lain piirissä; samalla perusopetuksen suoritusiällä syntv 2005 alkaen lain piirissä
							year(h.syntymaaika) < 2004
							and coalesce(year(oa1.perusopetuksen_paattymispaiva), 9999) - year(h.syntymaaika) >= 16
						)
					)
					and (
						year(t.pvm) - year(h.syntymaaika) < 21
						or (
							t.oikeutta_maksuttomuuteen_pidennetty = 1
							and year(t.alkamispaiva) - year(h.syntymaaika) < 21
						)
					)
					and	(
						oa3.kotikunta_mannersuomessa_18v_mennessa = 1
						or h.turvakielto = 1
					)
					and oa4.vapautettu_oppivelvollisuudesta = 0
					and oa2.toisen_asteen_pohjakoulutus_2018 = ''
					and oa2b.toisen_asteen_tutkinto_2018 not like '%amm%'
					--and suorituksen_tyyppi != 'tutkinnonosaapienemmistäkokonaisuuksistakoostuvasuoritus'
					--and kustannusryhma_koodi != 'muu'
				then 1
				else 0
			end
) oa

GO
