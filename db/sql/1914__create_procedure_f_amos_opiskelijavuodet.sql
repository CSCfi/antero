USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_f_amos_opiskelijavuodet]    Script Date: 26.10.2018 14:01:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_amos_opiskelijavuodet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_amos_opiskelijavuodet] AS' 
END
GO

ALTER procedure [dw].[p_lataa_f_amos_opiskelijavuodet] as


truncate table dw.f_amos_opiskelijavuodet
insert into dw.f_amos_opiskelijavuodet

select
	 vuosi
	,aineisto as vaihe
	,coalesce(d1.id,-1)
	,profiilikerroin = painotettu_opiskelijavuosimäärä / painottamaton_opiskelijavuosimaara
	,painottamaton_opiskelijavuosimaara
	,painotettu_opiskelijavuosimäärä
from (

	select
		 vuosi
		,aineisto
		,ytunnus
		,painottamaton_opiskelijavuosimaara = sum(painottamaton_opiskelijavuosimaara)
		,painotettu_opiskelijavuosimäärä = sum(opiskelijavuosi_kustannusryhma_tutkintotyyppi)
										  +sum(opiskelijavuosi_erityisopetus)
										  +sum(opiskelijavuosi_majoitus)
										  +sum(opiskelijavuosi_henkilostokoulutus)
	from (
		--summatietojen kertominen kertoimilla
		select
			 vuosi
			,aineisto
			,coalesce(nullif(ytunnus,'.'),(SELECT organisaatio_koodi FROM ANTERO.dw.d_organisaatioluokitus d WHERE d.organisaatio_fi=jarj_nimi)) as ytunnus
			,opiskelijavuosi_kustannusryhma_tutkintotyyppi = 
				(select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintotyyppi (opiskelijat)' and ryhma_koodi='pt' and vuosi between year(alkaen) and year(paattyen)) *
					( 
						  (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='1' and vuosi between year(alkaen) and year(paattyen)) * pt_kr1
						+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='2' and vuosi between year(alkaen) and year(paattyen)) * pt_kr2
						+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='3' and vuosi between year(alkaen) and year(paattyen)) * pt_kr3
						+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='4' and vuosi between year(alkaen) and year(paattyen)) * pt_kr4
						+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='5' and vuosi between year(alkaen) and year(paattyen)) * pt_kr5
					)
				+
				(select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintotyyppi (opiskelijat)' and ryhma_koodi='at_eat' and vuosi between year(alkaen) and year(paattyen)) *
					(
						  (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='1' and vuosi between year(alkaen) and year(paattyen)) * at_eat_kr1
						+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='2' and vuosi between year(alkaen) and year(paattyen)) * at_eat_kr2
						+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='3' and vuosi between year(alkaen) and year(paattyen)) * at_eat_kr3
						+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='4' and vuosi between year(alkaen) and year(paattyen)) * at_eat_kr4
						+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='5' and vuosi between year(alkaen) and year(paattyen)) * at_eat_kr5
					)
				+		 (select kerroin from sa.sa_amos_kertoimet where tyyppi='Ei tutkintoon johtava' and ryhma_koodi='valma_ja_telma') * ei_tutk_johtava_valma_telma
				+		 (select kerroin from sa.sa_amos_kertoimet where tyyppi='Ei tutkintoon johtava' and ryhma_koodi='muu') * ei_tutk_johtava_muu

			,opiskelijavuosi_erityisopetus = 
				  (select kerroin from sa.sa_amos_kertoimet where tyyppi='Erityisopetus' and ryhma_koodi='tutk_koulutus' and vuosi between year(alkaen) and year(paattyen)) * et_tutk_koul
				+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Erityisopetus' and ryhma_koodi='valm_koulutus' and vuosi between year(alkaen) and year(paattyen)) * et_valm_koul
				+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Erityisopetus' and ryhma_koodi='tutk_koulutus_vaativa' and vuosi between year(alkaen) and year(paattyen)) * vaativa_et_tutk_koul
				+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Erityisopetus' and ryhma_koodi='valm_koulutus_vaativa' and vuosi between year(alkaen) and year(paattyen)) * vaativa_et_valm_koul
				+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Erityisopetus' and ryhma_koodi='valm_koulutus_vaativa_vaikeasti_vamm' and vuosi between year(alkaen) and year(paattyen)) * vaativa_et_valm_koul_vaik_vamm
				+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Erityisopetus' and ryhma_koodi='valm_koulutus_vaativa_vaikeasti_vamm_avustaja' and vuosi between year(alkaen) and year(paattyen)) * vaativa_et_valm_koul_vaik_vamm_ja_avust

			,opiskelijavuosi_majoitus = 
				  (select kerroin from sa.sa_amos_kertoimet where tyyppi='Majoitus' and ryhma_koodi='perus' and vuosi between year(alkaen) and year(paattyen)) * majoitus_perus
				+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Majoitus' and ryhma_koodi='sisaoppilaitos' and vuosi between year(alkaen) and year(paattyen)) * majoitus_sisaopp
				+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Majoitus' and ryhma_koodi='erityinen_tuki' and vuosi between year(alkaen) and year(paattyen)) * majoitus_et

			,opiskelijavuosi_henkilostokoulutus = 
				(select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintotyyppi (opiskelijat)' and ryhma_koodi='at_eat' and vuosi between year(alkaen) and year(paattyen)) *
					(	  
						  (select kerroin from sa.sa_amos_kertoimet where tyyppi='Henkilöstö' and ryhma_koodi='tutk_johtava' and vuosi between year(alkaen) and year(paattyen)) * (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='1' and vuosi between year(alkaen) and year(paattyen)) * hk_kr1
						+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Henkilöstö' and ryhma_koodi='tutk_johtava' and vuosi between year(alkaen) and year(paattyen)) * (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='2' and vuosi between year(alkaen) and year(paattyen)) * hk_kr2
						+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Henkilöstö' and ryhma_koodi='tutk_johtava' and vuosi between year(alkaen) and year(paattyen)) * (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='3' and vuosi between year(alkaen) and year(paattyen)) * hk_kr3
						+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Henkilöstö' and ryhma_koodi='tutk_johtava' and vuosi between year(alkaen) and year(paattyen)) * (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='4' and vuosi between year(alkaen) and year(paattyen)) * hk_kr4
						+ (select kerroin from sa.sa_amos_kertoimet where tyyppi='Henkilöstö' and ryhma_koodi='tutk_johtava' and vuosi between year(alkaen) and year(paattyen)) * (select kerroin from sa.sa_amos_kertoimet where tyyppi='Tutkintoon johtava' and ryhma_koodi='5' and vuosi between year(alkaen) and year(paattyen)) * hk_kr5
					)
				+		 (select kerroin from sa.sa_amos_kertoimet where tyyppi='Henkilöstö' and ryhma_koodi='ei_tutk_johtava' and vuosi between year(alkaen) and year(paattyen)) * (select kerroin from sa.sa_amos_kertoimet where tyyppi='Ei tutkintoon johtava' and ryhma_koodi='muu' and vuosi between year(alkaen) and year(paattyen)) * hk_muu

			,painottamaton_opiskelijavuosimaara = pt_kr1 + pt_kr2 + pt_kr3 + pt_kr4 + pt_kr5 + at_eat_kr1 + at_eat_kr2 + at_eat_kr3 + at_eat_kr4 + at_eat_kr5 + ei_tutk_johtava_valma_telma + ei_tutk_johtava_muu

		from (
				--opiskelija-aineistojen yhdistäminen ja sarakkeiden summaus sekä painotetun keskiarvon laskeminen (kevät=7 & syksy=5)
				select distinct
					 vuosi = coalesce(R02.vuosi,R03.vuosi,R03_hlo.vuosi,R13_l.vuosi,R13_p.vuosi,R14.vuosi,R14_hlo.vuosi)
					,aineisto = coalesce(R02.aineisto,R03.aineisto,R03_hlo.aineisto,R13_l.aineisto,R13_p.aineisto,R14.aineisto,R14_hlo.aineisto)
					,ytunnus = coalesce(org.uusi_ytunnus,R02.ytunnus,R03.ytunnus,R03_hlo.ytunnus,R13_l.ytunnus,R13_p.ytunnus,R14.ytunnus,R14_hlo.ytunnus)
					,jarj_nimi = coalesce(R02.saajanimen_lyhenne,R03.saajanimen_lyhenne,R03_hlo.saajanimen_lyhenne,R13_l.saajanimen_lyhenne,R13_p.saajanimen_lyhenne,R14.saajanimen_lyhenne,R14_hlo.saajanimen_lyhenne)

					,pt_kr1 = (7.0 * coalesce(R02.kustannusryhma1_kevat,0) + 5.0 * coalesce(R02.kustannusryhma1_syksy,0)) / 12.0 + (6.0 * coalesce(R13_p.kustannusryhma1_kevat,0) + 6.0 * coalesce(R13_p.kustannusryhma1_syksy,0)) / 12.0
					,pt_kr2 = (7.0 * coalesce(R02.kustannusryhma2_kevat,0) + 5.0 * coalesce(R02.kustannusryhma2_syksy,0)) / 12.0 + (6.0 * coalesce(R13_p.kustannusryhma2_kevat,0) + 6.0 * coalesce(R13_p.kustannusryhma2_syksy,0)) / 12.0
					,pt_kr3 = (7.0 * coalesce(R02.kustannusryhma3_kevat,0) + 5.0 * coalesce(R02.kustannusryhma3_syksy,0)) / 12.0 + (6.0 * coalesce(R13_p.kustannusryhma3_kevat,0) + 6.0 * coalesce(R13_p.kustannusryhma3_syksy,0)) / 12.0
					,pt_kr4 = (7.0 * coalesce(R02.kustannusryhma4_kevat,0) + 5.0 * coalesce(R02.kustannusryhma4_syksy,0)) / 12.0 + (6.0 * coalesce(R13_p.kustannusryhma4_kevat,0) + 6.0 * coalesce(R13_p.kustannusryhma4_syksy,0)) / 12.0
					,pt_kr5 = (7.0 * coalesce(R02.kustannusryhma5_kevat,0) + 5.0 * coalesce(R02.kustannusryhma5_syksy,0)) / 12.0 + (6.0 * coalesce(R13_p.kustannusryhma5_kevat,0) + 6.0 * coalesce(R13_p.kustannusryhma5_syksy,0)) / 12.0

					,at_eat_kr1 = coalesce(R03.kustannusryhma1,0) + (6.0 * coalesce(R13_l.kustannusryhma1_kevat,0) + 6.0 * coalesce(R13_l.kustannusryhma1_syksy,0)) / 12.0 + coalesce(R14.kustannusryhma1,0)
					,at_eat_kr2 = coalesce(R03.kustannusryhma2,0) + (6.0 * coalesce(R13_l.kustannusryhma2_kevat,0) + 6.0 * coalesce(R13_l.kustannusryhma2_syksy,0)) / 12.0 + coalesce(R14.kustannusryhma2,0)
					,at_eat_kr3 = coalesce(R03.kustannusryhma3,0) + (6.0 * coalesce(R13_l.kustannusryhma3_kevat,0) + 6.0 * coalesce(R13_l.kustannusryhma3_syksy,0)) / 12.0 + coalesce(R14.kustannusryhma3,0)
					,at_eat_kr4 = coalesce(R03.kustannusryhma4,0) + (6.0 * coalesce(R13_l.kustannusryhma4_kevat,0) + 6.0 * coalesce(R13_l.kustannusryhma4_syksy,0)) / 12.0 + coalesce(R14.kustannusryhma4,0)
					,at_eat_kr5 = coalesce(R03.kustannusryhma5,0) + (6.0 * coalesce(R13_l.kustannusryhma5_kevat,0) + 6.0 * coalesce(R13_l.kustannusryhma5_syksy,0)) / 12.0 + coalesce(R14.kustannusryhma5,0)

					,ei_tutk_johtava_valma_telma =  (7.0 * coalesce(R02.valma_kevat,0) + 5.0 * coalesce(R02.valma_syksy,0)) / 12.0
												  + (7.0 * coalesce(R02.telma_kevat,0) + 5.0 * coalesce(R02.telma_syksy,0)) / 12.0
					,ei_tutk_johtava_muu =				   coalesce(R03.ei_tutk_johtava_lahi,0) + coalesce(R03.ei_tutk_johtava_eta,0)
												  + (6.0 * coalesce(R13_l.ei_tutk_johtava_kevat,0) + 6.0 * coalesce(R13_l.ei_tutk_johtava_syksy,0)) / 12.0
												  +        coalesce(R14.ei_tutk_johtava,0)

					--erityisopetus
					,et_tutk_koul =	  (7.0 * coalesce(R02.erityinen_tuki_tutk_johtava_kevat,0) + 5.0 * coalesce(R02.erityinen_tuki_tutk_johtava_syksy,0)) / 12.0
									+ (6.0 * coalesce(R13_p.erityinen_tuki_tutk_johtava_kevat,0) + 6.0 * coalesce(R13_p.erityinen_tuki_tutk_johtava_syksy,0)) / 12.0
									+ (6.0 * coalesce(R13_l.erityinen_tuki_tutk_johtava_kevat,0) + 6.0 * coalesce(R13_l.erityinen_tuki_tutk_johtava_syksy,0)) / 12.0
									+      coalesce(R14.erityinen_tuki_tutk_johtava,0)
					,et_valm_koul = (7.0 * coalesce(R02.erityinen_tuki_muu_koulutus_kevat,0) + 5.0 * coalesce(R02.erityinen_tuki_muu_koulutus_syksy,0)) / 12.0
									   + coalesce(R14.erityinen_tuki_muu,0)
					,vaativa_et_tutk_koul = (7.0 * coalesce(R02.vaativa_erityinen_tuki_tutk_johtava_kevat,0)+ 5.0 * coalesce(R02.vaativa_erityinen_tuki_tutk_johtava_syksy,0)) / 12.0
					,vaativa_et_valm_koul = (7.0 * coalesce(R02.vaativa_erityinen_tuki_valma_telma_kevat,0)+ 5.0 * coalesce(R02.vaativa_erityinen_tuki_valma_telma_syksy,0)) / 12.0
					,vaativa_et_valm_koul_vaik_vamm = (7.0 * coalesce(R02.muu_vaikeasti_vammainen_lisa_kevat,0)+ 5.0 * coalesce(R02.muu_vaikeasti_vammainen_lisa_syksy,0)) / 12.0
					,vaativa_et_valm_koul_vaik_vamm_ja_avust = (7.0 * coalesce(R02.vaikeasti_vammainen_avustaja_lisa_kevat,0)+ 5.0 * coalesce(R02.vaikeasti_vammainen_avustaja_lisa_syksy,0)) / 12.0

					--majoitus
					,majoitus_perus =   (7.0 * coalesce(R02.muu_majoitus_kevat,0)+ 5.0 * coalesce(R02.muu_majoitus_syksy,0)) / 12.0
					,majoitus_sisaopp = (7.0 * coalesce(R02.sisaoppilaitos_majoitus_kevat,0)+ 5.0 * coalesce(R02.sisaoppilaitos_majoitus_syksy,0)) / 12.0
					,majoitus_et =		(7.0 * coalesce(R02.vaativan_erityisen_tuen_majoitus_kevat,0)+ 5.0 * coalesce(R02.vaativan_erityisen_tuen_majoitus_syksy,0)) / 12.0

					--henkilöstökoulutus
					,hk_kr1 = coalesce(R03_hlo.kustannusryhma1,0) + coalesce(R14_hlo.kustannusryhma1,0)
					,hk_kr2 = coalesce(R03_hlo.kustannusryhma2,0) + coalesce(R14_hlo.kustannusryhma2,0)
					,hk_kr3 = coalesce(R03_hlo.kustannusryhma3,0) + coalesce(R14_hlo.kustannusryhma3,0)
					,hk_kr4 = coalesce(R03_hlo.kustannusryhma4,0) + coalesce(R14_hlo.kustannusryhma4,0)
					,hk_kr5 = coalesce(R03_hlo.kustannusryhma5,0) + coalesce(R14_hlo.kustannusryhma5,0)
					,hk_muu = coalesce(R03_hlo.ei_tutk_johtava_lahi,0) + coalesce(R03_hlo.ei_tutk_johtava_eta,0) + coalesce(R14_hlo.ei_tutk_johtava,0)

				from sa.sa_amos_R02_perus R02
				full outer join sa.sa_amos_R03_erikoisopp R03 on R03.ytunnus=R02.ytunnus and R03.vuosi=R02.vuosi and R03.aineisto=R02.aineisto
				full outer join sa.sa_amos_R03_erikoisopp_hlo R03_hlo on R03_hlo.ytunnus=R03.ytunnus and R03_hlo.vuosi=R03.vuosi and R03_hlo.aineisto=R03.aineisto
				full outer join sa.sa_amos_R13_oppis_lisa R13_l on R13_l.ytunnus=R03_hlo.ytunnus and R13_l.vuosi=R03_hlo.vuosi and R13_l.aineisto=R03_hlo.aineisto
				full outer join sa.sa_amos_R13_oppis_perus R13_p on R13_p.ytunnus=R13_l.ytunnus and R13_p.vuosi=R13_l.vuosi and R13_p.aineisto=R13_l.aineisto
				full outer join sa.sa_amos_R14_lisa R14 on R14.ytunnus=R13_p.ytunnus and R14.vuosi=R13_p.vuosi and R14.aineisto=R13_p.aineisto
				full outer join sa.sa_amos_R14_lisa_hlo R14_hlo on R14_hlo.ytunnus=R14.ytunnus and R14_hlo.vuosi=R14.vuosi and R14_hlo.aineisto=R14.aineisto
				left join dw.v_amos_organisaatioliitokset org on org.poistuva_ytunnus=coalesce(R02.ytunnus,R03.ytunnus,R03_hlo.ytunnus,R13_l.ytunnus,R13_p.ytunnus,R14.ytunnus,R14_hlo.ytunnus)
		) q1
	) q2 group by vuosi,aineisto,ytunnus
) q3 left join ANTERO.dw.d_organisaatioluokitus d1 on d1.organisaatio_koodi=q3.ytunnus


