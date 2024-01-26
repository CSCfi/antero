--USE [ANTERO_31102021]
USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_kustannuskysely]    Script Date: 27.1.2022 18:56:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_kustannuskysely]
GO


CREATE PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut_kustannuskysely] AS


DROP TABLE IF EXISTS [dw].[f_amos_opiskelijavuodet_painotetut_kustannuskysely]

SELECT  
	tilastovuosi
	,d_organisaatioluokitus_jarj_id
	,d_koulutusluokitus_id
	,d_kustannusryhma_id
	,d_kytkin_oppisopimuskoulutus_id
	,d_kytkin_vankilaopetus_id
	,[opiskelijavuodet_painottamaton] = opiskelijavuodet_painottamaton + (case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end)
	,[opiskelijavuodet_painotettu] = [opiskelijavuodet_painotettu_pt] + [opiskelijavuodet_painotettu_at_eat] + [opiskelijavuodet_painotettu_valma_telma] + [opiskelijavuodet_painotettu_opisk_valm_tukevat] + [opiskelijavuodet_painotettu_muu] + [opiskelijavuodet_painotettu_erityistuki] + [opiskelijavuodet_painotettu_majoitus] + [opiskelijavuodet_painotettu_henkilostokoulutus] + [opiskelijavuodet_painotettu_tyovoimakoulutus] + [opiskelijavuodet_painotettu_vankilaopetus]
INTO [dw].[f_amos_opiskelijavuodet_painotetut_kustannuskysely]
FROM (

	SELECT [tilastovuosi] = [vuosi]
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
		  ,[d_organisaatioluokitus_oppilaitos_id]
		  ,[d_organisaatioluokitus_jarj_id]
		  ,[d_organisaatioluokitus_toimipiste_id]
		  ,[d_amos_spl_jarjestaja_linkki_id]
		  ,[d_kustannusryhma_id]
		  ,[d_suorituksen_tyyppi_id]
		  ,[d_opintojenrahoitus_id]
		  ,[d_osaamisala_id]
		  ,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id]
		  ,[opiskelijavuodet_painottamaton] = [opiskelijavuodet]
		  ,[opiskelijavuodet_painotettu_pt] = 
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_9' and f.vuosi+2 = varainhoitovuosi) *
				( 
					  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
				)

		  ,[opiskelijavuodet_painotettu_at_eat] = 
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.vuosi+2 = varainhoitovuosi) *
				( 
					  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
				)

		  ,[opiskelijavuodet_painotettu_valma_telma] = 
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_6' and f.vuosi+2 = varainhoitovuosi) * (case when d2.koodi='vt' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)

		  ,[opiskelijavuodet_painotettu_opisk_valm_tukevat] =
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_7' and f.vuosi+2 = varainhoitovuosi) * (case when d2.koodi='ot' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)

		  ,[opiskelijavuodet_painotettu_muu] = 
		  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and f.vuosi+2 = varainhoitovuosi) * (case when d2.koodi='muu' then opiskelijavuodet else 0 end)
			

		  ,[opiskelijavuodet_painotettu_erityistuki] = 
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_13' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='2' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_14' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='3' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_15' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='4' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_16' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='5' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_17' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='6' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_18' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='7' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_19' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='8' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_20' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='9' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)

		  ,[opiskelijavuodet_painotettu_majoitus] =
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and f.vuosi+2 = varainhoitovuosi) * (case when d7.majoitus_koodi='2' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_22' and f.vuosi+2 = varainhoitovuosi) * (case when d7.majoitus_koodi='3' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_23' and f.vuosi+2 = varainhoitovuosi) * (case when d7.majoitus_koodi='4' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)

		  ,[opiskelijavuodet_painotettu_henkilostokoulutus] = 
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='henkilostokoulutus' and kerroin_koodi='hk_25' and f.vuosi+2 = varainhoitovuosi) * 
				(
				(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_9' and f.vuosi+2 = varainhoitovuosi) *
					( 
						  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
						+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
						+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
						+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
						+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
					)
				+
				(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.vuosi+2 = varainhoitovuosi) *
					( 
						  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
						+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
						+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
						+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
						+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)
					)
				)
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='henkilostokoulutus' and kerroin_koodi='hk_26' and f.vuosi+2 = varainhoitovuosi) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d2.koodi='kr_8' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)

		  ,[opiskelijavuodet_painotettu_tyovoimakoulutus] = 
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tyovoimakoulutus' and kerroin_koodi='tk_27' and f.vuosi+2 = varainhoitovuosi)  * 
				(
				(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.vuosi+2 = varainhoitovuosi) *
					( 
					  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' then opiskelijavuodet else 0 end)
					+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' then opiskelijavuodet else 0 end)
					)
				)
			+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tyovoimakoulutus' and kerroin_koodi='tk_28' and f.vuosi+2 = varainhoitovuosi)  * 
					(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and f.vuosi+2 = varainhoitovuosi) * (case when d4.kytkin_koodi = '1' and d2.koodi='muu' then opiskelijavuodet else 0 end)
			

		  ,[opiskelijavuodet_painotettu_vankilaopetus] = 
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='vankilaopetus'and f.vuosi+2 = varainhoitovuosi) * (case when d3.kytkin_koodi = '1' then opiskelijavuodet+(case when d_amos_spl_opiskelijavuodet_hylkaamisperuste_id in (2,3,4) then opiskelijavuodet_hylatyt else 0 end) else 0 end)

		  ,[opiskelijavuodet_hylatyt]

	  FROM [dw].[f_amos_opiskelijavuodet] f
	  left join dw.d_koulutusluokitus d1 on d1.id = f.d_koulutusluokitus_id
	  left join dw.d_ammatillisen_tutkinnon_kustannusryhma d2 on d2.id = f.d_kustannusryhma_id
	  left join dw.d_kytkin d3 on d3.id = f.d_kytkin_vankilaopetus_id
	  left join dw.d_kytkin d4 on d4.id = f.d_kytkin_tyovoimakoulutus_id
	  left join dw.d_kytkin d5 on d5.id = f.d_kytkin_henkilostokoulutus_id
	  left join dw.d_erityisopetus d6 on d6.id = f.d_erityisopetus_id
	  left join dw.d_majoitus d7 on d7.id = f.d_majoitus_id
	  WHERE vuosi = 2020

) q



GO


