USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_tabular_painotetut]    Script Date: 10.10.2019 14:39:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--tämä proseduuri ajetaan p_lataa_f_koski_amm_koko_tutkinto jälkeen. Ei tee muuta kuin laskee painotetut koko_tutkinto käyttäen sa_amos_siirtotiedosto_okm7 arvoja.

ALTER PROCEDURE [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_tabular_painotetut] AS

DROP TABLE [dw].[f_amos_spl_tutkinnot_ja_tutkinnonosat_tabular_painotetut]

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
	
INTO [dw].[f_amos_spl_tutkinnot_ja_tutkinnonosat_tabular_painotetut]

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
			(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_9' and f.tilastovuosi+2 = varainhoitovuosi) *
			(
				(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_1' and f.tilastovuosi+2 = varainhoitovuosi) *
					(
					  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, (SELECT avg([osuus_ei_pohjakoul_koko]) FROM [ANTERO].[sa].[sa_amos_tutk_pohjakoul_2017] where tutktyyppi='02'))
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, (SELECT avg([osuus_ei_pohjakoul_koko]) FROM [ANTERO].[sa].[sa_amos_tutk_pohjakoul_2017] where tutktyyppi='02'))
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, (SELECT avg([osuus_ei_pohjakoul_koko]) FROM [ANTERO].[sa].[sa_amos_tutk_pohjakoul_2017] where tutktyyppi='02'))
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, (SELECT avg([osuus_ei_pohjakoul_koko]) FROM [ANTERO].[sa].[sa_amos_tutk_pohjakoul_2017] where tutktyyppi='02'))
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, (SELECT avg([osuus_ei_pohjakoul_koko]) FROM [ANTERO].[sa].[sa_amos_tutk_pohjakoul_2017] where tutktyyppi='02'))
					)
			   + (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_2' and f.tilastovuosi+2 = varainhoitovuosi) *
					(
					  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, (SELECT avg([osuus_pohjakoul_koko]) FROM [ANTERO].[sa].[sa_amos_tutk_pohjakoul_2017] where tutktyyppi='02'))
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, (SELECT avg([osuus_pohjakoul_koko]) FROM [ANTERO].[sa].[sa_amos_tutk_pohjakoul_2017] where tutktyyppi='02'))
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, (SELECT avg([osuus_pohjakoul_koko]) FROM [ANTERO].[sa].[sa_amos_tutk_pohjakoul_2017] where tutktyyppi='02'))
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, (SELECT avg([osuus_pohjakoul_koko]) FROM [ANTERO].[sa].[sa_amos_tutk_pohjakoul_2017] where tutktyyppi='02'))
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, (SELECT avg([osuus_pohjakoul_koko]) FROM [ANTERO].[sa].[sa_amos_tutk_pohjakoul_2017] where tutktyyppi='02'))
					)
			)

		,[painotettu_tutkinnot_at_eat_kr_pk] = 
			(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.tilastovuosi+2 = varainhoitovuosi) *
			(
				(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_1' and f.tilastovuosi+2 = varainhoitovuosi) *
					(
					  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, (SELECT avg([osuus_ei_pohjakoul_koko]) FROM [ANTERO].[sa].[sa_amos_tutk_pohjakoul_2017] where tutktyyppi = '19_20'))
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, (SELECT avg([osuus_ei_pohjakoul_koko]) FROM [ANTERO].[sa].[sa_amos_tutk_pohjakoul_2017] where tutktyyppi = '19_20'))
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, (SELECT avg([osuus_ei_pohjakoul_koko]) FROM [ANTERO].[sa].[sa_amos_tutk_pohjakoul_2017] where tutktyyppi = '19_20'))
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, (SELECT avg([osuus_ei_pohjakoul_koko]) FROM [ANTERO].[sa].[sa_amos_tutk_pohjakoul_2017] where tutktyyppi = '19_20'))
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_ei_pohjakoul, d4.osuus_ei_pohjakoul_koko, (SELECT avg([osuus_ei_pohjakoul_koko]) FROM [ANTERO].[sa].[sa_amos_tutk_pohjakoul_2017] where tutktyyppi = '19_20'))
					)
			   + (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_2' and f.tilastovuosi+2 = varainhoitovuosi) *
					(
					  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, (SELECT avg([osuus_pohjakoul_koko]) FROM [ANTERO].[sa].[sa_amos_tutk_pohjakoul_2017] where tutktyyppi = '19_20'))
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, (SELECT avg([osuus_pohjakoul_koko]) FROM [ANTERO].[sa].[sa_amos_tutk_pohjakoul_2017] where tutktyyppi = '19_20'))
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, (SELECT avg([osuus_pohjakoul_koko]) FROM [ANTERO].[sa].[sa_amos_tutk_pohjakoul_2017] where tutktyyppi = '19_20'))
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, (SELECT avg([osuus_pohjakoul_koko]) FROM [ANTERO].[sa].[sa_amos_tutk_pohjakoul_2017] where tutktyyppi = '19_20'))
					+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end) * coalesce(d4.osuus_pohjakoul, d4.osuus_pohjakoul_koko, (SELECT avg([osuus_pohjakoul_koko]) FROM [ANTERO].[sa].[sa_amos_tutk_pohjakoul_2017] where tutktyyppi = '19_20'))
					)
			)

		,[painotettu_tutkinnot_erityistuki] = 
			(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='ennenkoulutusta' and kerroin_koodi='ek_1' and f.tilastovuosi+2 = varainhoitovuosi) *
			(
				  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_13' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='2' and d5.koodi = '1' then koko_tutkinto else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_15' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='4' and d5.koodi = '1' then koko_tutkinto else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_16' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='5' and d5.koodi = '1' then koko_tutkinto else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_17' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='6' and d5.koodi = '1' then koko_tutkinto else 0 end)
			)
		
		,[painotettu_tutkinnon_osien_osaamispisteet_pt_kr] = 
			(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_9' and f.tilastovuosi+2 = varainhoitovuosi) *
			(
				  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='1' then osaamispisteet else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='2' then osaamispisteet else 0 end) 
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='3' then osaamispisteet else 0 end) 
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='4' then osaamispisteet else 0 end) 
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi = '02' and d2.koodi='5' then osaamispisteet else 0 end) 
			)
		
		,[painotettu_tutkinnon_osien_osaamispisteet_at_eat_kr] = 
			(select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='tutkintotyyppi' and kerroin_koodi='tt_10' and f.tilastovuosi+2 = varainhoitovuosi) *
			(
				  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_1' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='1' then osaamispisteet else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_2' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='2' then osaamispisteet else 0 end) 
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_3' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='3' then osaamispisteet else 0 end) 
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_4' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='4' then osaamispisteet else 0 end) 
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='kustannusryhma' and kerroin_koodi='kr_5' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d1.tutkintotyyppi_koodi in ('19','20') and d2.koodi='5' then osaamispisteet else 0 end) 
			)	  
		
		,[painotettu_tutkinnon_osien_osaamispisteet_erityistuki] = 
				  (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_13' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='2' then osaamispisteet else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_15' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='4' then osaamispisteet else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_16' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='5' then osaamispisteet else 0 end)
				+ (select suoritusrahoitus from sa.sa_amos_siirtotiedosto_okm7 where kerroin_luokka='erityisopetus' and kerroin_koodi='eo_17' and f.tilastovuosi+2 = varainhoitovuosi) * (case when d6.erityisopetus_koodi='6' then osaamispisteet else 0 end)
			

	  FROM [ANTERO].[dw].[f_amos_spl_tutkinnot_ja_tutkinnonosat_tabular] f
	  left join ANTERO.dw.d_koulutusluokitus d1 on d1.id = f.d_koulutusluokitus_id
	  left join ANTERO.dw.d_ammatillisen_tutkinnon_kustannusryhma d2 on d2.id = f.d_kustannusryhma_id
	  left join ANTERO.dw.d_erityisopetus d6 on d6.id = f.d_erityisopetus_id
	  left join ANTERO.dw.d_organisaatioluokitus d3 on d3.id = f.d_organisaatioluokitus_jarjestaja_id
	  left join ANTERO.sa.sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot d4 on d4.vuosi = f.Tilastovuosi and d4.ytunnus = d3.organisaatio_koodi and d4.kr = d2.koodi and d4.tutktyyppi = (case when d1.tutkintotyyppi_koodi in ('19','20') then '19_20' else tutkintotyyppi_koodi end)
	  left join ANTERO.dw.d_suorituksen_tyyppi d5 on d5.id = f.d_suorituksen_tyyppi_id
	  --tutkinnon osien osaamispisteiden leikkuria varten lasketaan rahoituksessa huomioitavien osaamispisteiden summa per järjestäjä per vuosi
	  left join (
			SELECT 
				 f.tilastovuosi
				,d1.organisaatio_koodi
				,osaamispisteet_sum = sum(f.osaamispisteet)
			FROM dw.f_amos_spl_tutkinnot_ja_tutkinnonosat_tabular f
			JOIN dw.d_organisaatioluokitus d1 on d1.id = f.d_organisaatioluokitus_jarjestaja_id
			JOIN dw.d_opintojenrahoitus d2 on d2.id = f.d_opintojenrahoitus_id
			WHERE d2.sisaltyy_okm_suoritusrahoitus = 1
			GROUP BY d1.organisaatio_koodi, f.tilastovuosi
	  ) os_pisteet_summa ON os_pisteet_summa.organisaatio_koodi = d3.organisaatio_koodi AND os_pisteet_summa.tilastovuosi = f.tilastovuosi


) q

