USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut]    Script Date: 8.12.2019 20:35:18 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat]    Script Date: 8.12.2019 20:35:18 ******/
DROP PROCEDURE IF EXISTS [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat]    Script Date: 8.12.2019 20:35:18 ******/
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
	 [Tilastovuosi] = tt.vuosi
	,d_kalenteri_id = coalesce(d9.id, -1)
	,d_koulutusluokitus_id = coalesce(d2b.id,d2.id,-1)
	
	,d_opintojenrahoitus_id = coalesce(d5.id,-1)
	,d_kustannusryhma_id = coalesce(d7.id,-1)
	,d_oppisopimuskoulutus_id = coalesce(d4.id,-1)
	,d_erityisopetus_id = coalesce(d3.id,-1)
	,d_suorituksen_tyyppi_id = coalesce(d8.id,-1)

	,d_organisaatioluokitus_jarjestaja_id = coalesce(d1.id,-1)
	,d_amos_spl_jarjestaja_linkki_id = coalesce(d1b.id,-1)

    ,koko_tutkinto = count(distinct tutkinto)
    ,tutkinnon_osat = count(distinct tutkinnon_osa)
	,osaamispisteet = sum(coalesce(laajuus,0))

FROM  Koski_SA.dbo.tutkinnot_ja_tutkinnonosat_valitaulu_tasot_yhdistetty tt

LEFT JOIN dw.d_organisaatioluokitus d1 on d1.organisaatio_oid = tt.koulutustoimija_oid
LEFT JOIN dw.d_amos_spl_jarjestaja_linkki d1b on d1b.oid_avain = tt.koulutustoimija_oid
LEFT JOIN dw.d_koulutusluokitus d2 on d2.koulutusluokitus_koodi = tt.tutkinto_koodi
LEFT JOIN dw.d_koulutusluokitus d2b on d2b.koulutusluokitus_koodi = d2.uusi_eat_koodi
LEFT JOIN dw.d_erityisopetus d3 on d3.erityisopetus_koodi = tt.erityisopetus_koodi
LEFT JOIN dw.d_oppisopimuskoulutus d4 on d4.koodi = tt.oppisopimus_koodi
LEFT JOIN dw.d_opintojenrahoitus d5 on d5.koodi = tt.opintojen_rahoitus_koodi
LEFT JOIN dw.d_ammatillisen_tutkinnon_kustannusryhma d7 on d7.koodi = tt.kustannusryhma_koodi
LEFT JOIN dw.d_suorituksen_tyyppi d8 on d8.koodi = tt.suorituksen_tyyppi_koodi
LEFT JOIN dw.d_kalenteri d9 on d9.kalenteri_avain = CONCAT(tt.vuosi,'-',right('00' & tt.kuukausi,2),'-01')

group by 
	 tt.vuosi
	,d1.id
	,d1b.id
	,d2.id
	,d2b.id
	,d3.id
	,d4.id
	,d5.id
	,d7.id
	,d8.id
	,d9.id
	
HAVING 
	   count(distinct tutkinto) > 0
    OR count(distinct tutkinnon_osa) > 0
    OR sum(coalesce(laajuus,0)) > 0	


GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_tutkinnot_ja_tutkinnonosat_painotetut]    Script Date: 8.12.2019 20:35:18 ******/
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
	,[d_kalenteri_id]
	,[d_erityisopetus_id]
	,[d_koulutusluokitus_id]
	,[d_organisaatioluokitus_jarjestaja_id]
	,[d_amos_spl_jarjestaja_linkki_id]
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
		,[d_kalenteri_id]
		,[d_erityisopetus_id]
		,[d_koulutusluokitus_id]
		,[d_organisaatioluokitus_jarjestaja_id]
		,[d_amos_spl_jarjestaja_linkki_id]
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
	  left join ANTERO.dw.d_amos_spl_jarjestaja_linkki d3b on d3b.id = f.d_amos_spl_jarjestaja_linkki_id
	  left join ANTERO.sa.sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot d4 on d4.vuosi = (case when f.Tilastovuosi > @maxTilv then f.Tilastovuosi-1 else f.Tilastovuosi end) and d4.ytunnus = d3.organisaatio_koodi and cast(d4.kr as varchar) = d2.koodi and d4.tutktyyppi = (case when d1.tutkintotyyppi_koodi in ('19','20') then '19_20' else tutkintotyyppi_koodi end)
	  left join ANTERO.dw.d_suorituksen_tyyppi d5 on d5.id = f.d_suorituksen_tyyppi_id
	  --tutkinnon osien osaamispisteiden leikkuria varten lasketaan rahoituksessa huomioitavien osaamispisteiden summa per järjestäjä per vuosi
	  left join (
			SELECT 
				 f.tilastovuosi
				,organisaatio_koodi = d1.ytunnus_amos_spl
				,osaamispisteet_sum = sum(f.osaamispisteet)
			FROM dw.f_amos_tutkinnot_ja_tutkinnonosat f
			JOIN dw.d_amos_spl_jarjestaja_linkki d1 on d1.id = f.d_amos_spl_jarjestaja_linkki_id
			JOIN dw.d_opintojenrahoitus d2 on d2.id = f.d_opintojenrahoitus_id
			WHERE d2.sisaltyy_okm_suoritusrahoitus = 1
			GROUP BY f.tilastovuosi, d1.ytunnus_amos_spl
	  ) os_pisteet_summa ON os_pisteet_summa.organisaatio_koodi = d3b.ytunnus_amos_spl AND os_pisteet_summa.tilastovuosi = f.tilastovuosi

	  --jos järjestäjälle ei löydy pohjakoulutustietoja, käytetään koko aineiston jakaumaa
	  cross apply (SELECT avg([osuus_ei_pohjakoul_koko]) as ka_koko FROM [ANTERO].[sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] WHERE tutktyyppi='02' and vuosi=@maxTilv) A1
	  cross apply (SELECT avg([osuus_pohjakoul_koko]) as ka_koko FROM [ANTERO].[sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] WHERE tutktyyppi='02' and vuosi=@maxTilv) A2
	  cross apply (SELECT avg([osuus_ei_pohjakoul_koko]) as ka_koko FROM [ANTERO].[sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] WHERE tutktyyppi='19_20' and vuosi=@maxTilv) B1
	  cross apply (SELECT avg([osuus_pohjakoul_koko]) as ka_koko FROM [ANTERO].[sa].[sa_amos_tutkinnot_pohjakoulutus_kaikki_unpivot] WHERE tutktyyppi='19_20' and vuosi=@maxTilv) B2
	  
) q


GO
USE [ANTERO]