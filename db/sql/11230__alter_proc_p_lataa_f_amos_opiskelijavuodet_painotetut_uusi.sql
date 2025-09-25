USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_uusi] @generoitu2 int = null
AS

--huom. opiskelijavuodet_painotettu_kr_ja_tt_yhteensa populoidaan vasta seuraavassa latausvaiheessa, samoin osin hylätyt korotukset

DECLARE @maxSuorituskausiLahtotaso varchar(24) = (select max(suorituskausi) from dw.v_TK_K1_16_lahtotaso)

DECLARE @generoitu int = @generoitu2

BEGIN
	DELETE FROM dw.f_amos_opiskelijavuodet_painotetut_uusi
	WHERE generoitu = @generoitu
END

INSERT INTO dw.f_amos_opiskelijavuodet_painotetut_uusi (
	generoitu
	,paivays
	,varainhoitovuosi
	,rahoituskausi
	,tilastovuosi
	,suorituskausi
    ,[d_kalenteri_tilastokuukausi_id]
    ,[d_kalenteri_alkamispaiva_id]
    ,[d_sukupuoli_id]
    ,[d_kieli_aidinkieli_id]
    ,[d_ika_id]
	,[d_amos_pohjakoulutus_toisen_asteen_pohjakoulutus_2018_id]
	,[d_amos_pohjakoulutus_toisen_asteen_tutkinto_2018_id]
	,[maksuttomuus]
	,[maksuttomuus_simulointi]
	,[maksuttomuus_koski]
	,perusopetuksen_suoritusvuosi
	,d_opintojen_kulku_keskiarvot_keskiarvoluokka_id
	,yksilollistaminen
    ,[d_osa_aikaisuus_id]
    ,[d_erityisopetus_id]
    ,[d_majoitus_id]
    ,[d_kytkin_oppisopimuskoulutus_id]
    ,[d_kytkin_vankilaopetus_id]
    ,[d_kytkin_henkilostokoulutus_id]
    ,[d_kytkin_tyovoimakoulutus_id]
    ,[d_koulutusluokitus_id]
	,[d_koulutusluokitus_tutk_osaa_pienempi_id]
    ,[d_organisaatioluokitus_oppilaitos_id]
    ,[d_organisaatioluokitus_jarj_id]
	,[d_organisaatioluokitus_jarj_hist_id]
	,[d_organisaatioluokitus_jarj_pihvi_id]
	,[d_organisaatioluokitus_jarj_pihvi_hist_id]
	,[d_organisaatioluokitus_toimipiste_id]
	,[d_amos_spl_jarjestaja_linkki_id]
    ,[d_kustannusryhma_id]
    ,[d_suorituksen_tyyppi_id]
	,[d_kieli_suoritus_id]
    ,[d_opintojenrahoitus_id]
	,[d_osaamisala_id]
	,[muu_ammatillinen_tarkenne]
	,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id]
	,[d_amos_luvaton_koulutus_id]
	,[d_amos_luvaton_majoitus_id]
	,[d_amos_luvaton_korotustekija_id]
	,[d_kieli_suoritus_luvanmukainen_id]
	,[d_kytkin_hankintakoulutus_id]
    ,[opiskelijavuodet_painottamaton]
	,[opiskelijavuodet_hylatty_painottamaton]
    ,[opiskelijavuodet_painotettu_lahtotaso]
    ,[opiskelijavuodet_painotettu_pt]
    ,[opiskelijavuodet_painotettu_at_eat]
    ,[opiskelijavuodet_painotettu_valma_telma]
    ,[opiskelijavuodet_painotettu_muu]
	,[opiskelijavuodet_painotettu_kr_ja_tt_yhteensa]
    ,[opiskelijavuodet_painotettu_erityistuki]
	,[opiskelijavuodet_painotettu_erityistuki_hyv]
    ,[opiskelijavuodet_painotettu_majoitus]
    ,[opiskelijavuodet_painotettu_majoitus_hyv]
	,jl.opv_vet_max
	,jl2.opv_ei_maksuton_max
	,ca.opv_ei_maksuton_kerroin
	,loadtime
)

SELECT 
	f.generoitu
	,f.paivays
	,f.varainhoitovuosi
	,f.rahoituskausi
	,[tilastovuosi] = f.[vuosi]
	,f.suorituskausi
	,[d_kalenteri_id]
	,[d_kalenteri_alkamispaiva_id]
	,[d_sukupuoli_id]
	,[d_kieli_aidinkieli_id]
	,[d_ika_id]
	,[d_amos_pohjakoulutus_toisen_asteen_pohjakoulutus_2018_id]
	,[d_amos_pohjakoulutus_toisen_asteen_tutkinto_2018_id]
	,[maksuttomuus]
	,[maksuttomuus_simulointi]
	,[maksuttomuus_koski]
	,perusopetuksen_suoritusvuosi
	,d_opintojen_kulku_keskiarvot_keskiarvoluokka_id
	,yksilollistaminen
	,[d_osa_aikaisuus_id]
	,[d_erityisopetus_id]
	,[d_majoitus_id]
	,[d_kytkin_oppisopimuskoulutus_id]
	,[d_kytkin_vankilaopetus_id]
	,[d_kytkin_henkilostokoulutus_id]
	,[d_kytkin_tyovoimakoulutus_id]
	,[d_koulutusluokitus_id]
	,[d_koulutusluokitus_tutk_osaa_pienempi_id]
	,[d_organisaatioluokitus_oppilaitos_id]
	,f.[d_organisaatioluokitus_jarj_id]
	,[d_organisaatioluokitus_jarj_hist_id]
	,[d_organisaatioluokitus_jarj_pihvi_id]
	,[d_organisaatioluokitus_jarj_pihvi_hist_id]
	,[d_organisaatioluokitus_toimipiste_id]
	,f.[d_amos_spl_jarjestaja_linkki_id]
	,[d_kustannusryhma_uusi_id] --[d_kustannusryhma_id]
	,[d_suorituksen_tyyppi_id]
	,[d_kieli_suoritus_id]
	,[d_opintojenrahoitus_id]
	,[d_osaamisala_id]
	,[muu_ammatillinen_tarkenne]
	,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id]
	,[d_amos_luvaton_koulutus_id]
	,[d_amos_luvaton_majoitus_id]
	,[d_amos_luvaton_korotustekija_id]
	,[d_kieli_suoritus_luvanmukainen_id]
	,[d_kytkin_hankintakoulutus_id]	

	,[opiskelijavuodet_painottamaton] = cast([opiskelijavuodet] + [opiskelijavuodet_hylatyt] as decimal(30,20))
	,[opiskelijavuodet_hylatty_painottamaton] = [opiskelijavuodet_hylatyt]

	--lt
	,[opiskelijavuodet_painotettu_lahtotaso] = --ca.opv_ei_maksuton_kerroin * 
		(case when maksuttomuus = 1 then lt_ka.opv_kerroin else coalesce(lt_pk.opv_kerroin, oa.opv_kerroin_kaikki) end) * [opiskelijavuodet]
		
	--kr ja tt
	,[opiskelijavuodet_painotettu_pt] = --ca.opv_ei_maksuton_kerroin * 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_9' and f.varainhoitovuosi = u.varainhoitovuosi) 
		* ( 
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' then opiskelijavuodet else 0 end)
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' then opiskelijavuodet else 0 end)
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' then opiskelijavuodet else 0 end)
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' then opiskelijavuodet else 0 end)
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' then opiskelijavuodet else 0 end)
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_6' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='6' then opiskelijavuodet else 0 end)
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_7' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='7' then opiskelijavuodet else 0 end)
		)
	,[opiskelijavuodet_painotettu_at_eat] = --ca.opv_ei_maksuton_kerroin * 
		(
			(select case when d4.kytkin_koodi = '1' then perusrahoitus else 0.0 end from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_9' and f.varainhoitovuosi = u.varainhoitovuosi)
			+ (select case when d4.kytkin_koodi != '1' then perusrahoitus else 0.0 end from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.varainhoitovuosi = u.varainhoitovuosi)
		) 
		* ( 
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' then opiskelijavuodet else 0 end)
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' then opiskelijavuodet else 0 end)
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' then opiskelijavuodet else 0 end)
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' then opiskelijavuodet else 0 end)
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' then opiskelijavuodet else 0 end)
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_6' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='6' then opiskelijavuodet else 0 end)
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_7' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='7' then opiskelijavuodet else 0 end)
		)
	,[opiskelijavuodet_painotettu_valma_telma] = --ca.opv_ei_maksuton_kerroin * 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d2.koodi='vt' then opiskelijavuodet else 0 end)
	,[opiskelijavuodet_painotettu_muu] = --ca.opv_ei_maksuton_kerroin * 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_9' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d2.koodi='muu' and d4.kytkin_koodi = '1' then opiskelijavuodet else 0 end)
		+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_10' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d2.koodi='muu' and d4.kytkin_koodi != '1' then opiskelijavuodet else 0 end)
	,[opiskelijavuodet_painotettu_kr_ja_tt_yhteensa] = cast(0.0 as decimal(30,20))

	--korotukset
	,[opiskelijavuodet_painotettu_erityistuki] = --ca.opv_ei_maksuton_kerroin * (
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_21' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d6.erityisopetus_koodi in ('4','5','6') then opiskelijavuodet else 0 end)
		+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_22' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d6.erityisopetus_koodi in ('7','8','9') and d1.koulutusluokitus_koodi in ('999901','999908') then opiskelijavuodet else 0 end)
		+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_23' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d6.erityisopetus_koodi in ('7','8','9') and d1.koulutusluokitus_koodi='999903' then opiskelijavuodet else 0 end)
		--)
	,[opiskelijavuodet_painotettu_erityistuki_hyv] = --ca.opv_ei_maksuton_kerroin * 
		--leikataan enimmäismäärän ylittävässä suhteessa
		ca.opv_vet_kerroin
		* (
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_21' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d6.erityisopetus_koodi in ('4','5','6') then opiskelijavuodet else 0 end) 
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_22' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d6.erityisopetus_koodi in ('7','8','9') and d1.koulutusluokitus_koodi in ('999901','999908') then opiskelijavuodet else 0 end) 
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_23' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d6.erityisopetus_koodi in ('7','8','9') and d1.koulutusluokitus_koodi='999903' then opiskelijavuodet else 0 end) 
		)
	,[opiskelijavuodet_painotettu_majoitus] = --ca.opv_ei_maksuton_kerroin * (
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d7.majoitus_koodi='2' then opiskelijavuodet else 0 end)
		+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='majoitusetu' and kerroin_koodi='me_22' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d7.majoitus_koodi='3' then opiskelijavuodet else 0 end)
		+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='majoitusetu' and kerroin_koodi='me_23' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d7.majoitus_koodi='4' then opiskelijavuodet else 0 end)	
	,[opiskelijavuodet_painotettu_majoitus_hyv] = --ca.opv_ei_maksuton_kerroin * (
		--ohjataan luvaton sisäoppilaitosmuotoinen majoitus tavallisen majoituksen kertoimeen
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d7.majoitus_koodi='2' or (d11.koodi='2' and d7.majoitus_koodi='3') then opiskelijavuodet else 0 end)
		+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='majoitusetu' and kerroin_koodi='me_22' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d7.majoitus_koodi='3' and d11.koodi='1' then opiskelijavuodet else 0 end)
		+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi u where kerroin_luokka='majoitusetu' and kerroin_koodi='me_23' and f.varainhoitovuosi = u.varainhoitovuosi) * (case when d7.majoitus_koodi='4' then opiskelijavuodet else 0 end)
		--)

	,jl.opv_vet_max
	,jl2.opv_ei_maksuton_max
	,ca.opv_ei_maksuton_kerroin

	,getdate()
	
FROM [dw].[f_amos_opiskelijavuodet_uusi] f 
left join dw.d_amos_spl_jarjestaja_linkki d0 on d0.id = f.d_amos_spl_jarjestaja_linkki_id
left join dw.d_koulutusluokitus d1 on d1.id = coalesce(nullif(f.d_koulutusluokitus_tutk_osaa_pienempi_id,'-1'), f.d_koulutusluokitus_id)
left join dw.d_ammatillisen_tutkinnon_kustannusryhma d2 on d2.id = f.d_kustannusryhma_uusi_id
left join dw.d_kytkin d3 on d3.id = f.d_kytkin_vankilaopetus_id
left join dw.d_kytkin d4 on d4.id = f.d_kytkin_tyovoimakoulutus_id
left join dw.d_kytkin d5 on d5.id = f.d_kytkin_henkilostokoulutus_id
left join dw.d_erityisopetus d6 on d6.id = f.d_erityisopetus_id
left join dw.d_majoitus d7 on d7.id = f.d_majoitus_id
left join dw.d_amos_luvaton_korotustekija d8 on d8.id = f.d_amos_luvaton_korotustekija_id
left join dw.d_organisaatioluokitus d9 on d9.id = f.d_organisaatioluokitus_jarj_id
left join dw.d_kalenteri d10 on d10.id = f.d_kalenteri_id
left join dw.d_amos_luvaton_majoitus d11 on d11.id = f.d_amos_luvaton_majoitus_id
left join dw.d_ika d12 on d12.id = f.d_ika_id
left join dw.d_suorituksen_tyyppi d14 on d14.id = f.d_suorituksen_tyyppi_id	

--enimmäismääriin verrattavat opiskelijavuosikertymät per rahoituskausi
left join (
	select 
		f.varainhoitovuosi
		,ytunnus = coalesce(d.ytunnus_amos_spl, d.ytunnus_avain) 
		,opv_ei_maksuton_ka = 0.5 * sum(case when f.maksuttomuus = 0 then opiskelijavuodet end)
		,opv_vet_ka = 0.5 * sum(case when d1.jarjestys_erityisopetus_ryhma = 3 then opiskelijavuodet end)
	from dw.f_amos_opiskelijavuodet_uusi f
	left join dw.d_amos_spl_jarjestaja_linkki d on d.id = f.d_amos_spl_jarjestaja_linkki_id
	left join dw.d_erityisopetus d1 on d1.id = f.d_erityisopetus_id
	left join dw.d_majoitus d1b on d1b.id = f.d_majoitus_id
	left join dw.d_amos_luvaton_koulutus d2 on d2.id = f.d_amos_luvaton_koulutus_id
	left join dw.d_kieli d3 on d3.id = f.d_kieli_suoritus_luvanmukainen_id
	left join dw.d_ammatillisen_tutkinnon_kustannusryhma d3b on d3b.id = f.d_kustannusryhma_uusi_id
	left join dw.d_opintojenrahoitus d4 on d4.id = f.d_opintojenrahoitus_id
	where 1=1
	and f.generoitu = @generoitu
	and d2.koodi = 1 
	and (d3.kieli_koodi != '-2' or d3b.koodi = 'muu') 
	and d4.sisaltyy_okm_perusrahoitus = 1
	group by f.varainhoitovuosi, coalesce(d.ytunnus_amos_spl, d.ytunnus_avain)
) opv_ka
	on opv_ka.varainhoitovuosi = f.varainhoitovuosi 
	and opv_ka.ytunnus = coalesce(d0.ytunnus_amos_spl, d0.ytunnus_avain) 
		
--lähtötasokertoimet maksuttomuuden mukaan
--1: maksuttomat perusop. päättötodistuksen mukaan
left join dw.d_opintojen_kulku_keskiarvot lt_ka on lt_ka.id = f.d_opintojen_kulku_keskiarvot_keskiarvoluokka_id 
--2a: ei maksuttomat TK-aineistosta
left join dw.v_TK_K1_16_lahtotaso lt_pk 
	on lt_pk.suorituskausi = case when right(f.suorituskausi, 4) > right(@maxSuorituskausiLahtotaso, 4) then @maxSuorituskausiLahtotaso else f.suorituskausi end
	--and lt_pk.rahoituskausi = f.rahoituskausi --tuleviin aineistoihin koko 2-v. rahoituskaúsi
	and lt_pk.ytunnus = coalesce(d0.ytunnus_amos_spl, d0.ytunnus_avain) 
--2b: ei maksuttomat, jos järjestäjälle ei edellä löydy pohjakoulutusosuutta
cross apply (
	select 
		opv_kerroin_kaikki = cast(avg(opv_kerroin_kaikki) as decimal(30, 20))
	from dw.v_TK_K1_16_lahtotaso 
	where 1=1
	and suorituskausi = (case when right(f.suorituskausi,4) > right(@maxSuorituskausiLahtotaso,4) then @maxSuorituskausiLahtotaso else f.suorituskausi end) 
	--and rahoituskausi = f.rahoituskausi --tuleviin aineistoihin koko 2-v. rahoituskaúsi
) oa

--varainhoitovuoden alun järjestämislupien enimmäismäärät
outer apply (
	select 
		opv_vet_max = sum(v.vaativa_erityinen_tuki)
		--,opv_ei_maksuton_max = sum(v..)
	from sa.v_amos_oiva_opiskelijavuodet_rajoite v
	left join dw.d_amos_spl_jarjestaja_linkki d on d.ytunnus_avain = v.jarjestajaYtunnus
	where 1=1
	and datefromparts(f.varainhoitovuosi, 1, 1) between v.alkuPvm and v.loppuPvm
	and coalesce(d.ytunnus_amos_spl, d.ytunnus_avain) = coalesce(d0.ytunnus_amos_spl, d0.ytunnus_avain)
	and v.vaativa_erityinen_tuki > 0 --1.1.2026 Spesia ja Luovi
) jl 
--ei maksuttomien enimmäismäärä (lopulta edellä Oivasta)
outer apply (
	select 
		opv_ei_maksuton_max = t.[Ei_maksuttoman_koulutuksen_enimmäismäärä]
	from sa.sa_amos_ei_maksuttoman_koulutuksen_enimmaismaarat t
	left join dw.d_amos_spl_jarjestaja_linkki d on d.ytunnus_avain = t.Y_tunnus 
	where coalesce(d.ytunnus_amos_spl, d.ytunnus_avain) = coalesce(d0.ytunnus_amos_spl, d0.ytunnus_avain)	
) jl2 
	
--enimmäismäärien ja kertymien määräämät kertoimet
outer apply (
	select 
		opv_ei_maksuton_kerroin = 
			cast(
				case 
					when f.maksuttomuus = 1 then 1.0
					when opv_ka.opv_ei_maksuton_ka > jl2.opv_ei_maksuton_max then jl2.opv_ei_maksuton_max / opv_ka.opv_ei_maksuton_ka
					else 1.0
				end
				as decimal(30,29)
			)
		,opv_vet_kerroin = 
			cast(
				case
					when d6.jarjestys_erityisopetus_ryhma != 3 then 1.0
					when opv_ka.opv_vet_ka > jl.opv_vet_max then jl.opv_vet_max / opv_ka.opv_vet_ka
					else 1.0
				end
				as decimal(30,29)
			)
) ca

WHERE f.generoitu = @generoitu

GO
