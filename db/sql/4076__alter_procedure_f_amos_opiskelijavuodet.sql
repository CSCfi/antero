USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet]    Script Date: 30.10.2020 16:17:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet] AS


TRUNCATE TABLE [ANTERO].[dw].[f_amos_opiskelijavuodet]

INSERT INTO ANTERO.dw.f_amos_opiskelijavuodet (
	 vuosi
	,d_kalenteri_id
	,d_sukupuoli_id
	,d_kieli_aidinkieli_id
	,d_ika_id
	,d_osa_aikaisuus_id
	,d_erityisopetus_id
	,d_majoitus_id
	,d_kytkin_oppisopimuskoulutus_id
	,d_kytkin_vankilaopetus_id
	,d_kytkin_henkilostokoulutus_id
	,d_kytkin_tyovoimakoulutus_id
	,d_koulutusluokitus_id
	,d_koulutusluokitus_pihvi_id
	,d_koulutusluokitus_tutk_osaa_pienempi_id
	,d_organisaatioluokitus_oppilaitos_id
	,d_organisaatioluokitus_jarj_id
	,d_organisaatioluokitus_jarj_hist_id
	,d_organisaatioluokitus_jarj_pihvi_id
	,d_organisaatioluokitus_jarj_pihvi_hist_id
	,d_organisaatioluokitus_toimipiste_id
	,d_amos_spl_jarjestaja_linkki_id
	,d_kustannusryhma_id
	,d_suorituksen_tyyppi_id
	,d_opintojenrahoitus_id
	,d_osaamisala_id
	,muu_ammatillinen_tarkenne
	,d_amos_spl_opiskelijavuodet_hylkaamisperuste_id
	,d_kytkin_verrataan_lupatietoihin_id
	,d_amos_luvaton_koulutus_id
	,d_amos_luvaton_majoitus_id
	,d_amos_luvaton_korotustekija_id
	,d_kytkin_hankintakoulutus_id
	,opiskelijavuodet
	,opiskelijavuodet_hylatyt
	,loadtime
)

SELECT 
	
	 q.vuosi
	,d_kalenteri_id = COALESCE(d1.id,-1)
	,d_sukupuoli_id = COALESCE(d2.id,-1)
	,d_kieli_aidinkieli_id = COALESCE(d3.id,-1)
	,d_ika_id = COALESCE(d4.id,-1)
	,d_osa_aikaisuus_id = COALESCE(d20.id,-1)
	,d_erityisopetus_id = COALESCE(d5.id,-1)
	,d_majoitus_id = COALESCE(d6.id,-1)
	,d_kytkin_oppisopimuskoulutus_id = COALESCE(d7.id,-1)
	,d_kytkin_vankilaopetus_id = COALESCE(d8.id,-1)
	,d_kytkin_henkilostokoulutus_id = COALESCE(d9.id,-1)
	,d_kytkin_tyovoimakoulutus_id = COALESCE(d10.id,-1)
	,d_koulutusluokitus_id = COALESCE(d11a.id,-1)
	,d_koulutusluokitus_pihvi_id = COALESCE(d11b.id,-1)
	,d_koulutusluokitus_tutk_osaa_pienempi_id = COALESCE(d11c.id,-1)
	,d_organisaatioluokitus_oppilaitos_id = COALESCE(d12.id,-1)
	,d_organisaatioluokitus_jarj_id = COALESCE(d13.id,-1)
	,d_organisaatioluokitus_jarj_hist_id = COALESCE(d13c.id,-1)
	,d_organisaatioluokitus_jarj_pihvi_id = COALESCE(d13d.id,-1)
	,d_organisaatioluokitus_jarj_pihvi_hist_id = COALESCE(d13e.id,-1)
	,d_organisaatioluokitus_toimipiste_id = COALESCE(d18.id,-1)
	,d_amos_spl_jarjestaja_linkki_id = COALESCE(d13b.id,-1)
	,d_kustannusryhma_id = COALESCE(d15.id,-1)
	,d_suorituksen_tyyppi_id = COALESCE(d14.id,-1)
	,d_opintojenrahoitus_id = COALESCE(d16.id,-1)
	,d_osaamisala_id = COALESCE(d17.id,-1)
	,muu_ammatillinen_tarkenne = COALESCE(muu_ammatillinen_tarkenne, -1)
	,d_amos_spl_opiskelijavuodet_hylkaamisperuste = COALESCE(d19.id,-1)
	,d_kytkin_verrataan_lupatietoihin_id = COALESCE(d21.id,-1)
	,d_amos_luvaton_koulutus_id = COALESCE(d22.id,-1)
	,d_amos_luvaton_majoitus_id = COALESCE(d23.id,-1)
	,d_amos_luvaton_korotustekija_id = COALESCE(d24.id,-1)
	,d_kytkin_hankintakoulutus_id = COALESCE(d25.id,-1)
	,opiskelijavuodet = SUM(case when q.hyvaksytaan = 1 then op_vuodet else 0 end)
	,opiskelijavuodet_hylatyt = SUM(case when q.hyvaksytaan = 0 then op_vuodet else 0 end)
	,GETDATE()
	
FROM [Koski_SA].[dbo].[opiskelijavuodet_valitaulu_unpivot] q
LEFT JOIN dw.d_kalenteri d1 ON d1.kalenteri_avain = q.tilv_date
LEFT JOIN dw.d_sukupuoli d2 ON d2.sukupuoli_koodi = q.sukupuoli
LEFT JOIN dw.d_kieli d3 ON d3.kieli_koodi = q.aidinkieli
LEFT JOIN dw.d_ika d4 ON d4.ika_avain = q.ika
LEFT JOIN dw.d_erityisopetus d5 ON d5.erityisopetus_koodi = q.erityisopetus
LEFT JOIN dw.d_majoitus d6 ON d6.majoitus_koodi = q.majoitus
LEFT JOIN dw.d_kytkin d7 ON d7.kytkin_koodi = q.oppis
LEFT JOIN dw.d_kytkin d8 ON d8.kytkin_koodi = q.vankilaopetus
LEFT JOIN dw.d_kytkin d9 ON d9.kytkin_koodi = q.henkilostokoulutus
LEFT JOIN dw.d_kytkin d10 ON d10.kytkin_koodi = q.tyovoimakoulutus
LEFT JOIN dw.d_koulutusluokitus d11a ON d11a.koulutusluokitus_koodi = q.koulk
LEFT JOIN dw.d_koulutusluokitus d11b ON d11b.koulutusluokitus_koodi = q.koulk_pihvi
LEFT JOIN (
	select distinct
		tutkintotyyppi_koodi
		,id = (select top 1 id from dw.d_koulutusluokitus d1 where tutkintotyyppi_koodi = d.tutkintotyyppi_koodi)
	from dw.d_koulutusluokitus d
) d11c ON d11c.tutkintotyyppi_koodi = q.tutkosaa_pienempi_tt
LEFT JOIN dw.d_organisaatioluokitus d12 ON d12.organisaatio_oid = q.tunn_oid
LEFT JOIN dw.d_organisaatioluokitus d13 ON d13.organisaatio_oid = q.jarj_oid
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d13b ON d13b.oid_avain = q.jarj_oid
LEFT JOIN dw.d_organisaatioluokitus d13c ON d13c.organisaatio_oid = q.jarj_oid_hist
LEFT JOIN dw.d_organisaatioluokitus d13d ON d13d.organisaatio_oid = q.jarj_oid_pihvi
LEFT JOIN dw.d_organisaatioluokitus d13e ON d13e.organisaatio_oid = q.jarj_oid_pihvi_hist
LEFT JOIN dw.d_suorituksen_tyyppi d14 ON d14.koodi = q.suorituksen_tyyppi
LEFT JOIN dw.d_ammatillisen_tutkinnon_kustannusryhma d15 ON d15.koodi = q.kustannusryhma_uusi
LEFT JOIN dw.d_opintojenrahoitus d16 ON d16.koodi = q.opintojen_rahoitus
LEFT JOIN dw.d_osaamisala d17 ON d17.koodi = q.osaamisala
LEFT JOIN dw.d_organisaatioluokitus d18 ON d18.organisaatio_oid = q.toim_oid
LEFT JOIN dw.d_amos_spl_opiskelijavuodet_hylkaamisperuste d19 ON d19.koodi = q.hylkaamisen_peruste
LEFT JOIN dw.d_kytkin d20 ON d20.kytkin_koodi = q.osa_aikaisuus
LEFT JOIN dw.d_kytkin d25 ON d25.kytkin_koodi = (case when q.jarj_oid_pihvi is null then 0 else 1 end)
--LEFT JOIN (SELECT diaarinumero,siirtymapaattyy=max(siirtymapaattyy),voimassaololoppuu=max(coalesce(voimassaololoppuu,'9999-12-31')) FROM Koski_SA.SA.sa_eperusteet GROUP BY diaarinumero) ep on ep.diaarinumero = coalesce(q.diaarinumero_pihvi, q.diaarinumero)
--LINKITYS LUPATIETOIHIN ALKAA
LEFT JOIN dw.d_kytkin d21 ON d21.kytkin_koodi = 
(
	case 
		when (d11a.tutkintotyyppi_koodi = '02' and q.alkamispaiva >= '2018-08-01') or (d11a.tutkintotyyppi_koodi in ('19','20') and q.alkamispaiva >= '2019-01-01') then 1
		else 0 --tähän 1 jos vertailu halutaan tehdä kaikille opiskeluoikeuksille
	end
)
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki sjl ON sjl.oid_avain = coalesce(q.jarj_oid_pihvi_hist, q.jarj_oid_pihvi, q.jarj_oid_hist, q.jarj_oid)
--tutkinto-oikeudet
LEFT JOIN sa.sa_amos_oiva_tutkinto_oikeudet v1 ON (tilv_date between v1.alkupvm and coalesce(v1.siirtymapaattyy,v1.loppupvm)) 
	and coalesce(nullif(d11b.koulutusluokitus_fi,'Tieto puuttuu'),d11a.koulutusluokitus_fi) in (v1.tutkinto_nimi1, v1.tutkinto_nimi2, v1.tutkinto_nimi3, v1.tutkinto_nimi4, v1.tutkinto_nimi5)
	and v1.jarjestajaYtunnus = 
	(
		case 
			when tilv_date < sjl.voimaan_alkaen then sjl.ytunnus_avain
			else coalesce(sjl.ytunnus_amos_spl,sjl.ytunnus_avain)
		end
	)
--muut oikeudet
LEFT JOIN sa.v_amos_oiva_muut_oikeudet v2 ON tilv_date between v2.alkupvm and v2.loppupvm 
	and v2.jarjestajaYtunnus =
	(
		case 
			when tilv_date < sjl.voimaan_alkaen then sjl.ytunnus_avain
			else coalesce(sjl.ytunnus_amos_spl,sjl.ytunnus_avain)
		end
	)
--dimensiot
LEFT JOIN dw.d_amos_luvaton_koulutus d22 ON d22.koodi = 
(
	case 
		--katsotaan luvalliseksi jos pihvikoulutus on lukiokoulutusta
		when d21.kytkin_koodi = 0 or q.koulutusmuoto_pihvi = 'lukiokoulutus' or (year(q.alkamispaiva) < 2018 and coalesce(nullif(d11b.koulutusastetaso2_koodi,'-1'),d11a.koulutusastetaso2_koodi) in ('33','41')) then 1
		else 
			case
				when v1.jarjestajaYtunnus is null and q.koulk = '999903' then 9
				when v1.jarjestajaYtunnus is null and q.koulk = '999901' then 8
				when muu_ammatillinen_tarkenne = '94095' and q.oppis = 1 and v2.valmistava = 0 then 7
				when muu_ammatillinen_tarkenne = '94095' and q.oppis = 0 and v2.valmistava = 0 then 6
				when muu_ammatillinen_tarkenne = '94090' and q.oppis = 1 and v2.laaja_oppis = 0 then 5
				when muu_ammatillinen_tarkenne = '94090' and q.oppis = 0 and v2.laaja_oppis = 0 then 4
				when v1.jarjestajaYtunnus is null and muu_ammatillinen_tarkenne is null and q.oppis = 1 and v2.laaja_oppis = 0 then 3
				when v1.jarjestajaYtunnus is null and muu_ammatillinen_tarkenne is null and q.oppis = 0 then 2
				else 1
			end
	end
)
LEFT JOIN dw.d_amos_luvaton_majoitus d23 ON d23.koodi = 
(
	case
		when d21.kytkin_koodi = 0 then 1
		else
			case
				when q.majoitus = 3 and v2.sisaoppilaitosmuotoinen = 0 then 2
				else 1
			end
	end
)
LEFT JOIN dw.d_amos_luvaton_korotustekija d24 ON d24.koodi = 
(
	case 
		when d21.kytkin_koodi = 0 then 1
		else
			case
				when d10.kytkin_koodi = '1' and d11a.tutkintotyyppi_koodi in ('19','20') and v2.tyovoima = 0 then 2
				when d8.kytkin_koodi = '1' and v2.vankila = 0 then 3
				when d5.jarjestys_erityisopetus_ryhma = '3' and v2.erityinen_vaativa_tuki = 0 then 4
				else 1
			end
	end
)


GROUP BY 
q.vuosi
,d1.id
,d2.id
,d3.id
,d4.id
,d5.id
,d6.id
,d7.id
,d8.id
,d9.id
,d10.id
,d11a.id
,d11b.id
,d11c.id
,d12.id
,d13.id
,d13b.id
,d13c.id
,d13d.id
,d13e.id
,d14.id
,d15.id
,d16.id
,d17.id
,d18.id
,d19.id
,d20.id
,d21.id
,d22.id
,d23.id
,d24.id
,d25.id
,muu_ammatillinen_tarkenne

