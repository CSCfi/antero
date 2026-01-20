USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut]    Script Date: 1.8.2025 11.43.32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut] AS

DECLARE @maxTilv as int
SET @maxTilv = (select max(vuosi) from sa.sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot)

TRUNCATE TABLE [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut]

INSERT INTO [dw].[f_amos_tutkinnot_ja_tutkinnonosat_painotetut] (
	[tilastovuosi]
    ,[d_kalenteri_id]
	,[d_kalenteri_alkamispaiva_id]
    ,[d_sukupuoli_id]
    ,[d_kieli_aidinkieli_id]
    ,[d_ika_id]
    ,[d_erityisopetus_id]
    ,[d_koulutusluokitus_id]
    ,[d_organisaatioluokitus_jarjestaja_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
	,[d_organisaatioluokitus_jarjestaja_hist_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
    ,[d_amos_spl_jarjestaja_linkki_id]
    ,[d_organisaatioluokitus_oppilaitos_id]
    ,[d_organisaatioluokitus_oppilaitos_pihvi_id]
    ,[d_organisaatioluokitus_toimipiste_id]
    ,[d_kustannusryhma_id]
    ,[d_suorituksen_tyyppi_id]
	,[d_osaamisala_id]
	,[d_kieli_suoritus_id]
    ,[d_opintojenrahoitus_id]
    ,[d_oppisopimuskoulutus_id]
    ,[d_kytkin_vankilaopetus_id]
	,[d_amos_luvaton_koulutus_id]
	,[d_amos_luvaton_korotustekija_id]
	,[d_kieli_suoritus_luvanmukainen_id]
	,[d_kytkin_hankintakoulutus_id]
    ,[painottamaton_tutkinnot]
    ,[painottamaton_osatutkinnot]
    ,[painottamaton_osaamispisteet]
    ,[painottamaton_osaamispisteet_summa]
    ,[painotettu_tutkinnot_pt_kr_pk]
    ,[painotettu_tutkinnot_at_eat_kr_pk]
    ,[painotettu_tutkinnot_erityistuki]
	,[painotettu_tutkinnot_erityistuki_hyv]
    ,[painotettu_tutkinnon_osien_osaamispisteet_pt_kr]
    ,[painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr]
    ,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki]
	,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki_hyv]
    ,[painotettu_tutkinnot_yht]
    ,[painotettu_tutkinnon_osien_osaamispisteet_yht]
)

SELECT  
	 [tilastovuosi]
	,[d_kalenteri_id]
	,[d_kalenteri_alkamispaiva_id]
	,[d_sukupuoli_id]
	,[d_kieli_aidinkieli_id]
	,[d_ika_id]
	,[d_erityisopetus_id]
	,[d_koulutusluokitus_id]
	,[d_organisaatioluokitus_jarjestaja_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_id]
	,[d_organisaatioluokitus_jarjestaja_hist_id]
	,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
	,[d_amos_spl_jarjestaja_linkki_id]
	,[d_organisaatioluokitus_oppilaitos_id]
	,[d_organisaatioluokitus_oppilaitos_pihvi_id]
	,[d_organisaatioluokitus_toimipiste_id]
	,[d_kustannusryhma_id]
	,[d_suorituksen_tyyppi_id]
	,[d_osaamisala_id]
	,[d_kieli_suoritus_id]
	,[d_opintojenrahoitus_id]
	,[d_oppisopimuskoulutus_id]
	,[d_kytkin_vankilaopetus_id]
	,[d_amos_luvaton_koulutus_id]
	,[d_amos_luvaton_korotustekija_id]
	,[d_kieli_suoritus_luvanmukainen_id]
	,[d_kytkin_hankintakoulutus_id]
	,[painottamaton_tutkinnot]
	,[painottamaton_osatutkinnot] 
	,[painottamaton_osaamispisteet]
	,[painottamaton_osaamispisteet_summa]
	,[painotettu_tutkinnot_pt_kr_pk]
	,[painotettu_tutkinnot_at_eat_kr_pk]
	,[painotettu_tutkinnot_erityistuki]
	,[painotettu_tutkinnot_erityistuki_hyv]
	,[painotettu_tutkinnon_osien_osaamispisteet_pt_kr]
	,[painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr]
	,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki]
	,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki_hyv]
	,[painotettu_tutkinnot_yht] = [painotettu_tutkinnot_pt_kr_pk] + [painotettu_tutkinnot_at_eat_kr_pk] + [painotettu_tutkinnot_erityistuki]
	,[painotettu_tutkinnon_osien_osaamispisteet_yht] = [painotettu_tutkinnon_osien_osaamispisteet_pt_kr] + [painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr] + [painotettu_tutkinnon_osien_osaamispisteet_erityistuki]

FROM (

	SELECT
		 f.[Tilastovuosi]
		,[d_kalenteri_id]
		,[d_kalenteri_alkamispaiva_id]
		,[d_sukupuoli_id]
		,[d_kieli_aidinkieli_id]
		,[d_ika_id]
		,[d_erityisopetus_id]
		,[d_koulutusluokitus_id]
		,[d_organisaatioluokitus_jarjestaja_id]
		,[d_organisaatioluokitus_jarjestaja_pihvi_id]
		,[d_organisaatioluokitus_jarjestaja_hist_id]
		,[d_organisaatioluokitus_jarjestaja_pihvi_hist_id]
		,[d_amos_spl_jarjestaja_linkki_id]
		,[d_organisaatioluokitus_oppilaitos_id]
		,[d_organisaatioluokitus_oppilaitos_pihvi_id]
		,[d_organisaatioluokitus_toimipiste_id]
		,[d_kustannusryhma_id]
		,[d_suorituksen_tyyppi_id]
		,[d_osaamisala_id]
		,[d_kieli_suoritus_id]
		,[d_opintojenrahoitus_id]
		,[d_oppisopimuskoulutus_id]
		,[d_kytkin_vankilaopetus_id]
		,[d_amos_luvaton_koulutus_id] 
		,[d_amos_luvaton_korotustekija_id] 
		,[d_kieli_suoritus_luvanmukainen_id]
		,[d_kytkin_hankintakoulutus_id]
		,[painottamaton_tutkinnot] = [koko_tutkinto]
		,[painottamaton_osatutkinnot] = [tutkinnon_osat]
		,[painottamaton_osaamispisteet] = f.[osaamispisteet]
		,[painottamaton_osaamispisteet_summa] = 0 --os_pisteet_summa.osaamispisteet_sum
		,[painotettu_tutkinnot_pt_kr_pk] = 
			cast(
				(
					select suoritusrahoitus 
					from sa.sa_amos_siirtotiedosto_okm7 
					WHERE kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_9' and f.tilastovuosi+2 = varainhoitovuosi
				) 
				as decimal(3,2)
			)
			*
			(
				cast(
					(
						select suoritusrahoitus 
						from sa.sa_amos_siirtotiedosto_okm7 
						WHERE kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_1' and f.tilastovuosi+2 = varainhoitovuosi
					) 
					as decimal(3,1)
				)
				* 
				(
					cast((select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi)as decimal(3,2)) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' and d5.koodi = '1' then koko_tutkinto else 0 end) * cast(coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, A1.ka_koko) as decimal(15,14))
					+ cast((select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi)as decimal(3,2)) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end) * cast(coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, A1.ka_koko) as decimal(15,14))
					+ cast((select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi)as decimal(3,2)) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' and d5.koodi = '1' then koko_tutkinto else 0 end) * cast(coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, A1.ka_koko) as decimal(15,14))
					+ cast((select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi)as decimal(3,2)) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end) * cast(coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, A1.ka_koko) as decimal(15,14))
					+ cast((select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi)as decimal(3,2)) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end) * cast(coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, A1.ka_koko) as decimal(15,14))
				)
				+ 
				cast(
					(
						select suoritusrahoitus 
						from sa.sa_amos_siirtotiedosto_okm7 
						WHERE kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_2' and f.tilastovuosi+2 = varainhoitovuosi
					) 
					as decimal(3,1)
				)
				* 
				(
					cast((select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi)as decimal(3,2)) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' and d5.koodi = '1' then koko_tutkinto else 0 end) * cast(coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, A2.ka_koko) as decimal(15,14))
					+ cast((select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi)as decimal(3,2)) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end) * cast(coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, A2.ka_koko) as decimal(15,14))
					+ cast((select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi)as decimal(3,2)) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' and d5.koodi = '1' then koko_tutkinto else 0 end) * cast(coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, A2.ka_koko) as decimal(15,14))
					+ cast((select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi)as decimal(3,2)) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end) * cast(coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, A2.ka_koko) as decimal(15,14))
					+ cast((select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi)as decimal(3,2)) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end) * cast(coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, A2.ka_koko) as decimal(15,14))
				)
			)

		,[painotettu_tutkinnot_at_eat_kr_pk] = 
			cast(
				(
					select suoritusrahoitus 
					from sa.sa_amos_siirtotiedosto_okm7 
					WHERE kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.tilastovuosi+2 = varainhoitovuosi
				) 
				as decimal(3,2)
			)
			*
			(
				cast(
					(
						select suoritusrahoitus 
						from sa.sa_amos_siirtotiedosto_okm7 
						WHERE kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_1' and f.tilastovuosi+2 = varainhoitovuosi
					) 
					as decimal(3,1)
				)
				* 
				(
					cast((select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi)as decimal(3,2)) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' and d5.koodi = '1' then koko_tutkinto else 0 end) * cast(coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, B1.ka_koko) as decimal(15,14))
					+ cast((select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi)as decimal(3,2)) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end) * cast(coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, B1.ka_koko) as decimal(15,14))
					+ cast((select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi)as decimal(3,2)) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' and d5.koodi = '1' then koko_tutkinto else 0 end) * cast(coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, B1.ka_koko) as decimal(15,14))
					+ cast((select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi)as decimal(3,2)) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end) * cast(coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, B1.ka_koko) as decimal(15,14))
					+ cast((select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi)as decimal(3,2)) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end) * cast(coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, B1.ka_koko) as decimal(15,14))
				)
				+ 
				cast(
					(
						select suoritusrahoitus 
						from sa.sa_amos_siirtotiedosto_okm7 
						WHERE kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_2' and f.tilastovuosi+2 = varainhoitovuosi
					) 
					as decimal(3,1)
				)
				* 
				(
					cast((select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi)as decimal(3,2)) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' and d5.koodi = '1' then koko_tutkinto else 0 end) * cast(coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, B2.ka_koko) as decimal(15,14))
					+ cast((select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi)as decimal(3,2)) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end) * cast(coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, B2.ka_koko) as decimal(15,14))
					+ cast((select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi)as decimal(3,2)) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' and d5.koodi = '1' then koko_tutkinto else 0 end) * cast(coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, B2.ka_koko) as decimal(15,14))
					+ cast((select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi)as decimal(3,2)) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end) * cast(coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, B2.ka_koko) as decimal(15,14))
					+ cast((select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi)as decimal(3,2)) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end) * cast(coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, B2.ka_koko) as decimal(15,14))
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

		,[painotettu_tutkinnot_erityistuki_hyv] = 
			(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_1' and f.tilastovuosi+2 = varainhoitovuosi) *
			(
				  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_13' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end)
				+ (case when d24.koodi in (10,12) then 0 else (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_15' and f.tilastovuosi+2 = varainhoitovuosi) end) * (case when d6.erityisopetus_koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end)
				+ (case when d24.koodi in (10,12) then 0 else (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_16' and f.tilastovuosi+2 = varainhoitovuosi) end) * (case when d6.erityisopetus_koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end)
				+ (case when d24.koodi in (10,12) then 0 else (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_17' and f.tilastovuosi+2 = varainhoitovuosi) end) * (case when d6.erityisopetus_koodi='6' and d5.koodi = '1' then koko_tutkinto else 0 end)
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

		,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki_hyv] = 
				  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_13' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='2' then osaamispisteet else 0 end)
				+ (case when d24.koodi in (10,12) then 0 else (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_15' and f.tilastovuosi+2 = varainhoitovuosi) end) * (case when d6.erityisopetus_koodi='4' then osaamispisteet else 0 end)
				+ (case when d24.koodi in (10,12) then 0 else (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_16' and f.tilastovuosi+2 = varainhoitovuosi) end) * (case when d6.erityisopetus_koodi='5' then osaamispisteet else 0 end)
				+ (case when d24.koodi in (10,12) then 0 else (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 WHERE kerroin_luokka='erityisopetus' and kerroin_koodi='eo_17' and f.tilastovuosi+2 = varainhoitovuosi) end) * (case when d6.erityisopetus_koodi='6' then osaamispisteet else 0 end)

	FROM [dw].[f_amos_tutkinnot_ja_tutkinnonosat] f
	left join dw.d_koulutusluokitus d1 on d1.id = f.d_koulutusluokitus_id
	left join dw.d_ammatillisen_tutkinnon_kustannusryhma d2 on d2.id = f.d_kustannusryhma_id
	left join dw.d_erityisopetus d6 on d6.id = f.d_erityisopetus_id
	left join dw.d_organisaatioluokitus d3 on d3.id = f.d_organisaatioluokitus_jarjestaja_id
	left join sa.sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot d4 on d4.vuosi = (case when f.Tilastovuosi > @maxTilv then f.Tilastovuosi-1 else f.Tilastovuosi end) and d4.ytunnus = d3.organisaatio_koodi and cast(d4.kr as varchar) = d2.koodi and d4.tutktyyppi = (case when d1.tutkintotyyppi_koodi in ('19','20') then '19_20' else tutkintotyyppi_koodi end)
	left join dw.d_suorituksen_tyyppi d5 on d5.id = f.d_suorituksen_tyyppi_id
	left join dw.d_amos_luvaton_korotustekija d24 on d24.koodi = f.d_amos_luvaton_korotustekija_id
	--jos järjestäjälle ei löydy pohjakoulutustietoja, käytetään koko aineiston jakaumaa
	cross apply (SELECT avg([osuus_ei_pohjakoul_koko]) as ka_koko FROM [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] WHERE tutktyyppi='02' and vuosi=@maxTilv) A1
	cross apply (SELECT avg([osuus_pohjakoul_koko]) as ka_koko FROM [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] WHERE tutktyyppi='02' and vuosi=@maxTilv) A2
	cross apply (SELECT avg([osuus_ei_pohjakoul_koko]) as ka_koko FROM [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] WHERE tutktyyppi='19_20' and vuosi=@maxTilv) B1
	cross apply (SELECT avg([osuus_pohjakoul_koko]) as ka_koko FROM [sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] WHERE tutktyyppi='19_20' and vuosi=@maxTilv) B2
	  
) q

GO
