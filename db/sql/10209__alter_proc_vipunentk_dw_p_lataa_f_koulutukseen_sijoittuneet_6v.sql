USE [VipunenTK_DW]
GO

/****** Object:  StoredProcedure [dbo].[p_lataa_f_koulutukseen_sijoittuneet_6v]    Script Date: 10.10.2024 14:44:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER PROCEDURE [dbo].[p_lataa_f_koulutukseen_sijoittuneet_6v] AS

exec VipunenTK_SA.dbo.p_lataa_koulutukseen_sijoittuneet_6v;

exec p_prosessoi_3_13;

truncate table vipunentk.dbo.[f_koulutukseen_sijoittuneet_6v];

insert into vipunentk.dbo.[f_koulutukseen_sijoittuneet_6v]
SELECT
       [aineistorivinumero] = f.aineistorivinumero
      ,[tarkastelujakso] = f.tarkastelujakso
      ,[tarkastelujakso_id] =  coalesce(d1.id,-1)
      ,[tilastovuosi]= f.tilv
	  ,[tilastovuosi_id] = f.tilv
      ,[tilv_date]= f.tilv_date
      ,[tutkintoryhma] = f.tutkryh
	  ,[tutkintoryhma_id]  = coalesce(d3.id,-1)
      ,[suoritusvuosi] = f.suorv
	  ,[suoritusvuosi_id] = coalesce(d4.kausi_id,'-1')
      ,[suorituslukukausi] =f.suorlk
	  ,[suorituslukukausi_id] =  coalesce(d5.kausi_id,'-1')
      ,[sukupuoli] = f.sp
	  ,[sukupuoli_id] = coalesce(d6.id,-1)
      ,[syntymavuosi] = f.syntv
	  ,[syntymavuosi_id] = coalesce(d7.kausi_id,'-1')
      ,[aidinkieli_versio_1] = f.aikielir1
	  ,[aidinkieli_versio_1_id] = coalesce(d8.id,-1)
	  ,[asuinkunta]= f.tutkkaskun
      ,[asuinkunta_id] =  coalesce(d9.id,-1)
	  ,[asuinkunta_historia_id] = coalesce(d9h.id,-1)
      ,[kansalaisuus]= f.kansalr1
	  ,[kansalaisuus_id]  =  coalesce(d10.id,-1)
      ,[pohjoismaa_id] =  coalesce(d11.id,-1)
      ,[eumaa_id]=  coalesce(d12.id,-1)
      ,[etamaa_id]=  coalesce(d13.id,-1)
      ,[pohjakoulutuksen_oppilaitos] = f.tunn
	  ,[pohjakoulutuksen_oppilaitos_id]= coalesce(d14.id,-1)
	  ,[pohjakoulutuksen_oppilaitos_historia_id]= coalesce(d14h.id,-1)
	  ,[pohjakoulutuksen_koulutuksen_jarjestaja] = f.jarj
      ,[pohjakoulutuksen_opetuskieli] = f.kkielir1
      ,[pohjakoulutuksen_opetuskieli_id] =  coalesce(d15.id,-1)
      ,[pohjakoulutuksen_koulutuslaji] = f.tutklaja
	  ,[pohjakoulutuksen_koulutuslaji_id] =  coalesce(d16.id,-1)
      ,[pohjakoulutuksen_tutktav] = f.tutktav
	  ,[pohjakoulutuksen_tutktav_id] =  coalesce(d17.id,-1)
      ,[pohjakoulutuksen_aikoul] = f.aikoul
      ,[pohjakoulutuksen_aikoul_id] = coalesce(d18.id,-1)
	  ,[pohjakoulutuksen_tutkinnon_suoritusmaakunta] = f.tutkmaak
	  ,[pohjakoulutuksen_tutkinnon_suoritusmaakunta_id] = coalesce(d19.id,-1)
	  ,[pohjakoulutuksen_tutkinnon_suoritusmaakunta_historia_id] = coalesce(d19h.id,-1)
      ,[pohjakoulutus] = f.pohjkoulk
	  ,[pohjakoulutus_id] = coalesce(d20.id,-1)
	  ,[pohjakoulutus_historia_id] = coalesce(d20h.id,-1)
      ,[koulutukseen_sijoittuneen_koulutus] = f.koulutus
	  ,[koulutukseen_sijoittuneen_koulutus_id] =  coalesce(d21.id,-1)
	  ,[koulutukseen_sijoittuneen_koulutus_historia_id] =  coalesce(d21h.id,-1)
	  ,[koulutukseen_sijoittuneen_oppilaitos] = f.oppilaitos
      ,[koulutukseen_sijoittuneen_oppilaitos_id] =  coalesce(d22.id,-1)
	  ,[koulutukseen_sijoittuneen_oppilaitos_historia_id] =  coalesce(d22h.id,-1)
      ,[koulutukseen_sijoittuneen_koulutuksen_jarjestaja] = f.koulutuksen_jarjestaja
      ,[koulutukseen_sijoittuneen_maakunta] = f.koulutuksen_maakunta
      ,[koulutukseen_sijoittuneen_maakunta_id] =  coalesce(d23.id,-1)
	  ,[koulutukseen_sijoittuneen_maakunta_historia_id] =  coalesce(d23h.id,-1)
      ,[moninkertainen_haku] = f.monihaku
	  ,[moninkertainen_haku_id] = coalesce(d24.id,-1)
      ,[paaasiallinen_toiminta] = f.paaasiallinen_toiminta
	  ,[paaasiallinen_toiminta_id] = coalesce(d25.id,-1)
      ,[ammattiasema] = f.ammattiasema
	  ,[ammattiasema_id] = coalesce(d26.id,-1)
      ,[opintotuki_ulkom] = f.[opintotuki_ulkom]
	  ,[opintotuki_ulkom_id] = coalesce(d57.id,-1)
      ,[lkm]= f.lkm
      ,[tietolahde]= f.tietolahde
      ,[aineisto]= f.aineisto
	  ,[aineisto_id] = f.aineisto
      ,[lukiokoulutuksessa]= f.lukiokoulutuksessa
	  ,[lukiokoulutuksessa_ke]= f.lukiokoulutuksessa
      ,[ammatillisessa_koulutuksessa]= f.ammatillisessa_koulutuksessa
	  ,[ammatillisessa_koulutuksessa_ke]=f.ammatillisessa_koulutuksessa_ke
      ,[ammattikorkeakoulutuksessa]= f.ammattikorkeakoulutuksessa
	  ,[ammattikorkeakoulutuksessa_ke]=f.ammattikorkeakoulutuksessa_ke
      ,[yliopistokoulutuksessa]= f.yliopistokoulutuksessa
	  ,[yliopistokoulutuksessa_ke]=f.yliopistokoulutuksessa_ke
      ,[lukiokoulutuksessa_ja_ammatillisessa_koulutuksessa]= f.lukiokoulutuksessa_ja_ammatillisessa_koulutuksessa
	  ,[lukiokoulutuksessa_ja_ammatillisessa_koulutuksessa_ke]= f.lukiokoulutuksessa_ja_ammatillisessa_koulutuksessa_ke
      ,[toisen_asteen_ammatillisessa_koulutuksessa_ja_korkeakoulutuksessa]= f.toisen_asteen_ammatillisessa_koulutuksessa_ja_korkeakoulutuksessa
	  ,[toisen_asteen_ammatillisessa_koulutuksessa_ja_korkeakoulutuksessa_ke]= f.toisen_asteen_ammatillisessa_koulutuksessa_ja_korkeakoulutuksessa_ke
      ,[ammattikorkeakoulutuksessa_ja_yliopistokoulutuksessa]=f.ammattikorkeakoulutuksessa_ja_yliopistokoulutuksessa
	  ,[ammattikorkeakoulutuksessa_ja_yliopistokoulutuksessa_ke]= f.ammattikorkeakoulutuksessa_ja_yliopistokoulutuksessa_ke
      ,[koulutuksen_paattaneiden_toiminta]= f.koulutuksen_paattaneiden_toiminta
	  ,[koulutuksen_paattaneiden_toiminta_id] = coalesce(d27.id,-1)
      ,[rivinumero]= f.rivinumero
      ,[ika_1v]= f.ika_1v
	  ,[ika_1v_id] =  coalesce(d28.id,-1)
	  ,[ika_5v] = f.ika_5v
      ,[ika_5v] = coalesce(d29.id,-1)
	  ,[ika_1v_suorv_id] =  coalesce(d28b.id,-1)
	  ,opisk_lu_kyllaei_id = coalesce(d30a.id,-1)
	  ,opisk_amm_pk_kyllaei_id = coalesce(d30b.id,-1)
	  ,opisk_amm_at_kyllaei_id = coalesce(d30c.id,-1)
	  ,opisk_amm_eat_kyllaei_id = coalesce(d30d.id,-1)
	  ,opisk_amm_kyllaei_id = coalesce(d30e.id,-1)
	  ,opisk_amk_kyllaei_id = coalesce(d31.id,-1)
	  ,opisk_yo_kyllaei_id = coalesce(d32.id,-1)
	  ,opisk_amk_koulala1_kyllaei_id = coalesce(d33.id,-1)
	  ,opisk_amk_koulala2_kyllaei_id = coalesce(d34.id,-1)
	  ,opisk_amk_koulala3_kyllaei_id = coalesce(d35.id,-1)
	  ,opisk_amk_koulala4_kyllaei_id = coalesce(d36.id,-1)
	  ,opisk_amk_koulala5_kyllaei_id = coalesce(d37.id,-1)
	  ,opisk_amk_koulala6_kyllaei_id = coalesce(d38.id,-1)
	  ,opisk_amk_koulala7_kyllaei_id = coalesce(d39.id,-1)
	  ,opisk_amk_koulala8_kyllaei_id = coalesce(d40.id,-1)
	  ,opisk_amk_koulala9_kyllaei_id = coalesce(d41.id,-1)
	  ,opisk_amk_koulala10_kyllaei_id = coalesce(d42.id,-1)
	  ,opisk_yo_koulala1_kyllaei_id = coalesce(d43.id,-1)
	  ,opisk_yo_koulala2_kyllaei_id = coalesce(d44.id,-1)
	  ,opisk_yo_koulala3_kyllaei_id = coalesce(d45.id,-1)
	  ,opisk_yo_koulala4_kyllaei_id = coalesce(d46.id,-1)
	  ,opisk_yo_koulala5_kyllaei_id = coalesce(d47.id,-1)
	  ,opisk_yo_koulala6_kyllaei_id = coalesce(d48.id,-1)
	  ,opisk_yo_koulala7_kyllaei_id = coalesce(d49.id,-1)
	  ,opisk_yo_koulala8_kyllaei_id = coalesce(d50.id,-1)
	  ,opisk_yo_koulala9_kyllaei_id = coalesce(d51.id,-1)
	  ,opisk_yo_koulala10_kyllaei_id = coalesce(d52.id,-1)
	  ,opisk_vah2_koulala_kyllaei_id = coalesce(d53.id,-1)
	  ,haku_amm_kyllaei_id = coalesce(d54.id,-1)
	  ,haku_amk_kyllaei_id = coalesce(d55.id,-1)
	  ,haku_yo_kyllaei_id = coalesce(d56.id,-1)
	  ,eihaku_kk_eiopisk
	  ,eihaku_kk_eiopisk_kk_opisk_ta
	  ,eihaku_kk_eiopisk_kk_opisk_lu
	  ,eihaku_kk_eiopisk_kk_opisk_pk
	  ,eihaku_kk_eiopisk_kk_opisk_at
	  ,eihaku_kk_eiopisk_kk_opisk_eat
	  ,haku_kk_eiopisk_kk
	  ,haku_kk_eiopisk_kk_eiopisk_ta
	  ,haku_kk_eiopisk_kk_opisk_ta
	  ,haku_amk_eiopisk_kk
	  ,haku_yo_eiopisk_kk
	  ,haku_amkyo_eiopisk_kk	
	  ,opisk_kk
	  ,opisk_kk_eiopisk_ta
	  ,opisk_kk_opisk_ta
	  ,opisk_vain_amk
	  ,opisk_vain_yo
	  ,opisk_amkyo
	  ,[tj0_koul_luokitus_id]
	   FROM [VipunenTK_DW].[dbo].[v_f_koulutukseen_sijoittuneet_6v_tarkastelu] AS f
LEFT JOIN VipunenTK..d_tarkastelujakso AS d1 ON d1.tarkastelujakso_koodi =f.tarkastelujakso 
LEFT JOIN VipunenTK..d_kausi AS d2 ON d2.kausi_id =f.tilv
LEFT JOIN VipunenTK..d_tutkintoryhma AS d3 ON d3.tutkintoryhma_koodi =f.tutkryh 
LEFT JOIN VipunenTK..d_kausi AS d4 ON d4.kausi_id =f.suorv
LEFT JOIN VipunenTK..d_kausi AS d5 ON d5.kausi_id =f.suorlk
LEFT JOIN VipunenTK..d_sukupuoli AS d6 ON d6.sukupuoli_koodi =f.sp
LEFT JOIN VipunenTK..d_kausi AS d7 ON d7.kausi_id =f.syntv
LEFT JOIN VipunenTK..d_aidinkieli_versio1 AS d8 ON d8.aidinkieli_versio1_koodi =f.aikielir1
LEFT JOIN VipunenTK..d_alueluokitus  AS d9 ON d9.alueluokitus_avain =f.tutkkaskun
LEFT JOIN VipunenTK..d_alueluokitus_historia  AS d9h ON d9h.alueluokitus_avain =f.tutkkaskun and f.tilv_date between d9h.alkaa and d9h.paattyy
LEFT JOIN VipunenTK..d_kansalaisuus_versio1 AS d10 ON d10.kansalaisuus_versio1_koodi =f.kansalr1
LEFT JOIN VipunenTK..d_pohjoismaa AS d11 ON d11.pohjoismaa_koodi  =f.pohjmaa AND f.tilv_date between d11.alkaa and d11.paattyy
LEFT JOIN VipunenTK..d_valtio AS d12 ON d12.valtio_avain   ='EU'+f.eumaa
LEFT JOIN VipunenTK..d_valtio AS d13 ON d13.valtio_avain   ='ETA'+f.eumaa
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot  AS d14 ON d14.oppilaitos_avain =f.tunn
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia  AS d14h ON d14h.oppilaitos_avain =f.tunn and f.tilv_date between d14h.alkaa and d14h.paattyy
LEFT JOIN VipunenTK..d_opetuskieli AS d15 ON d15.opetuskieli_koodi =f.kkielir1
LEFT JOIN VipunenTK..d_ammatillisen_koulutuksen_koulutuslaji AS d16 ON d16.ammatillisen_koulutuksen_koulutuslaji_koodi =f.tutklaja
LEFT JOIN VipunenTK..d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus AS d17 ON d17.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_koodi =f.tutktav
LEFT JOIN VipunenTK..d_nuorten_aikuisten_koulutus AS d18 ON d18.nuorten_aikuisten_koulutus_koodi =f.aikoul
LEFT JOIN VipunenTK..d_alueluokitus AS d19 ON d19.alueluokitus_avain ='MAAK'+f.tutkmaak
LEFT JOIN VipunenTK..d_alueluokitus_historia AS d19h ON d19h.alueluokitus_avain ='MAAK'+f.tutkmaak AND f.tilv_date between d19h.alkaa and d19h.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus AS d20 ON d20.koulutusluokitus_avain=f.pohjkoulk 
LEFT JOIN VipunenTK..d_koulutusluokitus_historia AS d20h ON d20h.koulutusluokitus_avain =f.pohjkoulk AND f.tilv_date between d20h.alkaa and d20h.paattyy
LEFT JOIN VipunenTK..d_koulutusluokitus AS d21 ON d21.koulutusluokitus_avain=f.koulutus
LEFT JOIN VipunenTK..d_koulutusluokitus_historia AS d21h ON d21h.koulutusluokitus_avain =f.koulutus AND f.tilv_date between d21h.alkaa and d21h.paattyy
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot  AS d22 ON d22.oppilaitos_avain =f.oppilaitos
LEFT JOIN VipunenTK..d_oppilaitoksen_taustatiedot_historia  AS d22h ON d22h.oppilaitos_avain =f.oppilaitos and f.tilv_date between d22h.alkaa and d22h.paattyy
LEFT JOIN VipunenTK..d_alueluokitus AS d23 ON d23.alueluokitus_avain ='MAAK'+f.koulutuksen_maakunta
LEFT JOIN VipunenTK..d_alueluokitus_historia AS d23h ON d23h.alueluokitus_avain ='MAAK'+f.koulutuksen_maakunta AND f.tilv_date between d23h.alkaa and d23h.paattyy
LEFT JOIN VipunenTK..d_moninkertainen_haku AS d24 ON d24.moninkertainen_haku_koodi =f.monihaku
LEFT JOIN VipunenTK..d_paaasiallinen_toiminta AS d25 ON d25.paaasiallinen_toiminta_koodi =f.paaasiallinen_toiminta
LEFT JOIN VipunenTK..d_ammattiasema AS d26 ON d26.ammattiasema_koodi =f.ammattiasema
LEFT JOIN VipunenTK..d_koulutuksen_paattaneiden_toiminta AS d27 ON d27.koulutuksen_paattaneiden_toiminta_koodi =f.koulutuksen_paattaneiden_toiminta
LEFT JOIN VipunenTK..d_ika AS d28 ON d28.ika_avain = f.ika_1v  
LEFT JOIN VipunenTK..d_ika AS d28b ON d28b.ika_avain = 
														case 
															when f.ika_1v_suorv <= 18 then '18655v18'
															when f.ika_1v_suorv between 25 and 29 then '5v25'
															when f.ika_1v_suorv between 30 and 34 then '5v30'
															when f.ika_1v_suorv between 35 and 39 then '5v35'
															when f.ika_1v_suorv between 40 and 44 then '5v40'
															when f.ika_1v_suorv between 45 and 49 then '5v45'
															when f.ika_1v_suorv between 50 and 54 then '5v50'
															when f.ika_1v_suorv between 55 and 59 then '5v55'
															when f.ika_1v_suorv between 60 and 64 then '5v60'
															when f.ika_1v_suorv >= 65 then '19655v65'
															else f.ika_1v_suorv
														end
LEFT JOIN VipunenTK..d_ika AS d29 ON d29.ika_avain = f.ika_5v  
LEFT JOIN VipunenTK..d_kylla_ei AS d30a ON d30a.kylla_ei_koodi = f.opisk_lu
LEFT JOIN VipunenTK..d_kylla_ei AS d30b ON d30b.kylla_ei_koodi = f.opisk_amm_pk
LEFT JOIN VipunenTK..d_kylla_ei AS d30c ON d30c.kylla_ei_koodi = f.opisk_amm_at
LEFT JOIN VipunenTK..d_kylla_ei AS d30d ON d30d.kylla_ei_koodi = f.opisk_amm_eat
LEFT JOIN VipunenTK..d_kylla_ei AS d30e ON d30e.kylla_ei_koodi = f.opisk_amm
LEFT JOIN VipunenTK..d_kylla_ei AS d31 ON d31.kylla_ei_koodi = f.opisk_amk
LEFT JOIN VipunenTK..d_kylla_ei AS d32 ON d32.kylla_ei_koodi = f.opisk_yo
LEFT JOIN VipunenTK..d_kylla_ei AS d33 ON d33.kylla_ei_koodi = f.opisk_amk_koulala1
LEFT JOIN VipunenTK..d_kylla_ei AS d34 ON d34.kylla_ei_koodi = f.opisk_amk_koulala2
LEFT JOIN VipunenTK..d_kylla_ei AS d35 ON d35.kylla_ei_koodi = f.opisk_amk_koulala3
LEFT JOIN VipunenTK..d_kylla_ei AS d36 ON d36.kylla_ei_koodi = f.opisk_amk_koulala4
LEFT JOIN VipunenTK..d_kylla_ei AS d37 ON d37.kylla_ei_koodi = f.opisk_amk_koulala5
LEFT JOIN VipunenTK..d_kylla_ei AS d38 ON d38.kylla_ei_koodi = f.opisk_amk_koulala6
LEFT JOIN VipunenTK..d_kylla_ei AS d39 ON d39.kylla_ei_koodi = f.opisk_amk_koulala7
LEFT JOIN VipunenTK..d_kylla_ei AS d40 ON d40.kylla_ei_koodi = f.opisk_amk_koulala8
LEFT JOIN VipunenTK..d_kylla_ei AS d41 ON d41.kylla_ei_koodi = f.opisk_amk_koulala9
LEFT JOIN VipunenTK..d_kylla_ei AS d42 ON d42.kylla_ei_koodi = f.opisk_amk_koulala10
LEFT JOIN VipunenTK..d_kylla_ei AS d43 ON d43.kylla_ei_koodi = f.opisk_yo_koulala1
LEFT JOIN VipunenTK..d_kylla_ei AS d44 ON d44.kylla_ei_koodi = f.opisk_yo_koulala2
LEFT JOIN VipunenTK..d_kylla_ei AS d45 ON d45.kylla_ei_koodi = f.opisk_yo_koulala3
LEFT JOIN VipunenTK..d_kylla_ei AS d46 ON d46.kylla_ei_koodi = f.opisk_yo_koulala4
LEFT JOIN VipunenTK..d_kylla_ei AS d47 ON d47.kylla_ei_koodi = f.opisk_yo_koulala5
LEFT JOIN VipunenTK..d_kylla_ei AS d48 ON d48.kylla_ei_koodi = f.opisk_yo_koulala6
LEFT JOIN VipunenTK..d_kylla_ei AS d49 ON d49.kylla_ei_koodi = f.opisk_yo_koulala7
LEFT JOIN VipunenTK..d_kylla_ei AS d50 ON d50.kylla_ei_koodi = f.opisk_yo_koulala8
LEFT JOIN VipunenTK..d_kylla_ei AS d51 ON d51.kylla_ei_koodi = f.opisk_yo_koulala9
LEFT JOIN VipunenTK..d_kylla_ei AS d52 ON d52.kylla_ei_koodi = f.opisk_yo_koulala10
LEFT JOIN VipunenTK..d_kylla_ei AS d53 ON d53.kylla_ei_koodi = f.opisk_vah2_koulala
LEFT JOIN VipunenTK..d_kylla_ei AS d54 ON d54.kylla_ei_koodi = f.haku_amm
LEFT JOIN VipunenTK..d_kylla_ei AS d55 ON d55.kylla_ei_koodi = f.haku_amk
LEFT JOIN VipunenTK..d_kylla_ei AS d56 ON d56.kylla_ei_koodi = f.haku_yo

LEFT JOIN VipunenTK..d_kylla_ei AS d57 ON d57.kylla_ei_koodi = f.[opintotuki_ulkom]


GO


