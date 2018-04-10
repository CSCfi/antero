USE [VipunenTK_DW]
GO
/****** Object:  StoredProcedure [dbo].[p_lataa_f_koulutukseen_sijoittuneet_2v]    Script Date: 10.4.2018 13:46:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[p_lataa_f_koulutukseen_sijoittuneet_2v] AS

exec VipunenTK_SA.dbo.p_lataa_koulutukseen_sijoittuneet_2v;

truncate table vipunentk.dbo.[f_koulutukseen_sijoittuneet_2v];

insert into vipunentk.dbo.[f_koulutukseen_sijoittuneet_2v]
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
	  ,[koulutuksen_paattaneiden_toiminta_id] = coalesce(d28.id,-1)
      ,[rivinumero]= f.rivinumero
      ,[ika_1v]= f.ika_1v
	  ,[ika_1v_id] =  coalesce(d29.id,-1)
	  ,[ika_5v] = f.ika_5v
      ,[ika_5v]=  coalesce(d30.id,-1)
	   FROM [VipunenTK_DW].[dbo].[v_f_koulutukseen_sijoittuneet_2v_tarkastelu] AS f
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
LEFT JOIN VipunenTK..d_nuorten_aikuisten_koulutus AS d18 ON d18.nuorten_aikuisten_koulutus_koodi =f.tutktav
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
LEFT JOIN VipunenTK..d_koulutuksen_paattaneiden_toiminta AS d28 ON d28.koulutuksen_paattaneiden_toiminta_koodi =f.koulutuksen_paattaneiden_toiminta
LEFT JOIN VipunenTK..d_ika  AS d29 ON d29.ika_avain    =f.ika_1v  
LEFT JOIN VipunenTK..d_ika  AS d30 ON d30.ika_avain    =f.ika_5v  


GO

USE [ANTERO]
 


