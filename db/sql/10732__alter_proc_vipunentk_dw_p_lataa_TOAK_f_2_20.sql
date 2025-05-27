USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_TOAK_f_2_20]    Script Date: 26.3.2025 9.52.23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[p_lataa_TOAK_f_2_20] AS

truncate table vipunentk.dbo.f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan;

insert into vipunentk.dbo.f_TOAK_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan
 
--sel
SELECT --DISTINCT
       tilastointivuosi=f.tilastointivuosi
      ,tilv_date = f.tilv_date
      ,[lahde_id]= coalesce(d1.id,-1)
      ,[oppilaitoksen_oppilaitostyyppi_id]=  coalesce(d2.id,-1)
      ,[koulutusluokitus_id]= coalesce(d3.id,-1)
      ,[koulutusluokitus_historia_id]= coalesce(d3h.id,-1)
      ,[nuorten_aikuisten_koulutus_id]= coalesce(d4.id,-1)
      ,[opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id]= coalesce(d5.id,-1)
      ,[ammatillisen_koulutuksen_koulutuslaji_id]= coalesce(d6.id,-1)
      ,[opetushallinnon_koulutus_id]= coalesce(d7.id,-1)	  
      ,[koulutuksen_kunta_id]= coalesce(d8.id,-1)
      ,[koulutuksen_kunta_historia_id]= coalesce(d8h.id,-1)
      ,[rahoituslahde_id]= coalesce(d9.id,-1)
	  ,[koulutuksen_tavoite_id]=coalesce(d58.id,-1)
      ,[sukupuoli_id]= coalesce(d10.id,-1)
      ,[aidinkieli_versio1_id]= coalesce(d11.id,-1)
      ,[kirjoihintulovuosi_id]= coalesce(d12.kausi_id,'-1')
      ,[kirjoihintulolukukausi_id]= coalesce(d13.kausi_id,'-1')
      ,[opiskelijan_olo_syys_id]= coalesce(d14.id,-1)
      ,[aikaisempi_ylsk_koulutus_id]= coalesce(d15.id,-1)
      ,[aikaisempi_ammpk_tarkempi]=f.aikaisempi_ammpk_tarkempi
	  ,[ammpk_pohjakoulutuksen_tila] = f.ammpk_pohjakoulutuksen_tila
      ,[aikaisemman_ammpk_opintoala2002_id]=coalesce(d16h.id,-1)
      ,[aikaisemman_ammpk_koulutusala2002_id]= coalesce(d17h.id,-1)
      ,[aikaisemman_ammpk_koulutusaste2002_id]=coalesce(d18h.id,-1)
	  ,[aikaisemman_ammpk_koulutusala_taso2_id]=coalesce(d50.id,-1)
	  ,[aikaisemman_ammpk_koulutusaste_taso2_id]=coalesce(d51.id,-1)
      ,[aikaisemman_ammpk_suoritusvuosi_id]=coalesce(d19.kausi_id,'-1')
      ,[aikaisempi_ammpk_nayttotutkintona_tarkempi]=f.aikaisempi_ammpk_nayttotutkintona_tarkempi
      ,[aikaisempi_ammpk_oppisopimuskoulutuksena_tarkempi]=f.aikaisempi_ammpk_oppisopimuskoulutuksena_tarkempi
      ,[aikaisempi_ammlisa_tarkempi]=f.aikaisempi_ammlisa_tarkempi
	  ,[ammlisa_pohjakoulutuksen_tila] = f.ammlisa_pohjakoulutuksen_tila
      ,[aikaisemman_ammlisa_opintoala2002_id]=coalesce(d20h.id,-1)
      ,[aikaisemman_ammlisa_koulutusala2002_id]=coalesce(d21h.id,-1)
      ,[aikaisemman_ammlisa_koulutusaste2002_id]=coalesce(d22h.id,-1)
	  ,[aikaisemman_ammlisa_koulutusala_taso2_id]=coalesce(d52.id,-1)
	  ,[aikaisemman_ammlisa_koulutusaste_taso2_id]=coalesce(d53.id,-1)
      ,[aikaisemman_ammlisa_suoritusvuosi_id]=coalesce(d23.kausi_id,'-1')
      ,[aikaisempi_ammlisa_oppisopimuskoulutuksena_tarkempi]=f.aikaisempi_ammlisa_oppisopimuskoulutuksena_tarkempi
      ,[aikaisempi_alempi_kk_tarkempi]=f.aikaisempi_alempi_kk_tarkempi
	  ,[alempi_kk_pohjakoulutuksen_tila] = f.alempi_kk_pohjakoulutuksen_tila
      ,[aikaisemman_alemman_kk_opintoala1995_id]=coalesce(d24h.id,-1)
      ,[aikaisemman_alemman_kk_koulutusala1995_id]=coalesce(d25h.id,-1)
      ,[aikaisemman_alemman_kk_opintoala2002_id]=coalesce(d26h.id,-1)
      ,[aikaisemman_alemman_kk_koulutusala2002_id]=coalesce(d27h.id,-1)
      ,[aikaisemman_alemman_kk_koulutusaste2002_id]=coalesce(d28h.id,-1)
	  ,[aikaisemman_alemman_kk_koulutusala_taso2_id]=coalesce(d54.id,-1)
	  ,[aikaisemman_alemman_kk_koulutusaste_taso2_id]=coalesce(d55.id,-1)
      ,[aikaisemman_alemman_kk_suoritusvuosi_id]=coalesce(d29.kausi_id,'-1')
      ,[aikaisempi_ylempi_kk_tarkempi]=f.aikaisempi_ylempi_kk_tarkempi
	  ,[ylempi_kk_pohjakoulutuksen_tila] = f.ylempi_kk_pohjakoulutuksen_tila
      ,[aikasemman_ylemman_kk_opintoala1995_id]=coalesce(d30h.id,-1)
      ,[aikasemman_ylemman_kk_koulutusala1995_id]=coalesce(d31h.id,-1)
      ,[aikasemman_ylemman_kk_opintoala2002_id]=coalesce(d32h.id,-1)
      ,[aikasemman_ylemman_kk_koulutusala2002_id]=coalesce(d33h.id,-1)
      ,[aikasemman_ylemman_kk_koulutusaste2002_id]=coalesce(d34h.id,-1)
	  ,[aikasemman_ylemman_kk_koulutusala_taso2_id]=coalesce(d56.id,-1)
	  ,[aikasemman_ylemman_kk_koulutusaste_taso2_id]=coalesce(d57.id,-1)
      ,[aikaisemman_ylemman_kk_suoritusvuosi_id]=coalesce(d35.kausi_id,'-1')
      ,[opiskelijan_asuinkunta_id] =coalesce(d36.id,-1)
      ,[opiskelijan_asuinkunta_historia_id]=coalesce(d37h.id,-1)
      ,[lukumaara]=f.lukumaara
      ,[rivinumero]=f.rivinumero
      ,[ika_1v_id]=coalesce(d38.id,-1)
      ,[ika_5v_id]=coalesce(d39.id,-1)
      ,[ika_14_65_id]=coalesce(d40.id,-1)
      ,[aikaisemmasta_koulutuksesta_ammpk_kulunut_aika_id]=coalesce(d41.id,-1)
      ,[aikaisemmasta_koulutuksesta_ammlisa_kulunut_aika_id]=coalesce(d42.id,-1)
      ,[aikaisemmasta_koulutuksesta_alempi_kk_kulunut_aika_id]=coalesce(d43.id,-1)
      ,[aikaisemmasta_koulutuksesta_ylempi_kk_kulunut_aika_id]=coalesce(d44.id,-1)
      ,[aiemman_tutkinnon_ammpk_opintoala_sama]=f.aiemman_tutkinnon_ammpk_opintoala_sama 
      ,[aiemman_tutkinnon_ammpk_koulutusala_sama]=f.aiemman_tutkinnon_ammpk_koulutusala_sama 
      ,[aiemman_tutkinnon_ammpk_koulutusaste_sama]=f.aiemman_tutkinnon_ammpk_koulutusaste_sama 
      ,[aiemman_tutkinnon_ammlisa_opintoala_sama]=f.aiemman_tutkinnon_ammlisa_opintoala_sama 
      ,[aiemman_tutkinnon_ammlisa_koulutusala_sama]=f.aiemman_tutkinnon_ammlisa_koulutusala_sama 
      ,[aiemman_tutkinnon_ammlisa_koulutusaste_sama]=f.aiemman_tutkinnon_ammlisa_koulutusaste_sama 
      ,[aiemman_tutkinnon_alempi_kk_opintoala_sama]=f.aiemman_tutkinnon_alempi_kk_opintoala_sama 
      ,[aiemman_tutkinnon_alempi_kk_koulutusala_sama]=f.aiemman_tutkinnon_alempi_kk_koulutusala_sama 
      ,[aiemman_tutkinnon_alempi_kk_koulutusaste_sama]=f.aiemman_tutkinnon_alempi_kk_koulutusaste_sama 
      ,[aiemman_tutkinnon_ylempi_kk_opintoala_sama]=f.aiemman_tutkinnon_ylempi_kk_opintoala_sama 
      ,[aiemman_tutkinnon_ylempi_kk_koulutusala_sama]=f.aiemman_tutkinnon_ylempi_kk_koulutusala_sama 
      ,[aiemman_tutkinnon_ylempi_kk_koulutusaste_sama]=f.aiemman_tutkinnon_ylempi_kk_koulutusaste_sama 
      ,[aikaisempi_korkein_tutkinto_id] = coalesce(d45.id,-1)
	  ,[aiemman_tutkinnon_opintoala2002_sama]=f.aiemman_tutkinnon_opintoala2002_sama 
	  ,[aiemman_tutkinnon_koulutusaste2002_sama]=f.aiemman_tutkinnon_koulutusaste2002_sama 
	  ,[aiemman_tutkinnon_koulutusala2002_sama]=f.aiemman_tutkinnon_koulutusala2002_sama 
	  ,[aiemman_tutkinnon_koulutusala_taso2_sama]=f.aiemman_tutkinnon_koulutusala_taso2_sama 
	  ,[aiemman_tutkinnon_koulutusaste_taso2_sama]=f.aiemman_tutkinnon_koulutusaste_taso2_sama 
	  ,[nuorten_aikuisten_koulutus_amm_id] = coalesce(d46.id,-1)
      ,[koulutuksen_jarjestamismuoto_id] = coalesce(d47.id,-1)
	  ,[aloittaneet]=f.aloittaneet
	  ,[viimeisimman_koulutuksen_suorituvuosi] =coalesce(d48.kausi_id,'-1')
	  ,[viimeisimmästä_koulutuksesta_kulunut_aika] =coalesce(d49.id,-1)
	  ,[hallinnonala2_id] = coalesce(d7b.id,-1)
      --frm
FROM [VipunenTK_DW].[dbo].[f_2_20_Lukio_amm_oppis_opisk_ian_ja_aik_koul_mukaan] AS f
LEFT JOIN VipunenTK..d_lahde   AS d1 ON d1.lahde_koodi =f.lahde 
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d2 ON d2.oppilaitos_avain  ='OLTYP'+f.oppilaitoksen_oppilaitostyyppi
LEFT JOIN VipunenTK..d_koulutusluokitus  AS d3 ON d3.koulutusluokitus_avain  =f.koulutusluokitus 
LEFT JOIN VipunenTK..d_koulutusluokitus_historia  AS d3h ON d3h.koulutusluokitus_avain   =f.koulutusluokitus AND f.tilv_date between d3h.alkaa and d3h.paattyy
LEFT JOIN VipunenTK..d_nuorten_aikuisten_koulutus AS d4 ON d4.nuorten_aikuisten_koulutus_koodi  =f.nuorten_aikuisten_koulutus 
LEFT JOIN VipunenTK..d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus AS d5 ON d5.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi   = f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus
LEFT JOIN VipunenTK..d_ammatillisen_koulutuksen_koulutuslaji AS d6 ON d6.ammatillisen_koulutuksen_koulutuslaji_koodi= f.ammatillisen_koulutuksen_koulutuslaji
LEFT JOIN VipunenTK..d_opetushallinnon_koulutus AS d7 ON d7.opetushallinnon_koulutus_koodi = f.opetushallinnon_koulutus
LEFT JOIN VipunenTK..d_hallinnonala2 AS d7b ON d7b.hallinnonala_koodi = f.hallinnonala2
LEFT JOIN VipunenTK..d_alueluokitus AS d8 ON d8.alueluokitus_avain  = f.koulutuksen_kunta
LEFT JOIN VipunenTK..d_alueluokitus_historia AS d8h ON d8h.alueluokitus_avain = f.koulutuksen_kunta AND f.tilv_date between d8h.alkaa and d8h.paattyy
LEFT JOIN VipunenTK..d_rahoituslahde_amm    AS d9 ON d9.rahoituslahde_amm_koodi     = f.rahoituslahde
LEFT JOIN VipunenTK..d_sukupuoli  AS d10 ON d10.sukupuoli_koodi     = f.sukupuoli
LEFT JOIN VipunenTK..d_aidinkieli_versio1  AS d11 ON d11.aidinkieli_versio1_koodi   = f.aidinkieli_versio1
LEFT JOIN VipunenTK..d_kausi   AS d12 ON d12.kausi_id  = f.kirjoihintulovuosi
LEFT JOIN VipunenTK..d_kausi   AS d13 ON d13.kausi_id  = f.kirjoihintulovuosi+f.kirjoihintulolukukausi
LEFT JOIN VipunenTK..d_opiskelijan_olo    AS d14 ON d14.opiskelijan_olo_koodi   = f.opiskelijan_olo_syys
LEFT JOIN VipunenTK..d_opiskelijan_aikaisempi_yleissivistava_koulutus    AS d15 ON d15.opiskelijan_aikaisempi_yleissivistava_koulutus_koodi   = f.aikaisempi_ylsk_koulutus
LEFT JOIN VipunenTK..d_koulutusluokitus_historia   AS d16h ON d16h.koulutusluokitus_avain   = 'OPMOPA'+f.aikaisemman_ammpk_opintoala2002 AND f.tilv_date between d16h.alkaa and d16h.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus_historia   AS d17h ON d17h.koulutusluokitus_avain   = 'OPMALA'+f.aikaisemman_ammpk_koulutusala2002 AND f.tilv_date between d17h.alkaa and d17h.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus_historia   AS d18h ON d18h.koulutusluokitus_avain  = 'OPMAST'+f.aikaisemman_ammpk_koulutusaste2002 AND f.tilv_date between d18h.alkaa and d18h.paattyy
LEFT JOIN VipunenTK..d_kausi   AS d19 ON d19.kausi_id  = f.aikaisemman_ammpk_suoritusvuosi
LEFT JOIN VipunenTK..d_koulutusluokitus_historia   AS d20h ON d20h.koulutusluokitus_avain   = 'OPMOPA'+f.aikaisemman_ammlisa_opintoala2002 AND f.tilv_date between d20h.alkaa and d20h.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus_historia   AS d21h ON d21h.koulutusluokitus_avain   = 'OPMALA'+f.aikaisemman_ammlisa_koulutusala2002 AND f.tilv_date between d21h.alkaa and d21h.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus_historia   AS d22h ON d22h.koulutusluokitus_avain   = 'OPMAST'+f.aikaisemman_ammlisa_koulutusaste2002 AND f.tilv_date between d22h.alkaa and d22h.paattyy
LEFT JOIN VipunenTK..d_kausi   AS d23 ON d23.kausi_id  = f.aikaisemman_ammlisa_suoritusvuosi
LEFT JOIN VipunenTK..d_koulutusluokitus_historia   AS d24h ON d24h.koulutusluokitus_avain   = 'OPM95OPA'+f.aikaisemman_alemman_kk_opintoala1995 AND f.tilv_date between d24h.alkaa and d24h.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus_historia   AS d25h ON d25h.koulutusluokitus_avain   = 'OPM95ALA'+f.aikaisemman_alemman_kk_koulutusala1995 AND f.tilv_date between d25h.alkaa and d25h.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus_historia   AS d26h ON d26h.koulutusluokitus_avain   = 'OPMOPA'+f.aikaisemman_alemman_kk_opintoala2002 AND f.tilv_date between d26h.alkaa and d26h.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus_historia   AS d27h ON d27h.koulutusluokitus_avain   = 'OPMALA'+f.aikaisemman_alemman_kk_koulutusala2002 AND f.tilv_date between d27h.alkaa and d27h.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus_historia   AS d28h ON d28h.koulutusluokitus_avain   = 'OPMAST'+f.aikaisemman_alemman_kk_koulutusaste2002 AND f.tilv_date between d28h.alkaa and d28h.paattyy
LEFT JOIN VipunenTK..d_kausi   AS d29 ON d29.kausi_id  = f.aikaisemman_alemman_kk_suoritusvuosi
LEFT JOIN VipunenTK..d_koulutusluokitus_historia   AS d30h ON d30h.koulutusluokitus_avain   = 'OPM95OPA'+f.aikasemman_ylemman_kk_opintoala1995 AND f.tilv_date between d30h.alkaa and d30h.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus_historia   AS d31h ON d31h.koulutusluokitus_avain  = 'OPM95ALA'+f.aikasemman_ylemman_kk_koulutusala1995 AND f.tilv_date between d31h.alkaa and d31h.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus_historia   AS d32h ON d32h.koulutusluokitus_avain  = 'OPMOPA'+f.aikasemman_ylemman_kk_opintoala2002 AND f.tilv_date between d32h.alkaa and d32h.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus_historia   AS d33h ON d33h.koulutusluokitus_avain   = 'OPMALA'+f.aikasemman_ylemman_kk_koulutusala2002 AND f.tilv_date between d33h.alkaa and d33h.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus_historia   AS d34h ON d34h.koulutusluokitus_avain   = 'OPMAST'+f.aikasemman_ylemman_kk_koulutusaste2002 AND f.tilv_date between d34h.alkaa and d34h.paattyy
LEFT JOIN VipunenTK..d_kausi   AS d35 ON d35.kausi_id  = f.aikaisemman_ylemman_kk_suoritusvuosi
LEFT JOIN VipunenTK..d_alueluokitus AS d36 ON d36.alueluokitus_avain  = f.opiskelijan_asuinkunta
LEFT JOIN VipunenTK..d_alueluokitus_historia AS d37h ON d37h.alueluokitus_avain = f.opiskelijan_asuinkunta AND f.tilv_date between d37h.alkaa and d37h.paattyy
LEFT JOIN VipunenTK..d_ika    AS d38 ON d38.ika_avain     = f.ika_1v
LEFT JOIN VipunenTK..d_ika    AS d39 ON d39.ika_avain   = f.ika_5v
LEFT JOIN VipunenTK..d_ika    AS d40 ON d40.ika_avain   = f.ika_14_65
LEFT JOIN VipunenTK..d_koulutuksesta_kulunut_aika    AS d41 ON d41.koulutuksesta_kulunut_aika_koodi   = f.aikaisemmasta_koulutuksesta_ammpk_kulunut_aika
LEFT JOIN VipunenTK..d_koulutuksesta_kulunut_aika    AS d42 ON d42.koulutuksesta_kulunut_aika_koodi   = f.aikaisemmasta_koulutuksesta_ammlisa_kulunut_aika
LEFT JOIN VipunenTK..d_koulutuksesta_kulunut_aika    AS d43 ON d43.koulutuksesta_kulunut_aika_koodi   = f.aikaisemmasta_koulutuksesta_alempi_kk_kulunut_aika
LEFT JOIN VipunenTK..d_koulutuksesta_kulunut_aika    AS d44 ON d44.koulutuksesta_kulunut_aika_koodi   = f.aikaisemmasta_koulutuksesta_ylempi_kk_kulunut_aika
LEFT JOIN VipunenTK..d_aikaisempi_korkein_tutkinto    AS d45 ON d45.aikaisempi_korkein_tutkinto_koodi   = f.aikaisempi_korkein_tutkinto
LEFT JOIN VipunenTK..d_nuorten_aikuisten_koulutus_amm     AS d46 ON d46.nuorten_aikuisten_koulutus_amm_koodi    = f.nuorten_aikuisten_koulutus_amm
LEFT JOIN VipunenTK..d_koulutuksen_jarjestamismuoto    AS d47 ON d47.koulutuksen_jarjestamismuoto_koodi    = f.koulutuksen_jarjestamismuoto
LEFT JOIN VipunenTK..d_kausi   AS d48 ON d48.kausi_id  = f.viimeisimman_koulutuksen_suorituvuosi
LEFT JOIN VipunenTK..d_koulutuksesta_kulunut_aika    AS d49 ON d49.koulutuksesta_kulunut_aika_koodi   = f.viimeisimmasta_koulutuksesta_kulunut_aika
LEFT JOIN VipunenTK..d_koulutusluokitus AS d50 ON d50.koulutusluokitus_avain   = 'ISCFINARROW'+f.aikaisemman_ammpk_koulutusala_taso2
LEFT JOIN VipunenTK..d_koulutusluokitus AS d51 ON d51.koulutusluokitus_avain   = 'KASTET2'+f.aikaisemman_ammpk_koulutusaste_taso2
LEFT JOIN VipunenTK..d_koulutusluokitus AS d52 ON d52.koulutusluokitus_avain   = 'ISCFINARROW'+f.aikaisemman_ammlisa_koulutusala_taso2
LEFT JOIN VipunenTK..d_koulutusluokitus AS d53 ON d53.koulutusluokitus_avain   = 'KASTET2'+f.aikaisemman_ammlisa_koulutusaste_taso2
LEFT JOIN VipunenTK..d_koulutusluokitus AS d54 ON d54.koulutusluokitus_avain   = 'ISCFINARROW'+f.aikaisemman_alemman_kk_koulutusala_taso2
LEFT JOIN VipunenTK..d_koulutusluokitus AS d55 ON d55.koulutusluokitus_avain   = 'KASTET2'+f.aikaisemman_alemman_kk_koulutusaste_taso2
LEFT JOIN VipunenTK..d_koulutusluokitus AS d56 ON d56.koulutusluokitus_avain   = 'ISCFINARROW'+f.aikasemman_ylemman_kk_koulutusala_taso2
LEFT JOIN VipunenTK..d_koulutusluokitus AS d57 ON d57.koulutusluokitus_avain   = 'KASTET2'+f.aikasemman_ylemman_kk_koulutusaste_taso2

LEFT JOIN VipunenTK..d_tutkinnon_tavoite AS d58 ON d58.tutkinnon_tavoite_koodi  = f.koulutuksen_tavoite

GO


