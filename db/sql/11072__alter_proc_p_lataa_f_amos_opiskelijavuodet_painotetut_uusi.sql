USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_uusi] @generoitu2 int = null
AS

DECLARE @maxSuorituskausiLahtotaso varchar(24) = (select max(suorituskausi) from dw.v_TK_K1_16_lahtotaso)

DECLARE @generoitu int = @generoitu2

BEGIN
	DELETE FROM dw.f_amos_opiskelijavuodet_painotetut_uusi
	WHERE generoitu = @generoitu
END

INSERT INTO dw.f_amos_opiskelijavuodet_painotetut_uusi (
	generoitu
	,paivays
	,rahoituskausi
	,[tilastovuosi]
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
	,keskiarvo_lahde
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
	,[d_kytkin_sisaopp_ov_ylittyy_id]
	,[d_kytkin_erityistuen_ov_ylittyy_id]
	,[d_kytkin_oppivelvollisuus_id]
    ,[opiskelijavuodet_painottamaton]
    ,[opiskelijavuodet_painotettu_lahtotaso]
    ,[opiskelijavuodet_painotettu_pt]
    ,[opiskelijavuodet_painotettu_at_eat]
    ,[opiskelijavuodet_painotettu_valma_telma]
    ,[opiskelijavuodet_painotettu_muu]
    ,[opiskelijavuodet_painotettu_erityistuki]
	,[opiskelijavuodet_painotettu_erityistuki_hyv]
    ,[opiskelijavuodet_painotettu_majoitus]
	,[opiskelijavuodet_painotettu_majoitus_hyv]
	,[opiskelijavuodet_hylatyt]
	,jl.opv_som_max
	,jl.opv_vet_max
	,jl2.opv_ei_maksuton_max
	,ca.opv_ei_maksuton_kerroin
	,[opiskelijavuodet_painotettu_yhteensa]
	,loadtime
)

SELECT  
	*
	,[opiskelijavuodet_painotettu_yhteensa] = 0.0 --[opiskelijavuodet_painotettu_lahtotaso] +
		/*[opiskelijavuodet_painotettu_pt] 
		+ [opiskelijavuodet_painotettu_at_eat] 
		+ [opiskelijavuodet_painotettu_valma_telma] 
		+ [opiskelijavuodet_painotettu_muu] 
		+ [opiskelijavuodet_painotettu_erityistuki_hyv] 
		+ [opiskelijavuodet_painotettu_majoitus_hyv]*/
	,GETDATE()

FROM (

	SELECT 
		f.generoitu
		,f.paivays
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
		,keskiarvo_lahde
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
		,[d_kytkin_sisaopp_ov_ylittyy_id] = -1 --case when coalesce(opv_ka.opv_som_ka, 0) > coalesce(jl.opv_som_max, 999999) then 1 else 2 end
		,[d_kytkin_erityistuen_ov_ylittyy_id] = case when coalesce(opv_ka.opv_vet_ka, 0) > coalesce(jl.opv_vet_max,999999) then 1 else 2 end
		,[d_kytkin_oppivelvollisuus_id] = -1 --d13.id

		,[opiskelijavuodet_painottamaton] = [opiskelijavuodet]
		,[opiskelijavuodet_painotettu_lahtotaso] = --ca.opv_ei_maksuton_kerroin * 
			(case when maksuttomuus = 1 then lt_ka.opv_kerroin else coalesce(lt_pk.opv_kerroin, oa.opv_kerroin_kaikki) end) * [opiskelijavuodet]
		,[opiskelijavuodet_painotettu_pt] = --ca.opv_ei_maksuton_kerroin * 
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_9' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) 
			* ( 
				(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_6' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='6' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_7' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='7' then opiskelijavuodet else 0 end)
			)

		,[opiskelijavuodet_painotettu_at_eat] = --ca.opv_ei_maksuton_kerroin * 
			(
				(select case when d4.kytkin_koodi = '1' then perusrahoitus else 0.0 end from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_9' and right(f.rahoituskausi,4)+1 = varainhoitovuosi)
				+ (select case when d4.kytkin_koodi != '1' then perusrahoitus else 0.0 end from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and right(f.rahoituskausi,4)+1 = varainhoitovuosi)
			) 
			* ( 
				(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_6' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='6' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_7' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='7' then opiskelijavuodet else 0 end)
			)

		,[opiskelijavuodet_painotettu_valma_telma] = --ca.opv_ei_maksuton_kerroin * 
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d2.koodi='vt' then opiskelijavuodet else 0 end)

		,[opiskelijavuodet_painotettu_muu] = --ca.opv_ei_maksuton_kerroin * 
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_9' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d2.koodi='muu' and d4.kytkin_koodi = '1' then opiskelijavuodet else 0 end)
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_10' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d2.koodi='muu' and d4.kytkin_koodi != '1' then opiskelijavuodet else 0 end)
			
		,[opiskelijavuodet_painotettu_erityistuki] = --ca.opv_ei_maksuton_kerroin * (
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_21' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d6.erityisopetus_koodi in ('4','5','6') then opiskelijavuodet else 0 end)
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_22' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d6.erityisopetus_koodi in ('7','8','9') and d1.koulutusluokitus_koodi in ('999901','999908') then opiskelijavuodet else 0 end)
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_23' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d6.erityisopetus_koodi in ('7','8','9') and d1.koulutusluokitus_koodi='999903' then opiskelijavuodet else 0 end)
			--)
		,[opiskelijavuodet_painotettu_erityistuki_hyv] = --ca.opv_ei_maksuton_kerroin * 
			ca.opv_vet_kerroin
			* (
				(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_21' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d6.erityisopetus_koodi in ('4','5','6') then opiskelijavuodet else 0 end) 
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_22' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d6.erityisopetus_koodi in ('7','8','9') and d1.koulutusluokitus_koodi in ('999901','999908') then opiskelijavuodet else 0 end) 
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_23' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d6.erityisopetus_koodi in ('7','8','9') and d1.koulutusluokitus_koodi='999903' then opiskelijavuodet else 0 end) 
			)

		,[opiskelijavuodet_painotettu_majoitus] = --ca.opv_ei_maksuton_kerroin * (
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d7.majoitus_koodi='2' then opiskelijavuodet else 0 end)
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='majoitusetu' and kerroin_koodi='me_22' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d7.majoitus_koodi='3' then opiskelijavuodet else 0 end)
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='majoitusetu' and kerroin_koodi='me_23' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d7.majoitus_koodi='4' then opiskelijavuodet else 0 end)
			--)
		,[opiskelijavuodet_painotettu_majoitus_hyv] = --ca.opv_ei_maksuton_kerroin * (
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d7.majoitus_koodi='2' then opiskelijavuodet else 0 end)
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='majoitusetu' and kerroin_koodi='me_22' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d7.majoitus_koodi='3' then opiskelijavuodet else 0 end)
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='majoitusetu' and kerroin_koodi='me_23' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) * (case when d7.majoitus_koodi='4' then opiskelijavuodet else 0 end)
			--)
			/*
			--ca.opv_ei_maksuton_kerroin * (
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) 
				* (case when d7.majoitus_koodi='2' then opiskelijavuodet when d7.majoitus_koodi='3' then (1.0 - ca.opv_som_kerroin) * opiskelijavuodet else 0 end) 
			+ (case when d11.koodi = 2 then (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) 
				else (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='majoitusetu' and kerroin_koodi='me_22' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) end) 
				* (case when d7.majoitus_koodi='3' then ca.opv_som_kerroin * opiskelijavuodet else 0 end)
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7_uusi where kerroin_luokka='majoitusetu' and kerroin_koodi='me_23' and right(f.rahoituskausi,4)+1 = varainhoitovuosi) 
				* (case when d7.majoitus_koodi='4' then opiskelijavuodet else 0 end)
			--)
			*/

		,[opiskelijavuodet_hylatyt]
		
		,jl.opv_som_max
		,jl.opv_vet_max
		,jl2.opv_ei_maksuton_max
		,ca.opv_ei_maksuton_kerroin
		
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
			rahoituskausi
			,ytunnus = coalesce(d.ytunnus_amos_spl, d.ytunnus_avain) 
			,opv_ei_maksuton_ka = 0.5 * sum(case when f.maksuttomuus = 0 then opiskelijavuodet end)
			--,opv_maksuton_ka = 0.5 * sum(case when f.maksuttomuus_simulointi = 1 then opiskelijavuodet end) --HUOM. vain ei maksuttomien enimmäismäärää varten, joka lopulta Oivasta
			,opv_vet_ka = 0.5 * sum(case when d1.jarjestys_erityisopetus_ryhma = 3 then opiskelijavuodet end)
			--,opv_som_ka = 0.5 * sum(case when d1b.majoitus_koodi = '3' then opiskelijavuodet end)
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
		group by rahoituskausi, coalesce(d.ytunnus_amos_spl, d.ytunnus_avain)
	) opv_ka
		on opv_ka.rahoituskausi = f.rahoituskausi 
		and opv_ka.ytunnus = coalesce(d0.ytunnus_amos_spl, d0.ytunnus_avain) 
		
	--lähtötasokertoimet maksuttomuuden mukaan
	left join dw.d_opintojen_kulku_keskiarvot lt_ka on lt_ka.id = f.d_opintojen_kulku_keskiarvot_keskiarvoluokka_id --maksuttomat perusop. päättötodistuksen mukaan
	left join dw.v_TK_K1_16_lahtotaso lt_pk --ei maksuttomat
		on lt_pk.suorituskausi = case when right(f.suorituskausi, 4) > right(@maxSuorituskausiLahtotaso, 4) then @maxSuorituskausiLahtotaso else f.suorituskausi end
		--and lt_pk.rahoituskausi = f.rahoituskausi --tuleviin aineistoihin aina koko 2-v. rahoituskaúsi
		and lt_pk.ytunnus = coalesce(d0.ytunnus_amos_spl, d0.ytunnus_avain) 
	--jos järjestäjälle ei löydy pohjakoulutustietoa, käytetään koko aineiston jakaumaa
	cross apply (
		select 
			opv_kerroin_kaikki = cast(avg(opv_kerroin_kaikki) as decimal(30, 20))
		from dw.v_TK_K1_16_lahtotaso 
		where 1=1
		and suorituskausi = (case when right(f.suorituskausi,4) > right(@maxSuorituskausiLahtotaso,4) then @maxSuorituskausiLahtotaso else f.suorituskausi end) 
	) oa
		
	--tavoitteelliset opiskelijavuodet; HUOM. vain ei maksuttomien enimmäismäärää varten, joka lopulta Oivasta
	/*
	left join (
		select
			varainhoitovuosi = v.Vuosi
			,ytunnus = coalesce(d.ytunnus_amos_spl, d.ytunnus_avain)
			,opv_tavoite = 1.0 * sum([arvo])
		from [dw].[v_amos_suoritepaatokset] v
		left join dw.d_amos_spl_jarjestaja_linkki d on d.ytunnus_avain = v.[Y-tunnus]
		where 1=1 
		and v.[Lukumäärätieto] = 'Tavoitteellinen opiskelijavuosimäärä yhteensä' 
		and v.raportti = 'rahoitusperusteet_ja_myonnetty_rahoitus'
		group by v.Vuosi, coalesce(d.ytunnus_amos_spl, d.ytunnus_avain)

		union all

		--kesken olevalle rahoituskaudelle viimeisin tieto
		select
			varainhoitovuosi = (select max(Vuosi) from [dw].[v_amos_suoritepaatokset])+1
			,ytunnus = coalesce(d.ytunnus_amos_spl, d.ytunnus_avain)
			,opv_tavoite = 1.0 * sum([arvo])
		from [dw].[v_amos_suoritepaatokset] v
		left join dw.d_amos_spl_jarjestaja_linkki d on d.ytunnus_avain = v.[Y-tunnus]
		where 1=1 
		and v.[Lukumäärätieto] = 'Tavoitteellinen opiskelijavuosimäärä yhteensä' 
		and v.raportti = 'rahoitusperusteet_ja_myonnetty_rahoitus'
		and v.Vuosi = (select max(Vuosi) from [dw].[v_amos_suoritepaatokset])
		group by coalesce(d.ytunnus_amos_spl, d.ytunnus_avain)
	) tav 
		on tav.varainhoitovuosi = right(f.rahoituskausi,4)+1 
		and tav.ytunnus = coalesce(d0.ytunnus_amos_spl, d0.ytunnus_avain) 
	*/
		
	--kuukauden alun järjestämislupien enimmäismäärät
	outer apply (
		select 
			opv_vet_max = sum(v.vaativa_erityinen_tuki)
			,opv_som_max = null --sum(v.sisaoppilaitosmuotoinen)
		from sa.v_amos_oiva_opiskelijavuodet_rajoite v
		left join dw.d_amos_spl_jarjestaja_linkki d on d.ytunnus_avain = v.jarjestajaYtunnus
		where 1=1
		and d10.paivays between v.alkuPvm and v.loppuPvm
		and coalesce(d.ytunnus_amos_spl, d.ytunnus_avain) = coalesce(d0.ytunnus_amos_spl, d0.ytunnus_avain)
	) jl 
	
	--ei maksuttomien enimmäismäärä; HUOM. lopulta edellä Oivasta
	outer apply (
		select 
			opv_ei_maksuton_max = t.[Ei_maksuttoman_koulutuksen_enimmäismäärä]
		from sa.sa_amos_ei_maksuttoman_koulutuksen_enimmaismaarat t
		left join dw.d_amos_spl_jarjestaja_linkki d on d.ytunnus_avain = t.Y_tunnus 
		where coalesce(d.ytunnus_amos_spl, d.ytunnus_avain) = coalesce(d0.ytunnus_amos_spl, d0.ytunnus_avain)	
		/*
			case 
				when tav.opv_tavoite > coalesce(opv_ka.opv_maksuton_ka, 0.0) then tav.opv_tavoite - coalesce(opv_ka.opv_maksuton_ka, 0.0)
				else 0.0
			end 
		*/
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
			,opv_som_kerroin = 1.0 /*
				--huom. komplementtia käytetään ylimenevään osaan tavallisen majoituksen kertoimella
				cast(
					case
						when d7.majoitus_koodi != '3' then 1.0
						when opv_ka.opv_som_ka > jl.opv_som_max then jl.opv_som_max / opv_ka.opv_som_ka
						else 1.0
					end
					as decimal(30,29)
				)
			*/
	) ca

	WHERE f.generoitu = @generoitu

) q

GO
