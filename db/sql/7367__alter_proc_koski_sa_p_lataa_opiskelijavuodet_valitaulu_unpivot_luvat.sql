USE [Koski_SA]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot_luvat]    Script Date: 15.2.2023 18:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




 
ALTER PROCEDURE [dbo].[p_lataa_opiskelijavuodet_valitaulu_unpivot_luvat] AS


DROP TABLE IF EXISTS [dbo].[opiskelijavuodet_valitaulu_unpivot_luvat]

DROP TABLE IF EXISTS #ep
--;WITH ep AS (
SELECT
	tutkintokoodi
	,nimi_fi
	,voimassaoloalkaa = case when diaarinumero='OPH-2596-2019' then '2018-01-01' else voimassaoloalkaa end --Tieto- ja viestintätekniikan perustutkinto hyväksytään jo ennen varsinaista voimaantuloa
	,voimassaololoppuu
	,siirtymapaattyy
	,min_alkaa = min(voimassaoloalkaa) over (partition by tutkintokoodi)
INTO #ep
FROM sa.sa_eperusteet
WHERE nimi_fi not like '%kokeilu%' and tutkintokoodi is not null
--)

SELECT 
	q.*
	,lupa_koulutus = 
		case	
			when d21.kytkin_koodi = 0 or q.koulutusmuoto_pihvi = 'lukiokoulutus' or (year(q.alkamispaiva) < 2018 and d11.koulutusastetaso2_koodi in ('33','41')) then 1
			else 
				case
					when q.kustannusryhma = 'muu' and l.organisaatio_koodi is null then 11
					when v1.jarjestajaYtunnus is null and q.koulk = '999908' then 10
					when v1.jarjestajaYtunnus is null and q.koulk = '999903' then 9
					when v1.jarjestajaYtunnus is null and q.koulk = '999901' then 8
					when q.muu_ammatillinen_tarkenne = '94095' and q.oppis = 1 and v2.valmistava = 0 then 7
					when q.muu_ammatillinen_tarkenne = '94095' and q.oppis = 0 and v2.valmistava = 0 then 6
					when q.muu_ammatillinen_tarkenne = '94090' and q.oppis = 1 and v2.laaja_oppis = 0 then 5
					when q.muu_ammatillinen_tarkenne = '94090' and q.oppis = 0 and v2.laaja_oppis = 0 then 4
					when v1.jarjestajaYtunnus is null and q.muu_ammatillinen_tarkenne is null and q.oppis = 1 and v2.laaja_oppis = 0 then 3
					when v1.jarjestajaYtunnus is null and q.muu_ammatillinen_tarkenne is null and q.oppis = 0 then 2
					else 1
				end
		end
	,lupa_majoitus = 
		case
			when d21.kytkin_koodi = 0 then 1
			else
				case
					when q.majoitus = 3 and v2.sisaoppilaitosmuotoinen = 0 then 2
					else 1
				end
		end
	,lupa_korotustekija = 
		case 
			when d21.kytkin_koodi = 0 then 1
			else
				case
					when d10.kytkin_koodi = '1' and d11.tutkintotyyppi_koodi in ('19','20') and v2.tyovoima = 0 then 2
					when d8.kytkin_koodi = '1' and v2.vankila = 0 then 3
					when d5.jarjestys_erityisopetus_ryhma = '3' and v2.erityinen_vaativa_tuki = 0 then 4
					else 1
				end
		end
	,lupa_suorituskieli = 
		case 		
			when v3.jarjestajaYtunnus is null and v4.jarjestajaYtunnus is null and l.organisaatio_koodi is not null then '-2' 
			when l.organisaatio_koodi is null and q.suorituksen_kieli != 'FI' then '-2'
			else q.suorituksen_kieli 
		end
	,verrataan_lupatietoihin = d21.kytkin_koodi
	,lupa_jarj_nimi = sjl.nimi_amos_spl
	,lupa_jarj_ytunnus = ca.jarj
	,lupa_koulutus_laaja_oppis = v2.laaja_oppis

INTO [dbo].[opiskelijavuodet_valitaulu_unpivot_luvat]

FROM [dbo].[opiskelijavuodet_valitaulu_unpivot] q
LEFT JOIN ANTERO.dw.d_erityisopetus d5 ON d5.erityisopetus_koodi = q.erityisopetus
LEFT JOIN ANTERO.dw.d_kytkin d8 ON d8.kytkin_koodi = q.vankilaopetus
LEFT JOIN ANTERO.dw.d_kytkin d10 ON d10.kytkin_koodi = q.tyovoimakoulutus
LEFT JOIN ANTERO.dw.d_koulutusluokitus d11 ON d11.koulutusluokitus_koodi = coalesce(q.koulk_pihvi, q.koulk)
OUTER APPLY (
	select top 1
		*
	from #ep
	where tutkintokoodi = coalesce(d11.uusi_eat_koodi, d11.koulutusluokitus_koodi) 
	and (
		case
			when tilv_date < #ep.min_alkaa then #ep.min_alkaa
			else tilv_date
		end
	) between #ep.voimassaoloalkaa and coalesce(#ep.siirtymapaattyy, #ep.voimassaololoppuu, '9999-12-31') 
) d12 
--LINKITYS LUPATIETOIHIN ALKAA
--y-tunnus jonka lupatietoihin verrataan
LEFT JOIN ANTERO.dw.d_amos_spl_jarjestaja_linkki sjl ON sjl.oid_avain = coalesce(q.jarj_oid_pihvi_hist, q.jarj_oid_pihvi, q.jarj_oid_hist, q.jarj_oid)
CROSS APPLY (
	SELECT 
		jarj =
			case 
				when tilv_date < sjl.voimaan_alkaen then sjl.ytunnus_avain
				else coalesce(sjl.ytunnus_amos_spl,sjl.ytunnus_avain)
			end
) ca
--tapaukset joita verrataan lupatietoihin
LEFT JOIN ANTERO.dw.d_kytkin d21 ON d21.kytkin_koodi = 
(
	case 
		when (d11.tutkintotyyppi_koodi = '02' and q.alkamispaiva >= '2018-08-01') 
			or (d11.tutkintotyyppi_koodi in ('19','20') and q.alkamispaiva >= '2019-01-01') 
			or d11.koulutusluokitus_koodi in ('999901','999903')
			or (d11.koulutusluokitus_koodi = '999908' and /*case Luovi*/ (coalesce(sjl.ytunnus_avain,'') != '0201472-1' or vuosi > 2022))
			or (
				q.kustannusryhma = 'muu' --muulle katsotaan onko amm. järjestämislupaa ylipäätään pl. siirtymäjärjestäjät, joilta luvat puuttuvat. JS 15.2.2023
				and (vuosi > 2021 or sjl.ytunnus_avain in ('0188756-3','0773744-3','0763403-0','0108023-3','0950895-1','0112038-9','0201789-3','1524361-1','0215382-8','1041090-0')
			)
)
			then 1
		else 0 
	end
)
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
) l on l.organisaatio_koodi = ca.jarj and tilv_date between l.alkupvm and l.loppupvm
--tutkinto-oikeudet
--LEFT JOIN ANTERO.sa.sa_amos_oiva_tutkinto_oikeudet v1 ON (tilv_date between v1.alkupvm and coalesce(v1.siirtymapaattyy,v1.loppupvm)) and v1.jarjestajaYtunnus = ca.jarj and d12.nimi_fi in (v1.tutkinto_nimi1, v1.tutkinto_nimi2, v1.tutkinto_nimi3, v1.tutkinto_nimi4, v1.tutkinto_nimi5)
OUTER APPLY (
	select top 1 jarjestajaYtunnus
	from ANTERO.sa.sa_amos_oiva_tutkinto_oikeudet v1
	where tilv_date between v1.alkupvm and coalesce(v1.siirtymapaattyy,v1.loppupvm)
	and v1.jarjestajaYtunnus = ca.jarj
	and d12.nimi_fi in (v1.tutkinto_nimi1, v1.tutkinto_nimi2, v1.tutkinto_nimi3, v1.tutkinto_nimi4, v1.tutkinto_nimi5) 
) v1
--muut oikeudet
--LEFT JOIN ANTERO.sa.v_amos_oiva_muut_oikeudet v2 ON tilv_date between v2.alkupvm and v2.loppupvm and v2.jarjestajaYtunnus = ca.jarj
OUTER APPLY (
	select top 1 *
	from ANTERO.sa.v_amos_oiva_muut_oikeudet v2
	where tilv_date between v2.alkupvm and v2.loppupvm 
	and v2.jarjestajaYtunnus = ca.jarj
) v2
--kielet, opetus
--LEFT JOIN ANTERO.sa.sa_amos_oiva_opetuskielet v3 ON tilv_date between v3.alkupvm and v3.loppupvm and v3.jarjestajaYtunnus = ca.jarj and q.suorituksen_kieli in (v3.kieli1,v3.kieli2,v3.kieli3)
OUTER APPLY (
	select top 1 jarjestajaYtunnus
	from ANTERO.sa.sa_amos_oiva_opetuskielet v3 
	where tilv_date between v3.alkupvm and v3.loppupvm 
	and v3.jarjestajaYtunnus = ca.jarj 
	and q.suorituksen_kieli in (v3.kieli1, v3.kieli2, v3.kieli3)  
) v3
--kielet, tutkinto
--LEFT JOIN ANTERO.sa.sa_amos_oiva_tutkintokielet v4 ON tilv_date between v4.alkupvm and coalesce(v4.siirtymapaattyy,v4.loppupvm) and v4.jarjestajaYtunnus = ca.jarj and q.suorituksen_kieli in (v4.kieli1,v4.kieli2,v4.kieli3) and v4.tutkintokoodi = coalesce(d11.uusi_eat_koodi, d11.koulutusluokitus_koodi) 
OUTER APPLY (
	select top 1 jarjestajaYtunnus
	from ANTERO.sa.sa_amos_oiva_tutkintokielet v4
	where tilv_date between v4.alkupvm and coalesce(v4.siirtymapaattyy, v4.loppupvm) 
	and v4.jarjestajaYtunnus = ca.jarj 
	and q.suorituksen_kieli in (v4.kieli1, v4.kieli2, v4.kieli3) 
	and v4.tutkintokoodi = coalesce(d11.uusi_eat_koodi, d11.koulutusluokitus_koodi) 
) v4


DROP TABLE #ep
