USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_lukio_ja_ammatillinen_2_3_h]    Script Date: 11.10.2023 10:37:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_f_tab_lukio_ja_ammatillinen_2_3_h] AS

SELECT 
	  [Tilastovuosi] = f.tilastointivuosi
	  ,[Ikäryhmä] = d1.ika5v
	  ,[Kotikunta] = d31.kunta
	  ,[Kotimaakunta] = d31.maakunta
	  ,[Edellisen vuoden kotikunta] = d32.kunta
	  ,[Edellisen vuoden kotimaakunta] = d32.maakunta
	  ,[Kotikunta sama kuin koulutuksen kunta] = case when d33.kylla_ei_koodi=1 then 'Asuinkunta sama kuin koulutuksen kunta' when d33.kylla_ei_koodi=0 then 'Asuinkunta eri kuin koulutuksen kunta' else d33.kylla_ei end
	  ,[Kotimaakunta sama kuin koulutuksen maakunta] = case when d34.kylla_ei_koodi=1 then 'Asuinmaakunta sama kuin koulutuksen maakunta' when d34.kylla_ei_koodi=0 then 'Asuinmaakunta eri kuin koulutuksen maakunta' else d34.kylla_ei end
	  ,[Kotikunta sama kuin ed. vuonna] = case when d35.kylla_ei_koodi=1 then 'Asuinkunta sama kuin ed. vuonna' when d35.kylla_ei_koodi=0 then 'Asuinkunta eri kuin ed. vuonna' else d35.kylla_ei end
	  ,[Kotimaakunta sama kuin ed. vuonna] = case when d36.kylla_ei_koodi=1 then 'Asuinmaakunta sama kuin ed. vuonna' when d36.kylla_ei_koodi=0 then 'Asuinmaakunta eri kuin ed. vuonna' else d36.kylla_ei end
	  ,[Ed. vuoden kotimaakunta sama kuin koulutuksen maakunta] = case when d37.kylla_ei_koodi=1 then 'Edellisen vuoden asuinmaakunta sama kuin koulutuksen maakunta' when d37.kylla_ei_koodi=0 then 'Edellisen vuoden asuinmaakunta eri kuin koulutuksen maakunta' else d37.kylla_ei end
	  ,[Ed. vuoden kotikunta sama kuin koulutuksen kunta] = case when d38.kylla_ei_koodi=1 then 'Edellisen vuoden asuinkunta sama kuin koulutuksen kunta' when d38.kylla_ei_koodi=0 then 'Edellisen vuoden asuinkunta eri kuin koulutuksen kunta' else d38.kylla_ei end

	  ,[Koulutusala] = d2.koulutusala2002
	  ,[Koulutusala, taso 1] = d2b.iscfibroad2013
      ,[Koulutusaste] = case d3.koulutusaste_2002 when 'Tuntematon' then d3b.Koulutusaste_taso2 else d3.koulutusaste_2002 end
	  ,[Koulutusaste, taso 1] = d3b.iscle2011
	  ,[Koulutusaste, taso 2] = d3b.Koulutusaste_taso2
      ,[Koulutuksen kieli] = d4.kieli
      ,[Koulutuksen kunta] = d5.kunta
	  ,[Koulutuksen maakunta] = d5.maakunta
      --,[Hallinnonala] = d6.opetushallinnon_koulutus
	  ,[Hallinnonala] = d6b.hallinnonala
	  ,[Koulutuslaji] = d7.lukiokoulutuksen_koulutuslaji
      ,[Nuorten/aikuisten koulutus] = d8.nuorten_aikuisten_koulutus
	  ,[Tutkintotyyppi] = d9.ammatillisen_koulutuksen_koulutuslaji
      ,[Järjestämistapa] = d10.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus
      ,[Työvoimapoliittinen koulutus] = d11.tyovoimapoliittinen
      ,[Rahoituslähde] = d12.rahoituslahde_amm
      ,[Koulutuksen tavoite] = d13.tutkinnon_tavoite
      ,[Yrittäjän oppisopimuskoulutus] = d14.yrittajan_oppisopimuskoulutus
      --,[Koulutussektori] = d15.koulutussektori
      --,[Hallinnonala II] = d16.hallinnonala
      ,[Järjestämismuoto] = d17.koulutuksen_jarjestamismuoto
	  ,[Koulutus- ja oppisopimusjaksot] = d17b.selite_fi
      --,[Koulutuksen tavoite/toteuma] = d18.koulutuksen_tavoite_toteuma
	  ,[Nuorten/aikuisten koulutus amm] = d19.nuorten_aikuisten_koulutus_amm
      ,[Koulutuslaji (OKM)] = d20.koulutuslaji_okm
      --,[Koulutuksen kunta yht] = d21.kunta
	  --,[Koulutuksen maakunta yht] = d21.maakunta

      ,[Oppilaitos] = d22.oppilaitos
	  ,[Oppilaitoksen kunta] = d26.kunta
	  ,[Oppilaitoksen maakunta] = d26.maakunta
   --   ,[Koulutuksen järjestäjä] = d23.koulutuksen_jarjestaja
   --   ,[Koulutuksen järjestäjän kunta] = d25.kunta
	  --,[Koulutuksen järjestäjän maakunta] = d25.maakunta
	  --,[Oppisopimuskoulutuksen järjestäjä] = d24.koulutuksen_jarjestaja
      ,[Koulutuksen järjestäjä] = d27.koulutuksen_jarjestaja
      ,[Koulutuksen järjestäjän kunta] = d29.kunta
	  ,[Koulutuksen järjestäjän maakunta] = d29.maakunta
   --   ,[Oppilaitos yht] = d28.oppilaitos
   --   ,[Oppilaitoksen kunta yht] = d30.kunta
	  --,[Oppilaitoksen maakunta yht] = d30.maakunta
	  ,[Koulutuksen kuntakoodi] = d5.kunta_koodi
	  ,[Koulutuksen maakuntakoodi] = d5.maakunta_koodi
	  ,[Oppilaitoskoodi] = d22.oppilaitoskoodi
	  ,[Koulutuksen järjestäjäkoodi] = d27.koulutuksen_jarjestajakoodi
	  ,[Tutkintokoodi] = d9.ammatillisen_koulutuksen_koulutuslaji_koodi
	  ,[Koulutusalakoodi] = d2.koulutusala2002_koodi

      ,[aloittaneet]
      ,[opiskelijat]
      ,[opiskelijat_lasna]
	  ,[lukumaara]

	  --ruotsi
	  ,[Statistikår] = f.tilastointivuosi

	  ,[Åldersgrupp] = d1.ika5v_SV
	  ,[Hemkommun] = d31.kunta_SV
	  ,[Hemlandskap] = d31.maakunta_SV
	  ,[Hemkommun året innan] = d32.kunta_SV
	  ,[Hemlandskap året innan] = d32.maakunta_SV
	  ,[Hemkommun samma som utbildningens kommun] = case when d33.kylla_ei_koodi=1 then 'Bostadskommun samma som utbildningens kommun' when d33.kylla_ei_koodi=0 then 'Bostadskommun annan som utbildningens kommun' else d33.kylla_ei_SV end
	  ,[Hemlandskap samma som utbildningens landskap] = case when d34.kylla_ei_koodi=1 then 'Bostadslandskap samma som utbildningens landskap' when d34.kylla_ei_koodi=0 then 'Bostadslandskap annan som utbildningens landskap' else d34.kylla_ei_SV end
	  ,[Hemkommun samma som under föregående år] = case when d35.kylla_ei_koodi=1 then 'Bostadskommun samma som under föregående år' when d35.kylla_ei_koodi=0 then 'Bostadskommun annan som under föregående år' else d35.kylla_ei_SV end
	  ,[Hemlandskap samma som under föregående år] = case when d36.kylla_ei_koodi=1 then 'Bostadslandskap samma som under föregående år' when d36.kylla_ei_koodi=0 then 'Bostadslandskap annan som under föregående år' else d36.kylla_ei_SV end
	  ,[Föregående års hemlandskap samma som utbildningens landskap] = case when d37.kylla_ei_koodi=1 then 'Föregående års bostadslandskap samma som utbildningens landskap' when d37.kylla_ei_koodi=0 then 'Föregående års bostadslandskap annan som utbildningens landskap' else d37.kylla_ei_SV end
	  ,[Föregående års hemkommun samma som utbildningens kommun] = case when d38.kylla_ei_koodi=1 then 'Föregående års bostadskommun samma som utbildningens kommun' when d38.kylla_ei_koodi=0 then 'Föregående års bostadskommun annan som utbildningens kommun' else d38.kylla_ei_SV end

	  ,[Utbildningsområde] = d2.koulutusala2002_SV
	  ,[Utbildningsområde, nivå 1] = d2b.iscfibroad2013_SV
      ,[Utbildningsnivå] = d3.koulutusaste_2002_SV
	  ,[Utbildningsnivå, nivå 1] = d3b.iscle2011_SV
	  ,[Utbildningsnivå, nivå 2] = d3b.Koulutusaste_taso2_SV
      ,[Utbildningens språk] = d4.kieli_SV
      ,[Utbildningens kommun] = d5.kunta_SV
	  ,[Utbildningens landskap] = d5.maakunta_SV
      --,[Förvaltningsområde] = d6.opetushallinnon_koulutus_SV
	  ,[Förvaltningsområde] = d6b.hallinnonala_SV
	  ,[Utbildningsslag] = d7.lukiokoulutuksen_koulutuslaji_SV
      ,[Ungdoms-/vuxenutbildning] = d8.nuorten_aikuisten_koulutus_SV
	  ,[Typ av examen] = d9.ammatillisen_koulutuksen_koulutuslaji_SV
      ,[Sättet på vilket utbildningen ordnas] = d10.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_SV
      ,[Arbetskraftspolitisk utbildning] = d11.tyovoimapoliittinen_SV
      ,[Finansieringskälla] = d12.rahoituslahde_amm_SV
      ,[Utbildningens mål] = d13.tutkinnon_tavoite_SV
      ,[Företagarens läroavtalsutbildning] = d14.yrittajan_oppisopimuskoulutus_SV
      --,[Koulutussektori] = d15.koulutussektori
      --,[Hallinnonala II] = d16.hallinnonala
      ,[Formen i vilken utbildningen ordnas] = d17.koulutuksen_jarjestamismuoto_SV
	  ,[Utbildnings- och läroavtalsperioder] = d17b.selite_sv
      --,[Koulutuksen tavoite/toteuma] = d18.koulutuksen_tavoite_toteuma
	  ,[Ungdoms-/vuxenutbildning yrkesskola] = d19.nuorten_aikuisten_koulutus_amm_SV
      ,[Utbildningsslag (UKM)] = d20.koulutuslaji_okm_SV
      --,[Koulutuksen kunta yht] = d21.kunta
	  --,[Koulutuksen maakunta yht] = d21.maakunta

      ,[Läroanstalt] = d22.oppilaitos_SV
	  ,[Läroanstaltens kommun] = d26.kunta_SV
	  ,[Läroanstaltens landskap] = d26.maakunta_SV
   --   ,[Koulutuksen järjestäjä] = d23.koulutuksen_jarjestaja
   --   ,[Koulutuksen järjestäjän kunta] = d25.kunta
	  --,[Koulutuksen järjestäjän maakunta] = d25.maakunta
	  --,[Oppisopimuskoulutuksen järjestäjä] = d24.koulutuksen_jarjestaja
      ,[Utbildningsanordnare] = d27.koulutuksen_jarjestaja_SV
      ,[Utbildningsanordnarens kommun] = d29.kunta_SV
	  ,[Utbildningsanordnarens landskap] = d29.maakunta_SV

	  --englanti
	  ,[Statistical year] = f.tilastointivuosi

	  ,[Age group] = d1.ika5v_EN
	  ,[Municipality of residence] = d31.kunta_EN
	  ,[Region of residence] = d31.maakunta_EN
	  ,[Last year's municipality of residence] = d32.kunta_EN
	  ,[Last year's region of residence] = d32.maakunta_EN
	  ,[Municipality of residence the same as municipality of education] = case when d33.kylla_ei_koodi=1 then 'Municipality of residence the same as municipality of education' when d33.kylla_ei_koodi=0 then 'Municipality of residence other than municipality of education' else d33.kylla_ei_EN end
	  ,[Region of residence the same as region of education] = case when d34.kylla_ei_koodi=1 then 'Region of residence the same as region of education' when d34.kylla_ei_koodi=0 then 'Region of residence other than region of education' else d34.kylla_ei_EN end
	  ,[Municipality of residence the same as last year's] = case when d35.kylla_ei_koodi=1 then 'Municipality of residence the same as last year''s' when d35.kylla_ei_koodi=0 then 'Municipality of residence other than last year''s' else d35.kylla_ei_EN end
	  ,[Region of residence the same as last year's] = case when d36.kylla_ei_koodi=1 then 'Region of residence the same as last year''s' when d36.kylla_ei_koodi=0 then 'Region of residence other than last year''s' else d36.kylla_ei_EN end
	  ,[Last year's region of residence the same as region of education] = case when d37.kylla_ei_koodi=1 then 'Last year''s region of residence the same as region of education' when d37.kylla_ei_koodi=0 then 'Last year''s region of residence other than region of education' else d37.kylla_ei_EN end
	  ,[Last year's municipality of residence the same as municipality of education] = case when d38.kylla_ei_koodi=1 then 'Last year''s municipality of residence the same as municipality of education' when d38.kylla_ei_koodi=0 then 'Last year''s municipality of residence other than municipality of education' else d38.kylla_ei_EN end

	  ,[Field of education] = d2.koulutusala2002_EN
	  ,[Field of education, tier 1] = d2b.iscfibroad2013_EN
      ,[Level of education] = d3.koulutusaste_2002_EN
	  ,[Level of education, tier 1] = d3b.iscle2011_EN
	  ,[Level of education, tier 2] = d3b.Koulutusaste_taso2_EN
      ,[Language of education] = d4.kieli_EN
      ,[Municipality of education] = d5.kunta_EN
	  ,[Region of education] = d5.maakunta_EN
      --,[Administrative sector] = d6.opetushallinnon_koulutus_EN
	  ,[Administrative sector] = d6b.hallinnonala_EN
	  ,[Form of education and training] = d7.lukiokoulutuksen_koulutuslaji_EN
      ,[Youth/adult education] = d8.nuorten_aikuisten_koulutus_EN
	  ,[Qualification type] = d9.ammatillisen_koulutuksen_koulutuslaji_EN
      ,[Method of vocational education and training] = d10.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_EN
      ,[Labour policy education and training] = d11.tyovoimapoliittinen_EN
      ,[Source of funding] = d12.rahoituslahde_amm_EN
      ,[Objective of education] = d13.tutkinnon_tavoite_EN
      ,[Apprenticeship training for self-employed persons] = d14.yrittajan_oppisopimuskoulutus_EN
      --,[Koulutussektori] = d15.koulutussektori
      --,[Hallinnonala II] = d16.hallinnonala
      ,[Form of vocational education and training] = d17.koulutuksen_jarjestamismuoto_EN
	  ,[Training agreement and apprenticeship training periods] = d17b.selite_en
      --,[Koulutuksen tavoite/toteuma] = d18.koulutuksen_tavoite_toteuma
	  ,[Youth/adult education voc. ed.] = d19.nuorten_aikuisten_koulutus_amm_EN
      ,[Form of education and training (MinEdu)] = d20.koulutuslaji_okm_EN
      --,[Koulutuksen kunta yht] = d21.kunta
	  --,[Koulutuksen maakunta yht] = d21.maakunta

      ,[Educational institution] = d22.oppilaitos_EN
	  ,[Municipality of the institution] = d26.kunta_EN
	  ,[Region of the institution] = d26.maakunta_EN
   --   ,[Koulutuksen järjestäjä] = d23.koulutuksen_jarjestaja
   --   ,[Koulutuksen järjestäjän kunta] = d25.kunta
	  --,[Koulutuksen järjestäjän maakunta] = d25.maakunta
	  --,[Oppisopimuskoulutuksen järjestäjä] = d24.koulutuksen_jarjestaja
      ,[Education provider] = d27.koulutuksen_jarjestaja_EN
      ,[Municipality of the education provider] = d29.kunta_EN
	  ,[Region of the education provider] = d29.maakunta_EN
  
	  --järjestys
	  ,[Ikä jarj] = d1.jarjestys_ika5v
	  ,[Kotimaakunta jarj] = d31.jarjestys_maakunta
	  ,[Kotimaakunta ed jarj] = d32.jarjestys_maakunta
	  ,[Koulutusala jarj] = d2.jarjestys_koulutusala2002
	  ,[Koulutusala, taso1  jarj] = d2b.jarjestys_iscfibroad2013
	  ,[Koulutusaste, taso1  jarj] = d3b.jarjestys_iscle2011
	  ,[Koulutusaste, taso2  jarj] = d3b.jarjestys_Koulutusaste_taso2
	  ,[Koulutuksen kieli jarj] = d4.jarjestys
	  ,[Koulutuksen maakunta jarj] = d5.jarjestys_maakunta
	  ,[Hallinnonala jarj] = d6b.jarjestys
	  ,[Koulutuslaji jarj] = d7.jarjestys
	  ,[Nuorten/aikuisten jarj] = d8.jarjestys
	  ,[Tutkintotyyppi jarj] = d9.jarjestys
	  ,[Järjestämistapa jarj] = d10.jarjestys
	  ,[Työvoimapoliittinen jarj] = d11.jarjestys
	  ,[Rahoituslähde jarj] = d12.jarjestys
	  ,[Tavoite jarj] = d13.jarjestys
	  ,[Yrit oppis jarj] = d14.jarjestys
	  ,[Järjestämismuoto jarj] = d17.jarjestys
	  ,[Koulutus- ja oppisopimusjaksot jarj] = d17b.jarjestys_koodi
	  ,[Nuorten/aikuisten amm jarj] = d19.jarjestys
	  ,[Koulutuslaji okm jarj] = d20.jarjestys
	  ,[Oppilaitoksen maakunta jarj] = d26.jarjestys_maakunta
	  ,[Koul jarj yht jarj] = d29.jarjestys_maakunta
	  ,[Kotikunta sama kuin koulutuksen kunta jarj] = d33.jarjestys
	  ,[Kotimaakunta sama kuin koulutuksen maakunta jarj] = d34.jarjestys
	  ,[Kotikunta sama kuin ed. vuonna jarj] = d35.jarjestys
	  ,[Kotimaakunta sama kuin ed. vuonna jarj] = d36.jarjestys
	  ,[Ed. vuoden kotimaakunta sama kuin koulutuksen maakunta jarj] = d37.jarjestys
	  ,[Ed. vuoden kotikunta sama kuin koulutuksen kunta jarj] = d38.jarjestys
	  
/*
--isced
,d2.iscle2011 as "Koulutusaste, taso 1"
,d2.Koulutusaste_taso2 as "Koulutusaste, taso 2"
,d2.iscfibroad2013 as "Koulutusala, taso 1"
,d2.iscfinarrow2013 as "Koulutusala, taso 2"
,d2.iscfi2013 as "Koulutusala, taso 3"
,d2.iscle2011_SV as "Utbildn.nivå, nivå 1"
,d2.Koulutusaste_taso2_SV as "Utbildn.nivå, nivå 2"
,d2.iscfibroad2013_SV as "Utbildn.område, nivå 1"
,d2.iscfinarrow2013_SV as "Utbildn.område, nivå 2"
,d2.iscfi2013_SV as "Utbildn.område, nivå 3"
,d2.iscle2011_EN as "Level of education, tier 1"
,d2.Koulutusaste_taso2_EN as "Level of education, tier 2"
,d2.iscfibroad2013_EN as "Field of education, tier 1"
,d2.iscfinarrow2013_EN as "Field of education, tier 2"
,d2.iscfi2013_EN as "Field of education, tier 3"
,d3b.jarjestys_iscle2011 as jarj_isced_koulast1
,d3b.jarjestys_Koulutusaste_taso2 as jarj_isced_koulast2
,d2b.jarjestys_iscfibroad2013 as jarj_isced_koulala1
,d2.jarjestys_iscfinarrow2013 as jarj_isced_koulala2
,d2.jarjestys_iscfi2013 as jarj_isced_koulala3
*/

  FROM [VipunenTK].[dbo].[f_2_3h_Lukiokoulutuksen_ja_ammatillisen_koulutuksen_opiskelijat] f
  left join VipunenTK.dbo.d_ika d1 on d1.id=f.ika_5v_id
  left join VipunenTK.dbo.d_koulutusluokitus d2 on d2.id=f.koulutusala_id
  left join VipunenTK.dbo.d_koulutusluokitus d2b on d2b.id=f.koulutusala_taso1_id
  left join VipunenTK.dbo.d_koulutusaste_2002 d3 on d3.id=f.koulutusaste_id
  left join VipunenTK.dbo.d_koulutusluokitus d3b on d3b.id=f.koulutusaste_taso2_id
  left join VipunenTK.dbo.d_kieli d4 on d4.id=f.koulutuksen_kieli_id
  left join VipunenTK.dbo.d_alueluokitus d5 on d5.id=f.koulutuksen_kunta_id
  left join VipunenTK.dbo.d_opetushallinnon_koulutus d6 on d6.id=f.opetushallinnon_koulutus_id
  left join VipunenTK.dbo.d_hallinnonala2 d6b on d6b.id=f.hallinnonala2_id
  left join VipunenTK.dbo.d_lukiokoulutuksen_koulutuslaji d7 on d7.id=f.lukiokoulutuksen_koulutuslaji_id
  left join VipunenTK.dbo.d_nuorten_aikuisten_koulutus d8 on d8.id=f.nuorten_aikuisten_koulutus_id
  left join VipunenTK.dbo.d_ammatillisen_koulutuksen_koulutuslaji d9 on d9.id=f.ammatillisen_koulutuksen_koulutuslaji_id
  left join VipunenTK.dbo.d_opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus d10 on d10.id=f.opetussuunnitelmaperusteinen_koulutus_nayttotutkintoon_valmistava_koulutus_id
  left join VipunenTK.dbo.d_tyovoimapoliittinen d11 on d11.id=f.tyovoimapoliittinen_id
  left join VipunenTK.dbo.d_rahoituslahde_amm d12 on d12.id=f.rahoituslahde_amm_id
  left join VipunenTK.dbo.d_tutkinnon_tavoite d13 on d13.id=f.tutkinnon_tavoite_id
  left join VipunenTK.dbo.d_yrittajan_oppisopimuskoulutus d14 on d14.id=f.yrittajan_oppisopimuskoulutus_id
  --left join VipunenTK.dbo.d_koulutussektori d15 on d15.id=f.koulutussektori_id
  --left join VipunenTK.dbo.d_hallinnonala d16 on d16.id=f.hallinnonala_id
  left join VipunenTK.dbo.d_koulutuksen_jarjestamismuoto d17 on d17.id=f.koulutuksen_jarjestamismuoto_id
  left join VipunenTK.dbo.d_amm_sopimusjaksot d17b on d17b.id=f.amm_sopimusjaksot_id
  left join VipunenTK.dbo.d_koulutuksen_tavoite_toteuma d18 on d18.id=f.koulutuksen_tavoite_toteuma_id
  left join VipunenTK.dbo.d_nuorten_aikuisten_koulutus_amm d19 on d19.id=f.nuorten_aikuisten_koulutus_amm_id
  left join VipunenTK.dbo.d_koulutuslaji_okm d20 on d20.id=f.koulutuslaji_OKM_id
  --left join VipunenTK.dbo.d_alueluokitus d21 on d21.id=f.yht_koulutuksen_kunta_id
  left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d22 on d22.id=f.oppilaitos_id
  --left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d23 on d23.id=f.koulutuksen_jarjestaja_id
  --left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d24 on d24.id=f.oppisopimuskoulutuksen_jarjestaja_id
  --left join VipunenTK.dbo.d_alueluokitus d25 on d25.id=f.koulutuksen_jarjestaja_kunta_id
  left join VipunenTK.dbo.d_alueluokitus d26 on d26.id=f.oppilaitos_kunta_id
  left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d27 on d27.id=f.yht_koulutuksen_jarjestaja_id
  --left join VipunenTK.dbo.d_oppilaitoksen_taustatiedot d28 on d28.id=f.yht_oppilaitos_id
  left join VipunenTK.dbo.d_alueluokitus d29 on d29.id=f.yht_koulutuksen_jarjestaja_kunta_id
  --left join VipunenTK.dbo.d_alueluokitus d30 on d30.id=f.yht_oppilaitos_kunta_id
  left join VipunenTK.dbo.d_alueluokitus d31 on d31.id=f.kotikunta_id
  left join VipunenTK.dbo.d_alueluokitus d32 on d32.id=f.kotikunta_ed_id
  left join VipunenTK.dbo.d_kylla_ei d33 on d33.id=f.kotikunta_sama_kuin_koulutuksen_kunta_id
  left join VipunenTK.dbo.d_kylla_ei d34 on d34.id=f.kotimaakunta_sama_kuin_koulutuksen_maakunta_id
  left join VipunenTK.dbo.d_kylla_ei d35 on d35.id=f.kotikunta_sama_kuin_ed_vuonna_id
  left join VipunenTK.dbo.d_kylla_ei d36 on d36.id=f.kotimaakunta_sama_kuin_ed_vuonna_id
  left join VipunenTK.dbo.d_kylla_ei d37 on d37.id=f.ed_vuoden_kotimaakunta_sama_kuin_koulutuksen_maakunta_id
  left join VipunenTK.dbo.d_kylla_ei d38 on d38.id=f.ed_vuoden_kotikunta_sama_kuin_koulutuksen_kunta_id

GO


