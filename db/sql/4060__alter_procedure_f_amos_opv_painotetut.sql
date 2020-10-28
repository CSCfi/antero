USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut]    Script Date: 27.10.2020 17:52:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




ALTER PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut] AS


TRUNCATE TABLE [ANTERO].[dw].[f_amos_opiskelijavuodet_painotetut]

INSERT INTO dw.f_amos_opiskelijavuodet_painotetut (
	 [tilastovuosi]
    ,[d_kalenteri_tilastokuukausi_id]
    ,[d_sukupuoli_id]
    ,[d_kieli_aidinkieli_id]
    ,[d_ika_id]
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
    ,[d_opintojenrahoitus_id]
	,[d_osaamisala_id]
	,[muu_ammatillinen_tarkenne]
	,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id]
	,[d_amos_luvaton_koulutus_id]
	,[d_amos_luvaton_majoitus_id]
	,[d_amos_luvaton_korotustekija_id]
	,[d_kytkin_hankintakoulutus_id]
	,[d_kytkin_sisaopp_ov_ylittyy_id]
	,[d_kytkin_erityistuen_ov_ylittyy_id]
	,[d_kytkin_oppivelvollisuus_id]
    ,[opiskelijavuodet_painottamaton]
    ,[opiskelijavuodet_painotettu_pt]
    ,[opiskelijavuodet_painotettu_at_eat]
    ,[opiskelijavuodet_painotettu_valma_telma]
    ,[opiskelijavuodet_painotettu_opisk_valm_tukevat]
    ,[opiskelijavuodet_painotettu_muu]
    ,[opiskelijavuodet_painotettu_erityistuki]
	,[opiskelijavuodet_painotettu_erityistuki_hyv]
    ,[opiskelijavuodet_painotettu_majoitus]
	,[opiskelijavuodet_painotettu_majoitus_hyv]
    ,[opiskelijavuodet_painotettu_henkilostokoulutus]
    ,[opiskelijavuodet_painotettu_tyovoimakoulutus]
    ,[opiskelijavuodet_painotettu_vankilaopetus]
	,[opiskelijavuodet_painotettu_oppivelvollisuus]
	,[opiskelijavuodet_hylatyt]
	,[opiskelijavuodet_painotettu_yhteensa]
	,loadtime
)

SELECT  
	 *
	,[opiskelijavuodet_painotettu_yhteensa] = [opiskelijavuodet_painotettu_pt] + [opiskelijavuodet_painotettu_at_eat] + [opiskelijavuodet_painotettu_valma_telma] + [opiskelijavuodet_painotettu_opisk_valm_tukevat] + [opiskelijavuodet_painotettu_muu] + [opiskelijavuodet_painotettu_erityistuki] + [opiskelijavuodet_painotettu_majoitus] + [opiskelijavuodet_painotettu_henkilostokoulutus] + [opiskelijavuodet_painotettu_tyovoimakoulutus] + [opiskelijavuodet_painotettu_vankilaopetus]
	,GETDATE()

FROM (

	SELECT 
		[tilastovuosi] = f.[vuosi]
		,[d_kalenteri_id]
		,[d_sukupuoli_id]
		,[d_kieli_aidinkieli_id]
		,[d_ika_id]
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
		,[d_amos_spl_jarjestaja_linkki_id]
		,[d_kustannusryhma_id]
		,[d_suorituksen_tyyppi_id]
		,[d_opintojenrahoitus_id]
		,[d_osaamisala_id]
		,[muu_ammatillinen_tarkenne]
		,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id]
		,[d_amos_luvaton_koulutus_id]
		,[d_amos_luvaton_majoitus_id]
		,[d_amos_luvaton_korotustekija_id]
		,[d_kytkin_hankintakoulutus_id]	
		,[d_kytkin_sisaopp_ov_ylittyy_id] = case when coalesce(som.ov_sisa,0) > coalesce(jl.sisaoppilaitosmuotoinen,999999) then 1 else 2 end
		,[d_kytkin_erityistuen_ov_ylittyy_id] = case when coalesce(vet.ov,0) > coalesce(jl.vaativa_erityinen_tuki,999999) then 1 else 2 end
		,[d_kytkin_oppivelvollisuus_id] = d13.id

		,[opiskelijavuodet_painottamaton] = [opiskelijavuodet]
		,[opiskelijavuodet_painotettu_pt] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_9' and f.vuosi+2 = varainhoitovuosi) *
			( 
					(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' then opiskelijavuodet else 0 end)
			)

		,[opiskelijavuodet_painotettu_at_eat] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.vuosi+2 = varainhoitovuosi) *
			( 
					(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' then opiskelijavuodet else 0 end)
			)

		,[opiskelijavuodet_painotettu_valma_telma] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_6' and f.vuosi+2 = varainhoitovuosi) * (case when d2.koodi='vt' then opiskelijavuodet else 0 end)

		,[opiskelijavuodet_painotettu_opisk_valm_tukevat] =
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_7' and f.vuosi+2 = varainhoitovuosi) * (case when d2.koodi='ot' then opiskelijavuodet else 0 end)

		,[opiskelijavuodet_painotettu_muu] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and f.vuosi+2 = varainhoitovuosi) * (case when d2.koodi='muu' then opiskelijavuodet else 0 end)
			

		,[opiskelijavuodet_painotettu_erityistuki] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_13' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='2' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_14' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='3' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_15' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='4' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_16' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='5' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_17' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='6' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_18' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='7' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_19' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='8' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_20' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='9' then opiskelijavuodet else 0 end)
	
		,[opiskelijavuodet_painotettu_erityistuki_hyv] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_13' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='2' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_14' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='3' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_15' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='4' and (coalesce(vet.ov,0) <= coalesce(jl.vaativa_erityinen_tuki,0) or coalesce(jl.vaativa_erityinen_tuki,0)=0) then opiskelijavuodet when d6.erityisopetus_koodi='4' and coalesce(vet.ov,0) > coalesce(jl.vaativa_erityinen_tuki,0) then opiskelijavuodet*(jl.vaativa_erityinen_tuki/vet.ov) else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_16' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='5' and (coalesce(vet.ov,0) <= coalesce(jl.vaativa_erityinen_tuki,0) or coalesce(jl.vaativa_erityinen_tuki,0)=0) then opiskelijavuodet when d6.erityisopetus_koodi='5' and coalesce(vet.ov,0) > coalesce(jl.vaativa_erityinen_tuki,0) then opiskelijavuodet*(jl.vaativa_erityinen_tuki/vet.ov) else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_17' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='6' and (coalesce(vet.ov,0) <= coalesce(jl.vaativa_erityinen_tuki,0) or coalesce(jl.vaativa_erityinen_tuki,0)=0) then opiskelijavuodet when d6.erityisopetus_koodi='6' and coalesce(vet.ov,0) > coalesce(jl.vaativa_erityinen_tuki,0) then opiskelijavuodet*(jl.vaativa_erityinen_tuki/vet.ov) else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_18' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='7' and (coalesce(vet.ov,0) <= coalesce(jl.vaativa_erityinen_tuki,0) or coalesce(jl.vaativa_erityinen_tuki,0)=0) then opiskelijavuodet when d6.erityisopetus_koodi='7' and coalesce(vet.ov,0) > coalesce(jl.vaativa_erityinen_tuki,0) then opiskelijavuodet*(jl.vaativa_erityinen_tuki/vet.ov) else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_19' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='8' and (coalesce(vet.ov,0) <= coalesce(jl.vaativa_erityinen_tuki,0) or coalesce(jl.vaativa_erityinen_tuki,0)=0) then opiskelijavuodet when d6.erityisopetus_koodi='8' and coalesce(vet.ov,0) > coalesce(jl.vaativa_erityinen_tuki,0) then opiskelijavuodet*(jl.vaativa_erityinen_tuki/vet.ov) else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_20' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='9' and (coalesce(vet.ov,0) <= coalesce(jl.vaativa_erityinen_tuki,0) or coalesce(jl.vaativa_erityinen_tuki,0)=0) then opiskelijavuodet when d6.erityisopetus_koodi='9' and coalesce(vet.ov,0) > coalesce(jl.vaativa_erityinen_tuki,0) then opiskelijavuodet*(jl.vaativa_erityinen_tuki/vet.ov) else 0 end)
		-- luvan ylittäviltä vaativan erityisen tuen koulutuksen opiskelijavuosilta otetaan pois vaativan erityisen tuen painotus, muutetaan tavallisiksi opiskelijavuosiksi
		--+	(case when d6.jarjestys_erityisopetus_ryhma = '3' and coalesce(vet.ov,0) > coalesce(jl.vaativa_erityinen_tuki,0) and coalesce(jl.vaativa_erityinen_tuki,0) > 0 then opiskelijavuodet-opiskelijavuodet*(jl.vaativa_erityinen_tuki/vet.ov) else 0 end)
	

		,[opiskelijavuodet_painotettu_majoitus] =
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and f.vuosi+2 = varainhoitovuosi) * (case when d7.majoitus_koodi='2' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_22' and f.vuosi+2 = varainhoitovuosi) * (case when d7.majoitus_koodi='3' then opiskelijavuodet else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_23' and f.vuosi+2 = varainhoitovuosi) * (case when d7.majoitus_koodi='4' then opiskelijavuodet else 0 end)

		,[opiskelijavuodet_painotettu_majoitus_hyv] =
		-- luvan ylittävät sisäoppilaitosmuotoisen koulutuksen opiskelijavuodet painotetaan tavallisen majoituksen opiskelijavuosien painolla
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and f.vuosi+2 = varainhoitovuosi) * (case when d7.majoitus_koodi='2' then opiskelijavuodet when d7.majoitus_koodi='3' and coalesce(som.ov_sisa,0) > coalesce(jl.sisaoppilaitosmuotoinen,0) and coalesce(jl.sisaoppilaitosmuotoinen,0) > 0 then opiskelijavuodet-opiskelijavuodet*(jl.sisaoppilaitosmuotoinen/som.ov_sisa) else 0 end)
	+	(case when d11.koodi = 2 then (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and f.vuosi+2 = varainhoitovuosi) else (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_22' and f.vuosi+2 = varainhoitovuosi) end) * (case when d7.majoitus_koodi='3' and (coalesce(som.ov_sisa,0) <= coalesce(jl.sisaoppilaitosmuotoinen,0) or coalesce(jl.sisaoppilaitosmuotoinen,0)=0) then opiskelijavuodet when d7.majoitus_koodi='3' and coalesce(som.ov_sisa,0) > coalesce(jl.sisaoppilaitosmuotoinen,0) then opiskelijavuodet*(jl.sisaoppilaitosmuotoinen/som.ov_sisa) else 0 end)
	+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_23' and f.vuosi+2 = varainhoitovuosi) * (case when d7.majoitus_koodi='4' then opiskelijavuodet else 0 end)


		,[opiskelijavuodet_painotettu_henkilostokoulutus] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='henkilostokoulutus' and kerroin_koodi='hk_25' and f.vuosi+2 = varainhoitovuosi) * 
			(
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_9' and f.vuosi+2 = varainhoitovuosi) *
				( 
					  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' then opiskelijavuodet else 0 end)
				)
			+
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.vuosi+2 = varainhoitovuosi) *
				( 
					  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' then opiskelijavuodet else 0 end)
				)
			)
		+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='henkilostokoulutus' and kerroin_koodi='hk_26' and f.vuosi+2 = varainhoitovuosi) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d2.koodi='muu' then opiskelijavuodet else 0 end)

		,[opiskelijavuodet_painotettu_tyovoimakoulutus] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tyovoimakoulutus' and f.vuosi+2 = varainhoitovuosi)  * 
			(
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.vuosi+2 = varainhoitovuosi) *
				( 
				  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' then opiskelijavuodet else 0 end)
				+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' then opiskelijavuodet else 0 end)
				)
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and d2.koodi='muu' then opiskelijavuodet else 0 end)
			)
		,[opiskelijavuodet_painotettu_vankilaopetus] = 
		(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='vankilaopetus'and f.vuosi+2 = varainhoitovuosi) * (case when d3.kytkin_koodi = '1' then opiskelijavuodet else 0 end)

		,[opiskelijavuodet_painotettu_oppivelvollisuus] = f.opiskelijavuodet * coalesce(sa1.kerroin,0)

		,[opiskelijavuodet_hylatyt]

	FROM [ANTERO].[dw].[f_amos_opiskelijavuodet] f
	left join dw.d_koulutusluokitus d1 on d1.id = coalesce(nullif(f.d_koulutusluokitus_tutk_osaa_pienempi_id,'-1'),f.d_koulutusluokitus_id)
	left join dw.d_ammatillisen_tutkinnon_kustannusryhma d2 on d2.id = f.d_kustannusryhma_id
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
	left join sa.amos_opiskelijavuodet_oppivelvollisuuskerroin sa1 on d10.paivays between alkaa and paattyy and coalesce(nullif(d12.ika_avain,-1),99) <= sa1.ikaraja and d1.tutkintotyyppi_koodi in ('02','11','19') and d14.koodi in (1,2)
	left join dw.d_kytkin d13 on d13.kytkin_koodi = (case when sa1.kerroin is not null then 1 else 0 end)
	--sisäoppilaitosmuotoisen majoituksen opiskelijavuodet summa per vuosi
	left join (
		select 
			vuosi
			,d_organisaatioluokitus_jarj_id
			,ov_sisa = sum(opiskelijavuodet)
		from dw.f_amos_opiskelijavuodet f
		left join dw.d_majoitus d1 on d1.id=f.d_majoitus_id
		left join dw.d_amos_luvaton_koulutus d2 on d2.id = f.d_amos_luvaton_koulutus_id
		where d1.majoitus_koodi='3' and d2.koodi=1
		group by vuosi,d_organisaatioluokitus_jarj_id
	) som on som.vuosi=f.vuosi and som.d_organisaatioluokitus_jarj_id=f.d_organisaatioluokitus_jarj_id
	--vaativan erityisen tuen opiskelijavuodet summa per vuosi
	left join (
		select 
			vuosi
			,d_organisaatioluokitus_jarj_id
			,ov = sum(opiskelijavuodet)
		from dw.f_amos_opiskelijavuodet f
		left join dw.d_erityisopetus d1 on d1.id=f.d_erityisopetus_id
		left join dw.d_amos_luvaton_koulutus d2 on d2.id = f.d_amos_luvaton_koulutus_id
		where d1.jarjestys_erityisopetus_ryhma='3' and d2.koodi=1
		group by vuosi,d_organisaatioluokitus_jarj_id
	) vet on vet.vuosi=f.vuosi and vet.d_organisaatioluokitus_jarj_id=f.d_organisaatioluokitus_jarj_id

	--järjestämisluvan rajoite sisäoppilaitosmuotoiselle majoitukselle ja vaativalle erityiselle tuelle
	left join sa.v_amos_oiva_opiskelijavuodet_rajoite jl on jl.jarjestajaYtunnus=d9.organisaatio_koodi and d10.paivays between jl.alkupvm and jl.loppupvm

) q



/* 2018 TIETOJA EI NÄYTETÄ ENÄÄ LIVERAPORTILLA */
UNION ALL

SELECT 
	*
	,[opiskelijavuodet_painotettu_yhteensa] = [opiskelijavuodet_painotettu_pt] + [opiskelijavuodet_painotettu_at_eat] + [opiskelijavuodet_painotettu_valma_telma] + [opiskelijavuodet_painotettu_opisk_valm_tukevat] + [opiskelijavuodet_painotettu_muu] + [opiskelijavuodet_painotettu_erityistuki] + [opiskelijavuodet_painotettu_majoitus] + [opiskelijavuodet_painotettu_henkilostokoulutus] + [opiskelijavuodet_painotettu_tyovoimakoulutus] + [opiskelijavuodet_painotettu_vankilaopetus]
	,GETDATE()
FROM (

	SELECT  
		 [tilastovuosi]
		,[d_kalenteri_id] = '-1'
		,[d_sukupuoli_id] = '-1'
		,[d_kieli_aidinkieli_id] = '-1'
		,[d_ika_id] = '-1'
		,[d_osa_aikaisuus_id] = '-1'
		,[d_erityisopetus_id]
		,[d_majoitus_id] 
		,[d_kytkin_oppisopimuskoulutus_id]
		,[d_kytkin_vankilaopetus_id]
		,[d_kytkin_henkilostokoulutus_id]
		,[d_kytkin_tyovoimakoulutus_id]
		,[d_koulutusluokitus_id] = '-1'
		,[d_koulutusluokitus_tutk_osaa_pienempi_id] = '-1'
		,[d_organisaatioluokitus_oppilaitos_id] = '-1'
		,[d_organisaatioluokitus_jarj_id]
		,[d_organisaatioluokitus_jarj_hist_id] = '-1'
		,[d_organisaatioluokitus_jarj_pihvi_id] = '-1'
		,[d_organisaatioluokitus_jarj_pihvi_hist_id] = '-1'
		,[d_organisaatioluokitus_toimipiste_id] = '-1'
		,[d_amos_spl_jarjestaja_linkki_id]
		,[d_kustannusryhma_id]
		,[d_suorituksen_tyyppi_id] = '-1'
		,[d_opintojenrahoitus_id]
		,[d_osaamisala_id] = '-1'
		,[muu_ammatillinen_tarkenne] = '-1'
		,[d_amos_spl_opiskelijavuodet_hylkaamisperuste] = '9'
		,[d_amos_luvaton_koulutus_id] = '0'
		,[d_amos_luvaton_majoitus_id] = '0'
		,[d_amos_luvaton_korotustekija_id] = '0'
		,[d_kytkin_hankintakoulutus_id] = '-1'
		,[d_kytkin_sisaopp_ov_ylittyy_id] = '2'
		,[d_kytkin_erityistuen_ov_ylittyy_id] = '2'
		,[d_kytkin_oppivelvollisuus_id] = '2'

		,[opiskelijavuodet_painottamaton] = sum(eioppis_eivankila) + sum(henkilosto_eioppis_eivankila) + sum(majoitus_eioppis_eivankila) + sum(tyovoima_eioppis_eivankila) + sum(tyovoima_henkilosto_eioppis_eivankila) + sum(oppis) + sum(henkilosto_oppis) + sum(majoitus_oppis) + sum(vankila)
		,[opiskelijavuodet_painotettu_pt] = 0 
		,[opiskelijavuodet_painotettu_at_eat] = 0
		,[opiskelijavuodet_painotettu_valma_telma] = 0
		,[opiskelijavuodet_painotettu_opisk_valm_tukevat]  = 0
		,[opiskelijavuodet_painotettu_muu] = 
		  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and v.tilastovuosi+2 = varainhoitovuosi) * 
			(sum(eioppis_eivankila) + sum(henkilosto_eioppis_eivankila) + sum(majoitus_eioppis_eivankila) + sum(tyovoima_eioppis_eivankila) + sum(tyovoima_henkilosto_eioppis_eivankila) + sum(oppis) + sum(henkilosto_oppis) + sum(majoitus_oppis) + sum(vankila))
		
		,[opiskelijavuodet_painotettu_erityistuki] = 0

		,[opiskelijavuodet_painotettu_erityistuki_hyv] = 0
		
		,[opiskelijavuodet_painotettu_majoitus] = 
			(sum(majoitus_eioppis_eivankila) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and v.tilastovuosi+2 = varainhoitovuosi))
		  + (sum(majoitus_oppis) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and v.tilastovuosi+2 = varainhoitovuosi))

		,[opiskelijavuodet_painotettu_majoitus_hyv] = 
			(sum(majoitus_eioppis_eivankila) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and v.tilastovuosi+2 = varainhoitovuosi))
		  + (sum(majoitus_oppis) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and v.tilastovuosi+2 = varainhoitovuosi))
		
		,[opiskelijavuodet_painotettu_henkilostokoulutus] = 
		  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and v.tilastovuosi+2 = varainhoitovuosi) * 
			(
			(sum(henkilosto_eioppis_eivankila) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='henkilostokoulutus' and kerroin_koodi='hk_26' and v.tilastovuosi+2 = varainhoitovuosi))
		  + (sum(tyovoima_henkilosto_eioppis_eivankila) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='henkilostokoulutus' and kerroin_koodi='hk_26' and v.tilastovuosi+2 = varainhoitovuosi))
		  + (sum(henkilosto_oppis) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='henkilostokoulutus' and kerroin_koodi='hk_26' and v.tilastovuosi+2 = varainhoitovuosi))
			)
		
		,[opiskelijavuodet_painotettu_tyovoimakoulutus] = 
		  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and v.tilastovuosi+2 = varainhoitovuosi) * 
			(sum(tyovoima_eioppis_eivankila) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tyovoimakoulutus' and v.tilastovuosi+2 = varainhoitovuosi))
		
		,[opiskelijavuodet_painotettu_vankilaopetus] = 
			(sum(vankila) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='vankilaopetus'and v.tilastovuosi+2 = varainhoitovuosi))
		
		,[opiskelijavuodet_painotettu_oppivelvollisuus] = 0
		,[opiskelijavuodet_hylatyt] = 0

	FROM [sa].[v_amos_muut_tutkinnot] v
	GROUP BY v.tilastovuosi,d_kytkin_oppisopimuskoulutus_id,d_kytkin_vankilaopetus_id,d_kytkin_henkilostokoulutus_id,d_kytkin_tyovoimakoulutus_id,d_organisaatioluokitus_jarj_id,d_kustannusryhma_id,d_opintojenrahoitus_id,d_erityisopetus_id,d_majoitus_id,d_amos_spl_jarjestaja_linkki_id

) q2

