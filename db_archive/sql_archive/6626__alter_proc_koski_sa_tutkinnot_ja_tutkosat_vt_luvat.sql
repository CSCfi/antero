USE [Koski_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat]    Script Date: 8.11.2022 13:56:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[p_lataa_tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat] AS



DROP TABLE IF EXISTS [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat]

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
	q.*
	,lupa_koulutus = 
		case 
			when d21.kytkin_koodi = 0 or (year(q.alkamispaiva) < 2018 and d1.koulutusastetaso2_koodi in ('33','41')) then 1
			else 
				case
					when v1.jarjestajaYtunnus is null and d10.kytkin_koodi = 0 and tutkinnot > 0 and osaamispisteet = 0 then 20
					when v1.jarjestajaYtunnus is null and d10.kytkin_koodi = 1 and tutkinnot > 0 and osaamispisteet = 0 and v2.laaja_oppis = 0 then 21
					when v1.jarjestajaYtunnus is null and d10.kytkin_koodi = 0 and tutkinnot = 0 and osaamispisteet > 0 then 22
					when v1.jarjestajaYtunnus is null and d10.kytkin_koodi = 1 and tutkinnot = 0 and osaamispisteet > 0 and v2.laaja_oppis = 0 then 23
					when v1.jarjestajaYtunnus is null and d10.kytkin_koodi = 0 and tutkinnot > 0 and osaamispisteet > 0 then 24
					when v1.jarjestajaYtunnus is null and d10.kytkin_koodi = 1 and tutkinnot > 0 and osaamispisteet > 0 and v2.laaja_oppis = 0 then 25
					else 1
				end
		end
	,lupa_korotustekija =
		case 
			when d21.kytkin_koodi = 0 then 1
			else
				case
					when d6.jarjestys_erityisopetus_ryhma = '3' and v2.erityinen_vaativa_tuki = 0 and tutkinnot > 0 and osaamispisteet = 0 then 10
					when d6.jarjestys_erityisopetus_ryhma = '3' and v2.erityinen_vaativa_tuki = 0 and tutkinnot = 0 and osaamispisteet > 0 then 11
					when d6.jarjestys_erityisopetus_ryhma = '3' and v2.erityinen_vaativa_tuki = 0 and tutkinnot > 0 and osaamispisteet > 0 then 12
					else 1
				end
		end
	,lupa_suorituskieli =
		case 		
			when v3.jarjestajaYtunnus is null and v4.jarjestajaYtunnus is null and l.organisaatio_koodi is not null then '-2' 
			when l.organisaatio_koodi is null and q.suorituskieli_koodiarvo != 'FI' then '-2'
			else q.suorituskieli_koodiarvo		
		end
	,verrataan_lupatietoihin = d21.kytkin_koodi
	,lupa_jarj_nimi = coalesce(sjl.nimi_ennen_fuusiota, sjl.nimi_amos_spl)
	,lupa_jarj_ytunnus = ca2.jarj
	,lupa_tutk_nimi = d12.nimi_fi

INTO [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty_luvat]

FROM [dbo].[tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty] q
left join ANTERO.dw.d_koulutusluokitus d1 ON d1.koulutusluokitus_koodi = q.tutkinto_koodi
left join ANTERO.dw.d_erityisopetus d6 on d6.erityisopetus_koodi = q.erityisopetus_koodi
cross apply (SELECT tilv = datefromparts(vuosi,kuukausi,1)) ca1
outer apply (
	select top 1
		*
	from ep
	where tutkintokoodi = coalesce(d1.uusi_eat_koodi, d1.koulutusluokitus_koodi) 
	and (
		case
			when ca1.tilv < ep.min_alkaa then ep.min_alkaa
			else ca1.tilv
		end
	) between ep.voimassaoloalkaa and coalesce(ep.siirtymapaattyy, ep.voimassaololoppuu, '9999-12-31') 
) d12 
---
left join ANTERO.dw.d_kytkin d10 on d10.kytkin_koodi = q.oppisopimus_koodi
left join ANTERO.dw.d_kytkin d21 on d21.kytkin_koodi = 
(
	case 
		when (d1.tutkintotyyppi_koodi = '02' and q.alkamispaiva >= '2018-08-01') or (d1.tutkintotyyppi_koodi in ('19','20') and q.alkamispaiva >= '2019-01-01') then 1
		else 0
	end
)
left join ANTERO.dw.d_amos_spl_jarjestaja_linkki sjl on sjl.oid_avain = coalesce(q.koulutustoimija_oid_pihvi_hist, q.koulutustoimija_oid_pihvi, q.koulutustoimija_oid_hist, q.koulutustoimija_oid)
cross apply (
	SELECT 
		jarj =
			case 
				when ca1.tilv < sjl.voimaan_alkaen then sjl.ytunnus_avain
				else coalesce(sjl.ytunnus_amos_spl,sjl.ytunnus_avain)
			end
) ca2
--ammatillisen koulutuksen luvat
LEFT JOIN (
	select distinct
		 d1.organisaatio_koodi
		,alkupvm = d2.paivays
		,loppupvm = d3.paivays
	from ANTERO.dw.f_oiva_luvat_amm f
	left join ANTERO.dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatioluokitus_id
	left join ANTERO.dw.d_kalenteri d2 on d2.id = f.d_kalenteri_luvan_alku_id
	left join ANTERO.dw.d_kalenteri d3 on d3.id = f.d_kalenteri_luvan_loppu_id
) l on l.organisaatio_koodi = ca2.jarj and ca1.tilv between l.alkupvm and l.loppupvm

--tutkinto-oikeudet
left join ANTERO.sa.v_amos_oiva_tutkinto_oikeudet v1 on (ca1.tilv between v1.alkupvm and coalesce(v1.siirtymapaattyy,v1.loppupvm))  
												and v1.jarjestajaYtunnus = ca2.jarj
												and d12.nimi_fi in (v1.tutkinto_nimi1, v1.tutkinto_nimi2, v1.tutkinto_nimi3, v1.tutkinto_nimi4, v1.tutkinto_nimi5)	
--muut oikeudet
left join ANTERO.sa.v_amos_oiva_muut_oikeudet v2 on ca1.tilv between v2.alkupvm and v2.loppupvm 
												and v2.jarjestajaYtunnus = ca2.jarj
--kielet, opetus
LEFT JOIN ANTERO.sa.sa_amos_oiva_opetuskielet v3 ON ca1.tilv between v3.alkupvm and v3.loppupvm 
												and v3.jarjestajaYtunnus = ca2.jarj 
												and q.suorituskieli_koodiarvo in (v3.kieli1,v3.kieli2,v3.kieli3) 
--kielet, tutkinto
LEFT JOIN ANTERO.sa.sa_amos_oiva_tutkintokielet v4 ON ca1.tilv between v4.alkupvm and coalesce(v4.siirtymapaattyy,v4.loppupvm) 
												and v4.jarjestajaYtunnus = ca2.jarj 
												and q.suorituskieli_koodiarvo in (v4.kieli1,v4.kieli2,v4.kieli3) 
												and v4.tutkintokoodi = d1.koulutusluokitus_koodi