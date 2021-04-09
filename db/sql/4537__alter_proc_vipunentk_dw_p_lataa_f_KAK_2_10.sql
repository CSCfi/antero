USE [VipunenTK_DW]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_KAK_f_2_10]    Script Date: 9.4.2021 0:50:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[p_lataa_KAK_f_2_10] AS

truncate table [VipunenTK].[dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus];

insert into [VipunenTK].[dbo].[f_KAK_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus]
 
--sel
SELECT [tilastovuosi]=f.tilastointivuosi
      ,[tilv_date] = f.tilv_date
      ,[lahde_id]= coalesce(d1.id,-1)
      ,[oppilaitoksen_taustatiedot_id]=  coalesce(d2.id,-1)
	  ,[oppilaitoksen_taustatiedot_historia_id]=  coalesce(d2h.id,-1)
      ,[koulutusluokitus_id]= coalesce(d3.id,-1)
      ,[koulutusluokitus_historia_id]= coalesce(d3h.id,-1)
      ,[koulutuksen_kunta_id]= coalesce(d4.id,-1)
	  ,[koulutuksen_kunta_historia_id] = coalesce(d4h.id,-1)
      ,[sukupuoli_id]= coalesce(d5.id,-1)
      ,[aidinkieli_versio1_id]= coalesce(d6.id,-1)
      ,[ika_1v_id]=coalesce(d7.id,-1)
      ,[ika_5v_id]=coalesce(d8.id,-1)
      ,[ika_14_65_id]=coalesce(d9.id,-1)
	  ,[kotikunta_id]=coalesce(d10.id,-1)
	  ,[kotikunta_historia_id]=coalesce(d10h.id,-1)
	  ,[kansalaisuus_versio2_id]=coalesce(d11.id,-1)
	  ,[opiskelijan_olo_tamm_id]=coalesce(d12.id,-1)
      ,[opiskelijan_olo_syys_id]=coalesce(d13.id,-1)
      ,[rahoituslahde_id]=coalesce(d14.id,-1)
      ,[opiskelijan_fte_tieto_id]=coalesce(d15.id,-1)
      ,[vahintaan_45_op_suorittanut_id]=coalesce(d16.id,-1)
      ,[vahintaan_55_op_suorittanut_id]=coalesce(d17.id,-1)
	  --,[kirjoihintulovuosi_johdettu] --käytetty aloittaneiden sekä suhteessa aloitusaikaan määritettyjen muuttujien päättelyssä
      ,[kirjoihintulovuosi_id]= coalesce(d18.kausi_id,'-1')
      ,[kirjoihintulolukukausi_id]= coalesce(d19.kausi_id,'-1')
      ,[kirjoihintulovuosi_korkeakoulusektori_id]= coalesce(d20.kausi_id,'-1')
      ,[kirjoihintulovuosi_korkeakoulusektori_lasnaoleva_id]= coalesce(d21.kausi_id,'-1')
      ,[kirjoihintulovuosi_sektori_id]= coalesce(d22.kausi_id,'-1')
      ,[kirjoihintulovuosi_sektori_lasnaoleva_id]= coalesce(d23.kausi_id,'-1')
      ,[kirjoihintulovuosi_korkeakoulu_id]= coalesce(d24.kausi_id,'-1')
      ,[kirjoihintulovuosi_korkeakoulu_lasnaoleva_id]= coalesce(d25.kausi_id,'-1')
      ,[kirjoihintulovuosi_opintoala_id]= coalesce(d26.kausi_id,'-1')
      ,[kirjoihintulovuosi_opintoala_lasnaoleva_id]= coalesce(d27.kausi_id,'-1')
      ,[koulutustyyppi_id]=coalesce(d28.id,-1)
      ,[opiskelumuoto_id]=coalesce(d29.id,-1)
      ,[avoinvayla_id]=coalesce(d30.id,-1)
      ,[aikaisemmin_suoritettu_yotutk]= f.aikaisemmin_suoritettu_yotutk
      ,[aikaisemmin_suoritettu_yotutk_tarkempi]= f.aikaisemmin_suoritettu_yotutk_tarkempi
	  ,[yotutk_pohjakoulutuksen_tila] = f.yotutk_pohjakoulutuksen_tila
      ,[aikaisemmin_suoritetun_yotutk_koulutustiedot_id]=coalesce(d31.id,-1)
	  ,[aikaisemmin_suoritetun_yotutk_koulutustiedot_historia_id]=coalesce(d31h.id,-1)
      ,[aikaisemmin_suoritetun_yotutk_suoritusvuosi_id]= coalesce(d32.kausi_id,'-1')
      ,[aikaisemmin_suoritetun_yotutk_oppilaitostiedot_id]=coalesce(d33.id,-1)
	  ,[aikaisemmin_suoritetun_yotutk_oppilaitostiedot_historia_id]=coalesce(d33h.id,-1)
      ,[aikaisemmin_suoritettu_ammtutk]= f.aikaisemmin_suoritettu_ammtutk
      ,[aikaisemmin_suoritettu_ammtutk_tarkempi]= f.aikaisemmin_suoritettu_ammtutk_tarkempi
	  ,[ammtutk_pohjakoulutuksen_tila] = f.ammtutk_pohjakoulutuksen_tila
      ,[aikaisemmin_suoritetun_ammtutk_koulutustiedot_id]=coalesce(d34.id,-1)
	  ,[aikaisemmin_suoritetun_ammtutk_koulutustiedot_historia_id]=coalesce(d34h.id,-1)
      ,[aikaisemmin_suoritetun_ammtutk_suoritusvuosi_id]= coalesce(d35.kausi_id,'-1')
      ,[aikaisemmin_suoritetun_ammtutk_oppilaitostiedot_id]=coalesce(d36.id,-1)
	  ,[aikaisemmin_suoritetun_ammtutk_oppilaitostiedot_historia_id]=coalesce(d36h.id,-1)
      ,[aikaisemmin_suoritettu_amktutk]= f.aikaisemmin_suoritettu_amktutk
      ,[aikaisemmin_suoritettu_amktutk_tarkempi] = aikaisemmin_suoritettu_amktutk_tarkempi
	  ,[amktutk_pohjakoulutuksen_tila] = f.amktutk_pohjakoulutuksen_tila
      ,[aikaisemmin_suoritetun_amktutk_koulutustiedot_id]=coalesce(d37.id,-1)
	  ,[aikaisemmin_suoritetun_amktutk_koulutustiedot_historia_id]=coalesce(d37h.id,-1)
      ,[aikaisemmin_suoritetun_amktutk_suoritusvuosi_id]= coalesce(d38.kausi_id,'-1')
      ,[aikaisemmin_suoritetun_amktutk_oppilaitostiedot_id]=coalesce(d39.id,-1)
	  ,[aikaisemmin_suoritetun_amktutk_oppilaitostiedot_historia_id]=coalesce(d39h.id,-1)
      ,[aikaisemmin_suoritettu_ylempiamktutk] =f.aikaisemmin_suoritettu_ylempiamktutk
      ,[aikaisemmin_suoritettu_ylempiamktutk_tarkempi] = f.aikaisemmin_suoritettu_ylempiamktutk_tarkempi
	  ,[ylempiamktutk_pohjakoulutuksen_tila] = f.ylempiamktutk_pohjakoulutuksen_tila
      ,[aikaisemmin_suoritetun_ylempiamktutk_koulutustiedot_id]=coalesce(d40.id,-1)
	  ,[aikaisemmin_suoritetun_ylempiamktutk_koulutustiedot_historia_id]=coalesce(d40h.id,-1)
      ,[aikaisemmin_suoritetun_ylempiamktutk_suoritusvuosi_id]= coalesce(d41.kausi_id,'-1')
      ,[aikaisemmin_suoritetun_ylempiamktutk_oppilaitostiedot_id]=coalesce(d42.id,-1)
	  ,[aikaisemmin_suoritetun_ylempiamktutk_oppilaitostiedot_historia_id]=coalesce(d42h.id,-1)
      ,[aikaisemmin_suoritettu_alempikktutk] = f.aikaisemmin_suoritettu_alempikktutk
      ,[aikaisemmin_suoritettu_alempikktutk_tarkempi] = f.aikaisemmin_suoritettu_alempikktutk_tarkempi
	  ,[alempikktutk_pohjakoulutuksen_tila] = f.alempikktutk_pohjakoulutuksen_tila
      ,[aikaisemmin_suoritetun_alempikktutk_koulutustiedot_id]=coalesce(d43.id,-1)
	  ,[aikaisemmin_suoritetun_alempikktutk_koulutustiedot_historia_id]=coalesce(d43h.id,-1)
      ,[aikaisemmin_suoritetun_alempikktutk_suoritusvuosi_id]= coalesce(d44.kausi_id,'-1')
      ,[aikaisemmin_suoritetun_alempikktutk_oppilaitostiedot_id]=coalesce(d45.id,-1)
	  ,[aikaisemmin_suoritetun_alempikktutk_oppilaitostiedot_historia_id]=coalesce(d45h.id,-1)
      ,[aikaisemmin_suoritettu_ylempikktutk] = f.aikaisemmin_suoritettu_ylempikktutk
      ,[aikaisemmin_suoritettu_ylempikktutk_tarkempi] = f.aikaisemmin_suoritettu_ylempikktutk_tarkempi
	  ,[ylempikktutk_pohjakoulutuksen_tila] = f.ylempikktutk_pohjakoulutuksen_tila
      ,[aikaisemmin_suoritetun_ylempikktutk_koulutustiedot_id]=coalesce(d46.id,-1)
	  ,[aikaisemmin_suoritetun_ylempikktutk_koulutustiedot_historia_id]=coalesce(d46h.id,-1)
      ,[aikaisemmin_suoritetun_ylempikktutk_suoritusvuosi_id]= coalesce(d47.kausi_id,'-1')
      ,[aikaisemmin_suoritetun_ylempikktutk_oppilaitostiedot_id]=coalesce(d48.id,-1)
	  ,[aikaisemmin_suoritetun_ylempikktutk_oppilaitostiedot_historia_id]=coalesce(d48h.id,-1)
      ,[opiskelijan_koulutus_edellisvuonna_id]=coalesce(d49.id,-1)
      ,[opiskelijan_opintoala2002_edellisvuonna_id]=coalesce(d50.id,-1)
      ,[opiskelijan_opintoala1995_edellisvuonna_id]=coalesce(d51.id,-1)
      ,[aikaisemmasta_koulutuksesta_yotutk_kulunut_aika_id]=coalesce(d52.id,-1)
      ,[aikaisemmasta_koulutuksesta_ammtutk_kulunut_aika_id]=coalesce(d53.id,-1)
      ,[aikaisemmasta_koulutuksesta_amktutk_kulunut_aika_id]=coalesce(d54.id,-1)
      ,[aikaisemmasta_koulutuksesta_ylamktutk_kulunut_aika_id]=coalesce(d55.id,-1)
      ,[aikaisemmasta_koulutuksesta_alkktutk_kulunut_aika_id]=coalesce(d56.id,-1)
      ,[aikaisemmasta_koulutuksesta_ylkktutk_kulunut_aika_id]=coalesce(d57.id,-1)
      ,[aiemman_tutkinnon_yotutk_opintoala1995_sama] = f.aiemman_tutkinnon_yotutk_opintoala1995_sama
      ,[aiemman_tutkinnon_yotutk_opintoala2002_sama] = f.aiemman_tutkinnon_yotutk_opintoala2002_sama
      ,[aiemman_tutkinnon_yotutk_koulutusala2002_sama] = f.aiemman_tutkinnon_yotutk_koulutusala2002_sama
      ,[aiemman_tutkinnon_yotutk_koulutusaste2002_sama] = f.aiemman_tutkinnon_yotutk_koulutusaste2002_sama
      ,[aiemman_tutkinnon_yotutk_koulutusala_taso1_sama] = f.aiemman_tutkinnon_yotutk_koulutusala_taso1_sama
      ,[aiemman_tutkinnon_yotutk_koulutusala_taso2_sama] = f.aiemman_tutkinnon_yotutk_koulutusala_taso2_sama
      ,[aiemman_tutkinnon_yotutk_koulutusala_taso3_sama] = f.aiemman_tutkinnon_yotutk_koulutusala_taso3_sama
      ,[aiemman_tutkinnon_yotutk_koulutusaste_taso1_sama] = f.aiemman_tutkinnon_yotutk_koulutusaste_taso1_sama
	  ,[aiemman_tutkinnon_yotutk_koulutusaste_taso2_sama] = f.aiemman_tutkinnon_yotutk_koulutusaste_taso2_sama
      ,[aiemman_tutkinnon_ammtutk_opintoala1995_sama] = f.aiemman_tutkinnon_ammtutk_opintoala1995_sama
      ,[aiemman_tutkinnon_ammtutk_opintoala2002_sama]= f.aiemman_tutkinnon_ammtutk_opintoala2002_sama
      ,[aiemman_tutkinnon_ammtutk_koulutusala2002_sama] = f.aiemman_tutkinnon_ammtutk_koulutusala2002_sama
      ,[aiemman_tutkinnon_ammtutk_koulutusaste2002_sama] = f.aiemman_tutkinnon_ammtutk_koulutusaste2002_sama
      ,[aiemman_tutkinnon_amm_koulutusala_taso1_sama] = f.aiemman_tutkinnon_amm_koulutusala_taso1_sama
      ,[aiemman_tutkinnon_amm_koulutusala_taso2_sama] = f.aiemman_tutkinnon_amm_koulutusala_taso2_sama
      ,[aiemman_tutkinnon_amm_koulutusala_taso3_sama] = f.aiemman_tutkinnon_amm_koulutusala_taso3_sama
      ,[aiemman_tutkinnon_amm_koulutusaste_taso1_sama] = f.aiemman_tutkinnon_amm_koulutusaste_taso1_sama
	  ,[aiemman_tutkinnon_amm_koulutusaste_taso2_sama] = f.aiemman_tutkinnon_amm_koulutusaste_taso2_sama
      ,[aiemman_tutkinnon_amktutk_opintoala1995_sama] = f.aiemman_tutkinnon_amktutk_opintoala1995_sama
      ,[aiemman_tutkinnon_amktutk_opintoala2002_sama] = f.aiemman_tutkinnon_amktutk_opintoala2002_sama
      ,[aiemman_tutkinnon_amktutk_koulutusala2002_sama] = f.aiemman_tutkinnon_amktutk_koulutusala2002_sama
      ,[aiemman_tutkinnon_amktutk_koulutusaste2002_sama] = f.aiemman_tutkinnon_amktutk_koulutusaste2002_sama
      ,[aiemman_tutkinnon_amk_koulutusala_taso1_sama] = f.aiemman_tutkinnon_amk_koulutusala_taso1_sama
      ,[aiemman_tutkinnon_amk_koulutusala_taso2_sama] = f.aiemman_tutkinnon_amk_koulutusala_taso2_sama
      ,[aiemman_tutkinnon_amk_koulutusala_taso3_sama] = f.aiemman_tutkinnon_amk_koulutusala_taso3_sama
      ,[aiemman_tutkinnon_amk_koulutusaste_taso1_sama] = f.aiemman_tutkinnon_amk_koulutusaste_taso1_sama
	  ,[aiemman_tutkinnon_amk_koulutusaste_taso2_sama] = f.aiemman_tutkinnon_amk_koulutusaste_taso2_sama
      ,[aiemman_tutkinnon_ylempiamktutk_opintoala1995_sama] = f.aiemman_tutkinnon_ylempiamktutk_opintoala1995_sama
      ,[aiemman_tutkinnon_ylempiamktutk_opintoala2002_sama] = f.aiemman_tutkinnon_ylempiamktutk_opintoala2002_sama
      ,[aiemman_tutkinnon_ylempiamktutk_koulutusala2002_sama] = f.aiemman_tutkinnon_ylempiamktutk_koulutusala2002_sama
      ,[aiemman_tutkinnon_ylempiamktutk_koulutusaste2002_sama] = f.aiemman_tutkinnon_ylempiamktutk_koulutusaste2002_sama
      ,[aiemman_tutkinnon_ylamk_koulutusala_taso1_sama] = f.aiemman_tutkinnon_ylamk_koulutusala_taso1_sama
      ,[aiemman_tutkinnon_ylamk_koulutusala_taso2_sama] = f.aiemman_tutkinnon_ylamk_koulutusala_taso2_sama
      ,[aiemman_tutkinnon_ylamk_koulutusala_taso3_sama] = f.aiemman_tutkinnon_ylamk_koulutusala_taso3_sama
      ,[aiemman_tutkinnon_ylamk_koulutusaste_taso1_sama] = f.aiemman_tutkinnon_ylamk_koulutusaste_taso1_sama
	  ,[aiemman_tutkinnon_ylamk_koulutusaste_taso2_sama] = f.aiemman_tutkinnon_ylamk_koulutusaste_taso2_sama
      ,[aiemman_tutkinnon_alempikktutk_opintoala1995_sama] = f.aiemman_tutkinnon_alempikktutk_opintoala1995_sama
      ,[aiemman_tutkinnon_alempikktutk_opintoala2002_sama] = f.aiemman_tutkinnon_alempikktutk_opintoala2002_sama
      ,[aiemman_tutkinnon_alempikktutk_koulutusala2002_sama] = f.aiemman_tutkinnon_alempikktutk_koulutusala2002_sama
      ,[aiemman_tutkinnon_alempikktutk_koulutusaste2002_sama] = f.aiemman_tutkinnon_alempikktutk_koulutusaste2002_sama
      ,[aiemman_tutkinnon_alkk_koulutusala_taso1_sama] = f.aiemman_tutkinnon_alkk_koulutusala_taso1_sama
      ,[aiemman_tutkinnon_alkk_koulutusala_taso2_sama] = f.aiemman_tutkinnon_alkk_koulutusala_taso2_sama
      ,[aiemman_tutkinnon_alkk_koulutusala_taso3_sama] = f.aiemman_tutkinnon_alkk_koulutusala_taso3_sama
      ,[aiemman_tutkinnon_alkk_koulutusaste_taso1_sama] = f.aiemman_tutkinnon_alkk_koulutusaste_taso1_sama
	  ,[aiemman_tutkinnon_alkk_koulutusaste_taso2_sama] = f.aiemman_tutkinnon_alkk_koulutusaste_taso2_sama
      ,[aiemman_tutkinnon_ylempikktutk_opintoala1995_sama] = f.aiemman_tutkinnon_ylempikktutk_opintoala1995_sama
      ,[aiemman_tutkinnon_ylempikktutk_opintoala2002_sama] = f.aiemman_tutkinnon_ylempikktutk_opintoala2002_sama
      ,[aiemman_tutkinnon_ylempikktutk_koulutusala2002_sama] = f.aiemman_tutkinnon_ylempikktutk_koulutusala2002_sama
      ,[aiemman_tutkinnon_ylempikktutk_koulutusaste2002_sama] = f.aiemman_tutkinnon_ylempikktutk_koulutusaste2002_sama
      ,[aiemman_tutkinnon_ylkk_koulutusala_taso1_sama] = f.aiemman_tutkinnon_ylkk_koulutusala_taso1_sama
      ,[aiemman_tutkinnon_ylkk_koulutusala_taso2_sama] = f.aiemman_tutkinnon_ylkk_koulutusala_taso2_sama
      ,[aiemman_tutkinnon_ylkk_koulutusala_taso3_sama] = f.aiemman_tutkinnon_ylkk_koulutusala_taso3_sama
      ,[aiemman_tutkinnon_ylkk_koulutusaste_taso1_sama] = f.aiemman_tutkinnon_ylkk_koulutusaste_taso1_sama
	  ,[aiemman_tutkinnon_ylkk_koulutusaste_taso2_sama] = f.aiemman_tutkinnon_ylkk_koulutusaste_taso2_sama
      ,[aiemman_tutkinnon_opintoala1995_sama] = f.aiemman_tutkinnon_opintoala1995_sama
      ,[aiemman_tutkinnon_opintoala2002_sama] = f.aiemman_tutkinnon_opintoala2002_sama
      ,[aiemman_tutkinnon_koulutusala2002_sama] = f.aiemman_tutkinnon_koulutusala2002_sama
      ,[aiemman_tutkinnon_koulutusaste2002_sama] = f.aiemman_tutkinnon_koulutusaste2002_sama
      ,[aiemman_tutkinnon_koulutusala_taso1_sama] = f.aiemman_tutkinnon_koulutusala_taso1_sama
      ,[aiemman_tutkinnon_koulutusala_taso2_sama] = f.aiemman_tutkinnon_koulutusala_taso2_sama
      ,[aiemman_tutkinnon_koulutusala_taso3_sama] = f.aiemman_tutkinnon_koulutusala_taso3_sama
      ,[aiemman_tutkinnon_koulutusaste_taso1_sama] = f.aiemman_tutkinnon_koulutusaste_taso1_sama
	  ,[aiemman_tutkinnon_koulutusaste_taso2_sama] = f.aiemman_tutkinnon_koulutusaste_taso2_sama
      ,[pohjakoulutuksen_tila_id]=coalesce(d58.id,-1)
	  ,[opiskelijat] = f.opiskelijat
	  ,[aloittaneet] = f.aloittaneet
	  ,[aikaisempi_korkein_tutkinto_id] = coalesce(d59.id,-1)
	  ,[ika_18_65_id]=coalesce(d60.id,-1)
	  ,[ylempi_korkeakoulututkinto] = f.ylempi_korkeakoulututkinto
	  ,[ylempi_amk_tutkinto] = f.ylempi_amk_tutkinto
	  ,[alempi_korkeakoulututkinto] = f.alempi_korkeakoulututkinto
	  ,[amk_tutkinto] = f.amk_tutkinto
	  ,[ammatillinen_perustutkinto] = f.ammatillinen_perustutkinto
	  ,[ylioppilastutkinto] = f.ylioppilastutkinto
	  ,[ei_perusasteen_jalkeista_koulutusta] = f.ei_perusasteen_jalkeista_koulutusta 

--frm
FROM [VipunenTK_DW].[dbo].[f_2_10_Korkeakouluopiskelijoiden_aikaisempi_koulutus] AS f
LEFT JOIN VipunenTK..d_lahde   AS d1 ON d1.lahde_koodi =f.lahde 

LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot AS d2 ON d2.oppilaitos_avain  =f.oppilaitoksen_taustatiedot
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia AS d2h ON d2h.oppilaitos_avain  =f.oppilaitoksen_taustatiedot AND f.tilv_date between d2h.alkaa and d2h.paattyy

LEFT JOIN VipunenTK..d_koulutusluokitus  AS d3 ON d3.koulutusluokitus_avain  =f.koulutusluokitus 
LEFT JOIN VipunenTK..d_koulutusluokitus_historia  AS d3h ON d3h.koulutusluokitus_avain   =f.koulutusluokitus AND f.tilv_date between d3h.alkaa and d3h.paattyy

LEFT JOIN VipunenTK..d_alueluokitus AS d4 ON d4.alueluokitus_avain  =f.koulutuksen_kunta 
LEFT JOIN VipunenTK..d_alueluokitus_historia  AS d4h ON d4h.alueluokitus_avain   =f.koulutuksen_kunta AND f.tilv_date between d4h.alkaa and d4h.paattyy

LEFT JOIN VipunenTK..d_sukupuoli   AS d5 ON d5.sukupuoli_koodi =f.sukupuoli 
LEFT JOIN VipunenTK..d_aidinkieli_versio1   AS d6 ON d6.aidinkieli_versio1_koodi =f.aidinkieli_versio1
LEFT JOIN VipunenTK..d_ika    AS d7 ON d7.ika_avain     = f.ika_1v
LEFT JOIN VipunenTK..d_ika    AS d8 ON d8.ika_avain   = f.ika_5v
LEFT JOIN VipunenTK..d_ika    AS d9 ON d9.ika_avain   = f.ika_14_65

LEFT JOIN VipunenTK..d_alueluokitus AS d10 ON d10.alueluokitus_avain  =f.kotikunta
LEFT JOIN VipunenTK..d_alueluokitus_historia  AS d10h ON d10h.alueluokitus_avain   =f.kotikunta AND f.tilv_date between d10h.alkaa and d10h.paattyy

LEFT JOIN VipunenTK..d_kansalaisuus_versio2 AS d11 ON d11.kansalaisuus_versio2_koodi  =f.kansalaisuus_versio2

LEFT JOIN VipunenTK..d_opiskelijan_olo_tamm AS d12 ON d12.opiskelijan_olo_tamm_koodi   =f.opiskelijan_olo_tamm
LEFT JOIN VipunenTK..d_opiskelijan_olo AS d13 ON d13.opiskelijan_olo_koodi   =f.opiskelijan_olo_syys

LEFT JOIN VipunenTK..d_rahoituslahde AS d14 ON d14.rahoituslahde_koodi   =f.rahoituslahde

LEFT JOIN VipunenTK..d_opiskelijan_fte_tieto AS d15 ON d15.opiskelijan_fte_tieto_koodi    =f.opiskelijan_fte_tieto

LEFT JOIN VipunenTK..d_vahintaan_45_op_suorittanut AS d16 ON d16.vahintaan_45_op_suorittanut_koodi   =f.vahintaan_45_op_suorittanut
LEFT JOIN VipunenTK..d_vahintaan_55_op_suorittanut AS d17 ON d17.vahintaan_55_op_suorittanut_koodi   =f.vahintaan_55_op_suorittanut

LEFT JOIN VipunenTK..d_kausi AS d18 ON d18.kausi_id  =f.kirjoihintulovuosi
LEFT JOIN VipunenTK..d_kausi AS d19 ON d19.kausi_id  =f.kirjoihintulovuosi+f.kirjoihintulolukukausi
LEFT JOIN VipunenTK..d_kausi AS d20 ON d20.kausi_id  =f.kirjoihintulovuosi_korkeakoulusektori
LEFT JOIN VipunenTK..d_kausi AS d21 ON d21.kausi_id  =f.kirjoihintulovuosi_korkeakoulusektori_lasnaoleva
LEFT JOIN VipunenTK..d_kausi AS d22 ON d22.kausi_id  =f.kirjoihintulovuosi_sektori
LEFT JOIN VipunenTK..d_kausi AS d23 ON d23.kausi_id  =f.kirjoihintulovuosi_sektori_lasnaoleva
LEFT JOIN VipunenTK..d_kausi AS d24 ON d24.kausi_id  =f.kirjoihintulovuosi_korkeakoulu 
LEFT JOIN VipunenTK..d_kausi AS d25 ON d25.kausi_id = f.kirjoihintulovuosi_korkeakoulu_lasnaoleva 
LEFT JOIN VipunenTK..d_kausi AS d26 ON d26.kausi_id  =f.kirjoihintulovuosi_opintoala
LEFT JOIN VipunenTK..d_kausi AS d27 ON d27.kausi_id  =f.kirjoihintulovuosi_opintoala_lasnaoleva 


LEFT JOIN VipunenTK..d_koulutustyyppi AS d28 ON d28.koulutustyyppi_koodi  =f.koulutustyyppi
LEFT JOIN VipunenTK..d_opiskelumuoto AS d29 ON d29.opiskelumuoto_koodi =f.opiskelumuoto
LEFT JOIN VipunenTK..d_avoinvayla AS d30 ON d30.avoinvayla_koodi  =f.avoinvayla

LEFT JOIN VipunenTK..d_koulutusluokitus  AS d31 ON d31.koulutusluokitus_avain  =f.aikaisemmin_suoritetun_yotutk_koulutustiedot 
LEFT JOIN VipunenTK..d_koulutusluokitus_historia  AS d31h ON d31h.koulutusluokitus_avain   =f.aikaisemmin_suoritetun_yotutk_koulutustiedot  AND f.tilv_date between d31h.alkaa and d31h.paattyy
LEFT JOIN VipunenTK..d_kausi  AS d32 ON d32.kausi_id  =f.aikaisemmin_suoritetun_yotutk_suoritusvuosi 
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot  AS d33 ON d33.oppilaitos_avain  =f.aikaisemmin_suoritetun_yotutk_oppilaitostiedot 
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia  AS d33h ON d33h.oppilaitos_avain   =f.aikaisemmin_suoritetun_yotutk_oppilaitostiedot  AND f.tilv_date between d33h.alkaa and d33h.paattyy


LEFT JOIN VipunenTK..d_koulutusluokitus  AS d34 ON d34.koulutusluokitus_avain  =f.aikaisemmin_suoritetun_ammtutk_koulutustiedot 
LEFT JOIN VipunenTK..d_koulutusluokitus_historia  AS d34h ON d34h.koulutusluokitus_avain   =f.aikaisemmin_suoritetun_ammtutk_koulutustiedot  AND f.tilv_date between d34h.alkaa and d34h.paattyy
LEFT JOIN VipunenTK..d_kausi  AS d35 ON d35.kausi_id  =f.aikaisemmin_suoritetun_ammtutk_suoritusvuosi 
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot  AS d36 ON d36.oppilaitos_avain  =f.aikaisemmin_suoritetun_ammtutk_oppilaitostiedot 
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia  AS d36h ON d36h.oppilaitos_avain   =f.aikaisemmin_suoritetun_ammtutk_oppilaitostiedot  AND f.tilv_date between d36h.alkaa and d36h.paattyy

LEFT JOIN VipunenTK..d_koulutusluokitus  AS d37 ON d37.koulutusluokitus_avain  =f.aikaisemmin_suoritetun_amktutk_koulutustiedot 
LEFT JOIN VipunenTK..d_koulutusluokitus_historia  AS d37h ON d37h.koulutusluokitus_avain   =f.aikaisemmin_suoritetun_amktutk_koulutustiedot  AND f.tilv_date between d37h.alkaa and d37h.paattyy
LEFT JOIN VipunenTK..d_kausi  AS d38 ON d38.kausi_id  =f.aikaisemmin_suoritetun_amktutk_suoritusvuosi 
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot  AS d39 ON d39.oppilaitos_avain  =f.aikaisemmin_suoritetun_amktutk_oppilaitostiedot 
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia  AS d39h ON d39h.oppilaitos_avain   =f.aikaisemmin_suoritetun_amktutk_oppilaitostiedot  AND f.tilv_date between d39h.alkaa and d39h.paattyy


LEFT JOIN VipunenTK..d_koulutusluokitus  AS d40 ON d40.koulutusluokitus_avain  =f.aikaisemmin_suoritetun_ylempiamktutk_koulutustiedot 
LEFT JOIN VipunenTK..d_koulutusluokitus_historia  AS d40h ON d40h.koulutusluokitus_avain   =f.aikaisemmin_suoritetun_ylempiamktutk_koulutustiedot  AND f.tilv_date between d40h.alkaa and d40h.paattyy

LEFT JOIN VipunenTK..d_kausi  AS d41 ON d41.kausi_id  =f.aikaisemmin_suoritetun_ylempiamktutk_suoritusvuosi 
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot  AS d42 ON d42.oppilaitos_avain  =f.aikaisemmin_suoritetun_ylempiamktutk_oppilaitostiedot 
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia  AS d42h ON d42h.oppilaitos_avain   =f.aikaisemmin_suoritetun_ylempiamktutk_oppilaitostiedot  AND f.tilv_date between d42h.alkaa and d42h.paattyy


LEFT JOIN VipunenTK..d_koulutusluokitus  AS d43 ON d43.koulutusluokitus_avain  =f.aikaisemmin_suoritetun_alempikktutk_koulutustiedot 
LEFT JOIN VipunenTK..d_koulutusluokitus_historia  AS d43h ON d43h.koulutusluokitus_avain   =f.aikaisemmin_suoritetun_alempikktutk_koulutustiedot  AND f.tilv_date between d43h.alkaa and d43h.paattyy
LEFT JOIN VipunenTK..d_kausi  AS d44 ON d44.kausi_id  =f.aikaisemmin_suoritetun_alempikktutk_suoritusvuosi 

LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot  AS d45 ON d45.oppilaitos_avain  =f.aikaisemmin_suoritetun_alempikktutk_oppilaitostiedot 
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia  AS d45h ON d45h.oppilaitos_avain   =f.aikaisemmin_suoritetun_alempikktutk_oppilaitostiedot  AND f.tilv_date between d45h.alkaa and d45h.paattyy

LEFT JOIN VipunenTK..d_koulutusluokitus  AS d46 ON d46.koulutusluokitus_avain  =f.aikaisemmin_suoritetun_ylempikktutk_koulutustiedot 
LEFT JOIN VipunenTK..d_koulutusluokitus_historia  AS d46h ON d46h.koulutusluokitus_avain   =f.aikaisemmin_suoritetun_ylempikktutk_koulutustiedot  AND f.tilv_date between d46h.alkaa and d46h.paattyy
LEFT JOIN VipunenTK..d_kausi  AS d47 ON d47.kausi_id  =f.aikaisemmin_suoritetun_ylempikktutk_suoritusvuosi 
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot  AS d48 ON d48.oppilaitos_avain  =f.aikaisemmin_suoritetun_ylempikktutk_oppilaitostiedot 
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia  AS d48h ON d48h.oppilaitos_avain   =f.aikaisemmin_suoritetun_ylempikktutk_oppilaitostiedot  AND f.tilv_date between d48h.alkaa and d48h.paattyy


LEFT JOIN VipunenTK..d_koulutusluokitus  AS d49 ON d49.koulutusluokitus_avain  =f.opiskelijan_koulutus_edellisvuonna
LEFT JOIN VipunenTK..d_koulutusluokitus  AS d50 ON d50.koulutusluokitus_avain  ='OPMOPA'+f.opiskelijan_opintoala2002_edellisvuonna
LEFT JOIN VipunenTK..d_koulutusluokitus  AS d51 ON d51.koulutusluokitus_avain  ='OPM95OPA'+f.opiskelijan_opintoala1995_edellisvuonna
LEFT JOIN VipunenTK..d_koulutuksesta_kulunut_aika    AS d52 ON d52.koulutuksesta_kulunut_aika_koodi   = f.aikaisemmasta_koulutuksesta_yotutk_kulunut_aika
LEFT JOIN VipunenTK..d_koulutuksesta_kulunut_aika    AS d53 ON d53.koulutuksesta_kulunut_aika_koodi   = f.aikaisemmasta_koulutuksesta_ammtutk_kulunut_aika
LEFT JOIN VipunenTK..d_koulutuksesta_kulunut_aika    AS d54 ON d54.koulutuksesta_kulunut_aika_koodi   = f.aikaisemmasta_koulutuksesta_amktutk_kulunut_aika
LEFT JOIN VipunenTK..d_koulutuksesta_kulunut_aika    AS d55 ON d55.koulutuksesta_kulunut_aika_koodi   = f.aikaisemmasta_koulutuksesta_ylamktutk_kulunut_aika
LEFT JOIN VipunenTK..d_koulutuksesta_kulunut_aika    AS d56 ON d56.koulutuksesta_kulunut_aika_koodi   = f.aikaisemmasta_koulutuksesta_alkktutk_kulunut_aika
LEFT JOIN VipunenTK..d_koulutuksesta_kulunut_aika    AS d57 ON d57.koulutuksesta_kulunut_aika_koodi   = f.aikaisemmasta_koulutuksesta_ylkktutk_kulunut_aika
LEFT JOIN VipunenTK..d_pohjakoulutuksen_tila   AS d58 ON d58.pohjakoulutuksen_tila_koodi =f.pohjakoulutuksen_tila 
LEFT JOIN VipunenTK..d_aikaisempi_korkein_tutkinto   AS d59 ON d59.aikaisempi_korkein_tutkinto_koodi  =f.aikaisempi_korkein_tutkinto 
LEFT JOIN VipunenTK..d_ika    AS d60 ON d60.ika_avain   = f.ika_18_65


