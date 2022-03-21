USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_koski_amm_opiskelijavuodet_painotetut]    Script Date: 3.4.2019 13:21:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_koski_amm_opiskelijavuodet_painotetut]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_koski_amm_opiskelijavuodet_painotetut] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_f_koski_amm_opiskelijavuodet_painotetut] AS

TRUNCATE TABLE dw.f_koski_amm_opiskelijavuodet_painotetut

INSERT INTO dw.f_koski_amm_opiskelijavuodet_painotetut (
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
    ,[d_kustannusryhma_id]
    ,[d_suorituksen_tyyppi_id]
    ,[d_opintojenrahoitus_id]
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
	,[opiskelijavuodet_painotettu_yhteensa]
)

SELECT  
	 [tilastovuosi]
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
	,[d_kustannusryhma_id]
	,[d_suorituksen_tyyppi_id]
	,[d_opintojenrahoitus_id]
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
	,[opiskelijavuodet_painotettu_yhteensa] = [opiskelijavuodet_painotettu_pt] + [opiskelijavuodet_painotettu_at_eat] + [opiskelijavuodet_painotettu_valma_telma] + [opiskelijavuodet_painotettu_opisk_valm_tukevat] + [opiskelijavuodet_painotettu_muu] + [opiskelijavuodet_painotettu_erityistuki] + [opiskelijavuodet_painotettu_majoitus] + [opiskelijavuodet_painotettu_henkilostokoulutus] + [opiskelijavuodet_painotettu_tyovoimakoulutus] + [opiskelijavuodet_painotettu_vankilaopetus]

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
		  ,[d_kustannusryhma_id]
		  ,[d_suorituksen_tyyppi_id]
		  ,[d_opintojenrahoitus_id]
		  ,[opiskelijavuodet_painottamaton] = [opiskelijavuodet]
		  ,[opiskelijavuodet_painotettu_pt] = 
			(select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintotyyppi (opiskelijat)' and ryhma_koodi='pt' and vuosi between year(alkaen) and year(paattyen)) *
				( 
					  (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma1' and vuosi between year(alkaen) and year(paattyen)) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' then opiskelijavuodet else 0 end)
					+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma2' and vuosi between year(alkaen) and year(paattyen)) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' then opiskelijavuodet else 0 end)
					+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma3' and vuosi between year(alkaen) and year(paattyen)) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' then opiskelijavuodet else 0 end)
					+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma4' and vuosi between year(alkaen) and year(paattyen)) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' then opiskelijavuodet else 0 end)
					+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma5' and vuosi between year(alkaen) and year(paattyen)) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' then opiskelijavuodet else 0 end)
				)

		  ,[opiskelijavuodet_painotettu_at_eat] = 
			(select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintotyyppi (opiskelijat)' and ryhma_koodi='at_eat' and vuosi between year(alkaen) and year(paattyen)) *
				( 
					  (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma1' and vuosi between year(alkaen) and year(paattyen)) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' then opiskelijavuodet else 0 end)
					+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma2' and vuosi between year(alkaen) and year(paattyen)) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' then opiskelijavuodet else 0 end)
					+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma3' and vuosi between year(alkaen) and year(paattyen)) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' then opiskelijavuodet else 0 end)
					+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma4' and vuosi between year(alkaen) and year(paattyen)) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' then opiskelijavuodet else 0 end)
					+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma5' and vuosi between year(alkaen) and year(paattyen)) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' then opiskelijavuodet else 0 end)
				)

		  ,[opiskelijavuodet_painotettu_valma_telma] = 
			(select kerroin from sa.sa_amos_kertoimet where tyyppi='Ei tutkintoon johtava' and ryhma_koodi='valma_ja_telma' and vuosi between year(alkaen) and year(paattyen)) * (case when d2.koodi='vt' then opiskelijavuodet else 0 end)

		  ,[opiskelijavuodet_painotettu_opisk_valm_tukevat] =
			(select kerroin from sa.sa_amos_kertoimet where tyyppi='Ei tutkintoon johtava' and ryhma_koodi='opisk_valm_tukeva' and vuosi between year(alkaen) and year(paattyen)) * (case when d2.koodi='ot' then opiskelijavuodet else 0 end)

		  ,[opiskelijavuodet_painotettu_muu] = 
			(select kerroin from sa.sa_amos_kertoimet where tyyppi='Ei tutkintoon johtava' and ryhma_koodi='muu' and vuosi between year(alkaen) and year(paattyen)) * (case when d2.koodi='muu' then opiskelijavuodet else 0 end)

		  ,[opiskelijavuodet_painotettu_erityistuki] = 
			(select kerroin from sa.sa_amos_kertoimet where tyyppi='Erityisopetus' and ryhma_koodi='tutk_koulutus_ei_erityinen_tuki' and vuosi between year(alkaen) and year(paattyen)) * (case when d6.erityisopetus_koodi='2' then opiskelijavuodet else 0 end)
		+	(select kerroin from sa.sa_amos_kertoimet where tyyppi='Erityisopetus' and ryhma_koodi='valm_koulutus_ei_erityinen_tuki' and vuosi between year(alkaen) and year(paattyen)) * (case when d6.erityisopetus_koodi='3' then opiskelijavuodet else 0 end)
		+	(select kerroin from sa.sa_amos_kertoimet where tyyppi='Erityisopetus' and ryhma_koodi='tutk_koulutus_vaativa_erityinen_tuki' and vuosi between year(alkaen) and year(paattyen)) * (case when d6.erityisopetus_koodi='4' then opiskelijavuodet else 0 end)
		+	(select kerroin from sa.sa_amos_kertoimet where tyyppi='Erityisopetus' and ryhma_koodi='tutk_koulutus_vaativa_erityinen_tuki_vaikeasti_vammainen' and vuosi between year(alkaen) and year(paattyen)) * (case when d6.erityisopetus_koodi='5' then opiskelijavuodet else 0 end)
		+	(select kerroin from sa.sa_amos_kertoimet where tyyppi='Erityisopetus' and ryhma_koodi='tutk_koulutus_vaativa_erityinen_tuki_vammainen_avustaja' and vuosi between year(alkaen) and year(paattyen)) * (case when d6.erityisopetus_koodi='6' then opiskelijavuodet else 0 end)
		+	(select kerroin from sa.sa_amos_kertoimet where tyyppi='Erityisopetus' and ryhma_koodi='valm_koulutus_vaativa_erityinen_tuki' and vuosi between year(alkaen) and year(paattyen)) * (case when d6.erityisopetus_koodi='7' then opiskelijavuodet else 0 end)
		+	(select kerroin from sa.sa_amos_kertoimet where tyyppi='Erityisopetus' and ryhma_koodi='valm_koulutus_vaativa_erityinen_tuki_vaikeasti_vammainen' and vuosi between year(alkaen) and year(paattyen)) * (case when d6.erityisopetus_koodi='8' then opiskelijavuodet else 0 end)
		+	(select kerroin from sa.sa_amos_kertoimet where tyyppi='Erityisopetus' and ryhma_koodi='valm_koulutus_vaativa_erityinen_tuki_vammainen_avustaja' and vuosi between year(alkaen) and year(paattyen)) * (case when d6.erityisopetus_koodi='9' then opiskelijavuodet else 0 end)

		  ,[opiskelijavuodet_painotettu_majoitus] =
			(select kerroin from sa.sa_amos_kertoimet where tyyppi='Majoitus' and ryhma_koodi='tavallinen' and vuosi between year(alkaen) and year(paattyen)) * (case when d7.majoitus_koodi='2' then opiskelijavuodet else 0 end)
		+	(select kerroin from sa.sa_amos_kertoimet where tyyppi='Majoitus' and ryhma_koodi='sisaoppilaitos' and vuosi between year(alkaen) and year(paattyen)) * (case when d7.majoitus_koodi='3' then opiskelijavuodet else 0 end)
		+	(select kerroin from sa.sa_amos_kertoimet where tyyppi='Majoitus' and ryhma_koodi='vaativa_erityinen_tuki' and vuosi between year(alkaen) and year(paattyen)) * (case when d7.majoitus_koodi='4' then opiskelijavuodet else 0 end)

		  ,[opiskelijavuodet_painotettu_henkilostokoulutus] = 
			(select kerroin from sa.sa_amos_kertoimet where tyyppi='Henkilöstö' and ryhma_koodi='tutk_johtava' and vuosi between year(alkaen) and year(paattyen)) * 
				(
				(select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintotyyppi (opiskelijat)' and ryhma_koodi='pt' and vuosi between year(alkaen) and year(paattyen)) *
					( 
						  (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma1' and vuosi between year(alkaen) and year(paattyen)) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' then opiskelijavuodet else 0 end)
						+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma2' and vuosi between year(alkaen) and year(paattyen)) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' then opiskelijavuodet else 0 end)
						+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma3' and vuosi between year(alkaen) and year(paattyen)) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' then opiskelijavuodet else 0 end)
						+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma4' and vuosi between year(alkaen) and year(paattyen)) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' then opiskelijavuodet else 0 end)
						+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma5' and vuosi between year(alkaen) and year(paattyen)) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' then opiskelijavuodet else 0 end)
					)
				+
				(select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintotyyppi (opiskelijat)' and ryhma_koodi='at_eat' and vuosi between year(alkaen) and year(paattyen)) *
					( 
						  (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma1' and vuosi between year(alkaen) and year(paattyen)) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' then opiskelijavuodet else 0 end)
						+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma2' and vuosi between year(alkaen) and year(paattyen)) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' then opiskelijavuodet else 0 end)
						+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma3' and vuosi between year(alkaen) and year(paattyen)) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' then opiskelijavuodet else 0 end)
						+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma4' and vuosi between year(alkaen) and year(paattyen)) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' then opiskelijavuodet else 0 end)
						+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma5' and vuosi between year(alkaen) and year(paattyen)) * (case when d5.kytkin_koodi = '1' and d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' then opiskelijavuodet else 0 end)
					)
				)
			+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Henkilöstö' and ryhma_koodi='ei_tutk_johtava' and vuosi between year(alkaen) and year(paattyen)) * (select kerroin from sa.sa_amos_kertoimet where tyyppi='Ei tutkintoon johtava' and ryhma_koodi='muu' and vuosi between year(alkaen) and year(paattyen)) * (case when d5.kytkin_koodi = '1' and d2.koodi='muu' then opiskelijavuodet else 0 end)

		  ,[opiskelijavuodet_painotettu_tyovoimakoulutus] = 
			(select kerroin from sa.sa_amos_kertoimet where tyyppi='Tyovoimakoulutus') * 
				(
				(select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintotyyppi (opiskelijat)' and ryhma_koodi='at_eat' and vuosi between year(alkaen) and year(paattyen)) *
					( 
					  (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma1' and vuosi between year(alkaen) and year(paattyen)) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' then opiskelijavuodet else 0 end)
					+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma2' and vuosi between year(alkaen) and year(paattyen)) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' then opiskelijavuodet else 0 end)
					+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma3' and vuosi between year(alkaen) and year(paattyen)) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' then opiskelijavuodet else 0 end)
					+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma4' and vuosi between year(alkaen) and year(paattyen)) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' then opiskelijavuodet else 0 end)
					+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='ryhma5' and vuosi between year(alkaen) and year(paattyen)) * (case when d4.kytkin_koodi = '1' and tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' then opiskelijavuodet else 0 end)
					)
				+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Ei tutkintoon johtava' and ryhma_koodi='muu' and vuosi between year(alkaen) and year(paattyen)) * (case when d4.kytkin_koodi = '1' and d2.koodi='muu' then opiskelijavuodet else 0 end)
				)
		  ,[opiskelijavuodet_painotettu_vankilaopetus] = 
			(select kerroin from sa.sa_amos_kertoimet where tyyppi='Vankilaopetus') * (case when d3.kytkin_koodi = '1' then opiskelijavuodet else 0 end)

	  FROM [ANTERO].[dw].[f_koski_amm_opiskelijavuodet] f
	  left join ANTERO.dw.d_koulutusluokitus d1 on d1.id = f.d_koulutusluokitus_id
	  left join ANTERO.dw.d_ammatillisen_tutkinnon_kustannusryhma d2 on d2.id = f.d_kustannusryhma_id
	  left join ANTERO.dw.d_kytkin d3 on d3.id = f.d_kytkin_vankilaopetus_id
	  left join ANTERO.dw.d_kytkin d4 on d4.id = f.d_kytkin_tyovoimakoulutus_id
	  left join ANTERO.dw.d_kytkin d5 on d5.id = f.d_kytkin_henkilostokoulutus_id
	  left join ANTERO.dw.d_erityisopetus d6 on d6.id = f.d_erityisopetus_id
	  left join ANTERO.dw.d_majoitus d7 on d7.id = f.d_majoitus_id

) q
