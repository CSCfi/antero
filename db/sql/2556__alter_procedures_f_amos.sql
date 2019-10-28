USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut]    Script Date: 24.10.2019 14:16:07 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat]    Script Date: 24.10.2019 14:16:07 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut]    Script Date: 24.10.2019 14:16:07 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet]    Script Date: 24.10.2019 14:16:07 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_opiskelijavuodet]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet]    Script Date: 24.10.2019 14:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_opiskelijavuodet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet] AS' 
END
GO



ALTER PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet] AS


TRUNCATE TABLE [ANTERO].[dw].[f_amos_opiskelijavuodet]

	
INSERT INTO dw.f_amos_opiskelijavuodet (
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
	,d_organisaatioluokitus_oppilaitos_id
	,d_organisaatioluokitus_jarj_id
	,d_organisaatioluokitus_toimipiste_id
	,d_kustannusryhma_id
	,d_suorituksen_tyyppi_id
	,d_opintojenrahoitus_id
	,d_osaamisala_id
	,d_amos_spl_opiskelijavuodet_hylkaamisperuste_id
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
	,d_koulutusluokitus_id = COALESCE(d11.id,-1)
	,d_organisaatioluokitus_oppilaitos_id = COALESCE(d12.id,-1)
	,d_organisaatioluokitus_jarj_id = COALESCE(d13.id,-1)
	,d_organisaatioluokitus_toimipiste_id = COALESCE(d18.id,-1)
	,d_kustannusryhma_id = COALESCE(d15.id,-1)
	,d_suorituksen_tyyppi_id = COALESCE(d14.id,-1)
	,d_opintojenrahoitus_id = COALESCE(d16.id,-1)
	,d_osaamisala_id = COALESCE(d17.id,-1)
	,d_amos_spl_opiskelijavuodet_hylkaamisperuste = COALESCE(d19.id,-1)
	,opiskelijavuodet = SUM(case when q.hyvaksytaan = 1 then op_vuodet else 0 end)
	,opiskelijavuodet_hylatyt = SUM(case when q.hyvaksytaan = 0 then op_vuodet else 0 end)
	,GETDATE()
	
FROM [Koski_SA].[dbo].[opiskelijavuodet_valitaulu_unpivot] q

LEFT JOIN d_kalenteri d1 ON d1.kalenteri_avain=q.tilv_date
LEFT JOIN d_sukupuoli d2 ON d2.sukupuoli_koodi=q.sukupuoli
LEFT JOIN d_kieli d3 ON d3.kieli_koodi=q.aidinkieli
LEFT JOIN d_ika d4 ON d4.ika_avain=q.ika
LEFT JOIN d_erityisopetus d5 ON d5.erityisopetus_koodi=q.erityisopetus
LEFT JOIN d_majoitus d6 ON d6.majoitus_koodi=q.majoitus
LEFT JOIN d_kytkin d7 ON d7.kytkin_koodi=q.oppis
LEFT JOIN d_kytkin d8 ON d8.kytkin_koodi=q.vankilaopetus
LEFT JOIN d_kytkin d9 ON d9.kytkin_koodi=q.henkilostokoulutus
LEFT JOIN d_kytkin d10 ON d10.kytkin_koodi=q.tyovoimakoulutus
LEFT JOIN d_koulutusluokitus d11 ON d11.koulutusluokitus_koodi=q.koulk
LEFT JOIN d_organisaatioluokitus d12 ON d12.organisaatio_oid=q.tunn_oid
LEFT JOIN d_organisaatioluokitus d13 ON d13.organisaatio_oid=q.jarj_oid
LEFT JOIN d_suorituksen_tyyppi d14 ON d14.koodi=q.suorituksen_tyyppi
LEFT JOIN d_ammatillisen_tutkinnon_kustannusryhma d15 ON d15.koodi=q.kustannusryhma
LEFT JOIN d_opintojenrahoitus d16 ON d16.koodi=q.opintojen_rahoitus
LEFT JOIN d_osaamisala d17 ON d17.koodi=q.osaamisala
LEFT JOIN d_organisaatioluokitus d18 ON d18.organisaatio_oid=q.toim_oid
LEFT JOIN d_amos_spl_opiskelijavuodet_hylkaamisperuste d19 ON d19.koodi = q.hylkaamisen_peruste
LEFT JOIN d_kytkin d20 ON d20.kytkin_koodi = q.osa_aikaisuus


GROUP BY 
q.vuosi
,COALESCE(d1.id,-1)
,COALESCE(d2.id,-1)
,COALESCE(d3.id,-1)
,COALESCE(d4.id,-1)
,COALESCE(d20.id,-1)
,COALESCE(d5.id,-1)
,COALESCE(d6.id,-1)
,COALESCE(d7.id,-1)
,COALESCE(d8.id,-1)
,COALESCE(d9.id,-1)
,COALESCE(d10.id,-1)
,COALESCE(d11.id,-1)
,COALESCE(d12.id,-1)
,COALESCE(d13.id,-1)
,COALESCE(d14.id,-1)
,COALESCE(d15.id,-1)
,COALESCE(d16.id,-1)
,COALESCE(d17.id,-1)
,COALESCE(d18.id,-1)
,COALESCE(d19.id,-1)





GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut]    Script Date: 24.10.2019 14:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_opiskelijavuodet_painotetut]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet_painotetut] AS' 
END
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
    ,[d_organisaatioluokitus_oppilaitos_id]
    ,[d_organisaatioluokitus_jarj_id]
	,[d_organisaatioluokitus_toimipiste_id]
    ,[d_kustannusryhma_id]
    ,[d_suorituksen_tyyppi_id]
    ,[d_opintojenrahoitus_id]
	,[d_osaamisala_id]
	,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id]
    ,[opiskelijavuodet_painottamaton]
    ,[opiskelijavuodet_painotettu_pt]
    ,[opiskelijavuodet_painotettu_at_eat]
    ,[opiskelijavuodet_painotettu_valma_telma]
    ,[opiskelijavuodet_painotettu_opisk_valm_tukevat]
    ,[opiskelijavuodet_painotettu_muu]
    ,[opiskelijavuodet_painotettu_erityistuki]
    ,[opiskelijavuodet_painotettu_majoitus]
    ,[opiskelijavuodet_painotettu_henkilostokoulutus]
    ,[opiskelijavuodet_painotettu_tyovoimakoulutus]
    ,[opiskelijavuodet_painotettu_vankilaopetus]
	,[opiskelijavuodet_hylatyt]
	,[opiskelijavuodet_painotettu_yhteensa]
	,loadtime
)

SELECT  
	 *
	,[opiskelijavuodet_painotettu_yhteensa] = [opiskelijavuodet_painotettu_pt] + [opiskelijavuodet_painotettu_at_eat] + [opiskelijavuodet_painotettu_valma_telma] + [opiskelijavuodet_painotettu_opisk_valm_tukevat] + [opiskelijavuodet_painotettu_muu] + [opiskelijavuodet_painotettu_erityistuki] + [opiskelijavuodet_painotettu_majoitus] + [opiskelijavuodet_painotettu_henkilostokoulutus] + [opiskelijavuodet_painotettu_tyovoimakoulutus] + [opiskelijavuodet_painotettu_vankilaopetus]
	,GETDATE()

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
		  ,[d_kustannusryhma_id]
		  ,[d_suorituksen_tyyppi_id]
		  ,[d_opintojenrahoitus_id]
		  ,[d_osaamisala_id]
		  ,[d_amos_spl_opiskelijavuodet_hylkaamisperuste_id]
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

		  ,[opiskelijavuodet_painotettu_muu] = 0
			

		  ,[opiskelijavuodet_painotettu_erityistuki] = 
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_13' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='2' then opiskelijavuodet else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_14' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='3' then opiskelijavuodet else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_15' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='4' then opiskelijavuodet else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_16' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='5' then opiskelijavuodet else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_17' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='6' then opiskelijavuodet else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_18' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='7' then opiskelijavuodet else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_19' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='8' then opiskelijavuodet else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_20' and f.vuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='9' then opiskelijavuodet else 0 end)

		  ,[opiskelijavuodet_painotettu_majoitus] =
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_21' and f.vuosi+2 = varainhoitovuosi) * (case when d7.majoitus_koodi='2' then opiskelijavuodet else 0 end)
		+	(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='majoitusetu' and kerroin_koodi='me_22' and f.vuosi+2 = varainhoitovuosi) * (case when d7.majoitus_koodi='3' then opiskelijavuodet else 0 end)
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
			+ (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='henkilostokoulutus' and kerroin_koodi='hk_26' and f.vuosi+2 = varainhoitovuosi) * (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and f.vuosi+2 = varainhoitovuosi) * (case when d5.kytkin_koodi = '1' and d2.koodi='kr_8' then opiskelijavuodet else 0 end)

		  ,[opiskelijavuodet_painotettu_tyovoimakoulutus] = 
			(select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tyovoimakoulutus' and f.vuosi+2 = varainhoitovuosi) * 
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

		  ,[opiskelijavuodet_hylatyt]

	  FROM [ANTERO].[dw].[f_amos_opiskelijavuodet] f
	  left join ANTERO.dw.d_koulutusluokitus d1 on d1.id = f.d_koulutusluokitus_id
	  left join ANTERO.dw.d_ammatillisen_tutkinnon_kustannusryhma d2 on d2.id = f.d_kustannusryhma_id
	  left join ANTERO.dw.d_kytkin d3 on d3.id = f.d_kytkin_vankilaopetus_id
	  left join ANTERO.dw.d_kytkin d4 on d4.id = f.d_kytkin_tyovoimakoulutus_id
	  left join ANTERO.dw.d_kytkin d5 on d5.id = f.d_kytkin_henkilostokoulutus_id
	  left join ANTERO.dw.d_erityisopetus d6 on d6.id = f.d_erityisopetus_id
	  left join ANTERO.dw.d_majoitus d7 on d7.id = f.d_majoitus_id

) q


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
		,[d_organisaatioluokitus_oppilaitos_id] = '-1'
		,[d_organisaatioluokitus_jarj_id]
		,[d_organisaatioluokitus_toimipiste_id] = '-1'
		,[d_kustannusryhma_id]
		,[d_suorituksen_tyyppi_id] = '-1'
		,[d_opintojenrahoitus_id]
		,[d_osaamisala_id] = '-1'
		,[d_amos_spl_opiskelijavuodet_hylkaamisperuste] = '9'
		,[opiskelijavuodet_painottamaton] = sum(eioppis_eivankila) + sum(henkilosto_eioppis_eivankila) + sum(majoitus_eioppis_eivankila) + sum(tyovoima_eioppis_eivankila) + sum(tyovoima_henkilosto_eioppis_eivankila) + sum(oppis) + sum(henkilosto_oppis) + sum(majoitus_oppis) + sum(vankila)
		,[opiskelijavuodet_painotettu_pt] = 0 
		,[opiskelijavuodet_painotettu_at_eat] = 0
		,[opiskelijavuodet_painotettu_valma_telma] = 0
		,[opiskelijavuodet_painotettu_opisk_valm_tukevat]  = 0
		,[opiskelijavuodet_painotettu_muu] = 
		  (select perusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_8' and v.tilastovuosi+2 = varainhoitovuosi) * 
			(sum(eioppis_eivankila) + sum(henkilosto_eioppis_eivankila) + sum(majoitus_eioppis_eivankila) + sum(tyovoima_eioppis_eivankila) + sum(tyovoima_henkilosto_eioppis_eivankila) + sum(oppis) + sum(henkilosto_oppis) + sum(majoitus_oppis) + sum(vankila))
		
		,[opiskelijavuodet_painotettu_erityistuki] = 0
		
		,[opiskelijavuodet_painotettu_majoitus] = 
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
		
		,[opiskelijavuodet_hylatyt] = 0

	FROM [sa].[v_amos_muut_tutkinnot] v
	GROUP BY v.tilastovuosi,d_kytkin_oppisopimuskoulutus_id,d_kytkin_vankilaopetus_id,d_kytkin_henkilostokoulutus_id,d_kytkin_tyovoimakoulutus_id,d_organisaatioluokitus_jarj_id,d_kustannusryhma_id,d_opintojenrahoitus_id,d_erityisopetus_id,d_majoitus_id

) q2




GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat]    Script Date: 24.10.2019 14:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat] AS' 
END
GO




ALTER procedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat] AS


TRUNCATE TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat]

INSERT INTO [dw].[f_amos_tutkinnot_ja_tutkinnonosat]

SELECT 
	 [Tilastovuosi] = 2018

	,d_koulutusluokitus_id = coalesce(d2b.id,d2.id,-1)
	
	,d_opintojenrahoitus_id = coalesce(d5.id,-1)
	,d_kustannusryhma_id = coalesce(d7.id,-1)
	,d_oppisopimuskoulutus_id = coalesce(d4.id,-1)
	,d_erityisopetus_id = coalesce(d3.id,-1)
	,d_suorituksen_tyyppi_id = coalesce(d8.id,-1)

	,d_organisaatioluokitus_jarjestaja_id = coalesce(d1.id,-1)

    ,koko_tutkinto = count(distinct count_tutkinnot_ml_oppisopimuskoulutus)
    ,tutkinnon_osat = count(distinct count_tutkinnon_osat)
	,osaamispisteet = sum(coalesce(sum_osaamispisteet,0))

--INTO [dw].[f_amos_tutkinnot_ja_tutkinnonosat]

FROM  Koski_SA.dbo.tutkinnot_ja_tutkinnonosat_valitaulu_organisaatiorajaus tt

LEFT JOIN dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi = tt.ol_organisaatio_koodi
LEFT JOIN dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = tt.tutkinto_koodi
LEFT JOIN dw.d_koulutusluokitus d2b on d2b.koulutusluokitus_koodi = d2.uusi_eat_koodi
LEFT JOIN dw.d_erityisopetus d3 on d3.erityisopetus_koodi = tt.erityisopetus_koodi
LEFT JOIN dw.d_oppisopimuskoulutus d4 on d4.koodi = tt.oppisopimus_koodi
LEFT JOIN dw.d_opintojenrahoitus d5 on d5.koodi = tt.opintojen_rahoitus_koodi
LEFT JOIN dw.d_ammatillisen_tutkinnon_kustannusryhma d7 on d7.koodi = tt.kustannusryhma_koodi
LEFT JOIN dw.d_suorituksen_tyyppi d8 on d8.koodi = tt.suorituksen_tyyppi_koodi

group by 
	 d1.id
	,d2.id
	,d2b.id
	,d3.id
	,d4.id
	,d5.id
	,d7.id
	,d8.id
	
HAVING count(distinct count_tutkinnot_ml_oppisopimuskoulutus) > 0
    OR count(distinct count_tutkinnon_osat) > 0
    OR sum(coalesce(sum_osaamispisteet,0)) > 0	


GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut]    Script Date: 24.10.2019 14:16:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut] AS' 
END
GO


ALTER PROCEDURE [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut] AS


DECLARE @maxTilv as int
SET @maxTilv = (select max(vuosi) from sa.sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot)


TRUNCATE TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut]

INSERT INTO [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut]

SELECT  
	 [tilastovuosi]
	,[d_erityisopetus_id]
	,[d_koulutusluokitus_id]
	,[d_organisaatioluokitus_jarjestaja_id]
	,[d_kustannusryhma_id]
	,[d_suorituksen_tyyppi_id]
	,[d_opintojenrahoitus_id]
	,[d_oppisopimuskoulutus_id]
	,[painottamaton_tutkinnot]
	,[painottamaton_osatutkinnot] 
	,[painottamaton_osaamispisteet]
	,[painottamaton_osaamispisteet_summa]
	,[painotettu_tutkinnot_pt_kr_pk]
	,[painotettu_tutkinnot_at_eat_kr_pk]
	,[painotettu_tutkinnot_erityistuki]
	,[painotettu_tutkinnon_osien_osaamispisteet_pt_kr]
	,[painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr]
	,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki]
	,[painotettu_tutkinnot_yht] = [painotettu_tutkinnot_pt_kr_pk] + [painotettu_tutkinnot_at_eat_kr_pk] + [painotettu_tutkinnot_erityistuki]
	,[painotettu_tutkinnon_osien_osaamispisteet_yht] = [painotettu_tutkinnon_osien_osaamispisteet_pt_kr] + [painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr] + [painotettu_tutkinnon_osien_osaamispisteet_erityistuki]

FROM (

	SELECT
		 f.[Tilastovuosi]
		,[d_erityisopetus_id]
		,[d_koulutusluokitus_id]
		,[d_organisaatioluokitus_jarjestaja_id]
		,[d_kustannusryhma_id]
		,[d_suorituksen_tyyppi_id]
		,[d_opintojenrahoitus_id]
		,[d_oppisopimuskoulutus_id]
		,[painottamaton_tutkinnot] = [koko_tutkinto]
		,[painottamaton_osatutkinnot] = [tutkinnon_osat]
		,[painottamaton_osaamispisteet] = f.[osaamispisteet]
		,[painottamaton_osaamispisteet_summa] = os_pisteet_summa.osaamispisteet_sum
		,[painotettu_tutkinnot_pt_kr_pk] = 
			(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_9' and f.tilastovuosi+2 = varainhoitovuosi) *
			(
				(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_1' and f.tilastovuosi+2 = varainhoitovuosi) *
					(
					  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, A1.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, A1.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, A1.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, A1.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, A1.ka_koko)
					)
			   + (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_2' and f.tilastovuosi+2 = varainhoitovuosi) *
					(
					  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, A2.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, A2.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, A2.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, A2.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, A2.ka_koko)
					)
			)

		,[painotettu_tutkinnot_at_eat_kr_pk] = 
			(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.tilastovuosi+2 = varainhoitovuosi) *
			(
				(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_1' and f.tilastovuosi+2 = varainhoitovuosi) *
					(
					  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, B1.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, B1.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, B1.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, B1.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, B1.ka_koko)
					)
			   + (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_2' and f.tilastovuosi+2 = varainhoitovuosi) *
					(
					  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, B2.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, B2.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, B2.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, B2.ka_koko)
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, B2.ka_koko)
					)
			)

		,[painotettu_tutkinnot_erityistuki] = 
			(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_1' and f.tilastovuosi+2 = varainhoitovuosi) *
			(
				  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_13' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_15' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_16' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_17' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='6' and d5.koodi = '1' then koko_tutkinto else 0 end)
			)
		
		,[painotettu_tutkinnon_osien_osaamispisteet_pt_kr] = 
			(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_9' and f.tilastovuosi+2 = varainhoitovuosi) *
			(
				  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' then osaamispisteet else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' then osaamispisteet else 0 end) 
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' then osaamispisteet else 0 end) 
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' then osaamispisteet else 0 end) 
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' then osaamispisteet else 0 end) 
			)
		
		,[painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr] = 
			(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.tilastovuosi+2 = varainhoitovuosi) *
			(
				  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' then osaamispisteet else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' then osaamispisteet else 0 end) 
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' then osaamispisteet else 0 end) 
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' then osaamispisteet else 0 end) 
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' then osaamispisteet else 0 end) 
			)	  
		
		,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki] = 
				  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_13' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='2' then osaamispisteet else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_15' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='4' then osaamispisteet else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_16' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='5' then osaamispisteet else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_17' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='6' then osaamispisteet else 0 end)
			

	  FROM [ANTERO].[dw].[f_amos_tutkinnot_ja_tutkinnonosat] f
	  left join ANTERO.dw.d_koulutusluokitus d1 on d1.id = f.d_koulutusluokitus_id
	  left join ANTERO.dw.d_ammatillisen_tutkinnon_kustannusryhma d2 on d2.id = f.d_kustannusryhma_id
	  left join ANTERO.dw.d_erityisopetus d6 on d6.id = f.d_erityisopetus_id
	  left join ANTERO.dw.d_organisaatioluokitus d3 on d3.id = f.d_organisaatioluokitus_jarjestaja_id
	  left join ANTERO.sa.sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot d4 on d4.vuosi = (case when f.Tilastovuosi > @maxTilv then f.Tilastovuosi-1 else f.Tilastovuosi end) and d4.ytunnus = d3.organisaatio_koodi and cast(d4.kr as varchar) = d2.koodi and d4.tutktyyppi = (case when d1.tutkintotyyppi_koodi in ('19','20') then '19_20' else tutkintotyyppi_koodi end)
	  left join ANTERO.dw.d_suorituksen_tyyppi d5 on d5.id = f.d_suorituksen_tyyppi_id
	  --tutkinnon osien osaamispisteiden leikkuria varten lasketaan rahoituksessa huomioitavien osaamispisteiden summa per järjestäjä per vuosi
	  left join (
			SELECT 
				 f.tilastovuosi
				,d1.organisaatio_koodi
				,osaamispisteet_sum = sum(f.osaamispisteet)
			FROM dw.f_amos_tutkinnot_ja_tutkinnonosat f
			JOIN dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatioluokitus_jarjestaja_id
			JOIN dw.d_opintojenrahoitus d2 on d2.id = f.d_opintojenrahoitus_id
			WHERE d2.sisaltyy_okm_suoritusrahoitus = 1
			GROUP BY d1.organisaatio_koodi, f.tilastovuosi
	  ) os_pisteet_summa ON os_pisteet_summa.organisaatio_koodi = d3.organisaatio_koodi AND os_pisteet_summa.tilastovuosi = f.tilastovuosi

	  --jos järjestäjälle ei löydy pohjakoulutustietoja, käytetään koko aineiston jakaumaa
	  cross apply (SELECT avg([osuus_ei_pohjakoul_koko]) as ka_koko FROM [ANTERO].[sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] WHERE tutktyyppi='02' and vuosi=@maxTilv) A1
	  cross apply (SELECT avg([osuus_pohjakoul_koko]) as ka_koko FROM [ANTERO].[sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] WHERE tutktyyppi='02' and vuosi=@maxTilv) A2
	  cross apply (SELECT avg([osuus_ei_pohjakoul_koko]) as ka_koko FROM [ANTERO].[sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] WHERE tutktyyppi='19_20' and vuosi=@maxTilv) B1
	  cross apply (SELECT avg([osuus_pohjakoul_koko]) as ka_koko FROM [ANTERO].[sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] WHERE tutktyyppi='19_20' and vuosi=@maxTilv) B2
	  
) q

