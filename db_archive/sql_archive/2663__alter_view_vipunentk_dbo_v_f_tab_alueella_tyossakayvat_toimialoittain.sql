USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_alueella_tyossakayvat_toimialoittain]    Script Date: 3.12.2019 10:39:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







ALTER VIEW [dbo].[v_f_tab_alueella_tyossakayvat_toimialoittain] AS

SELECT [Tilastovuosi] = [tilv]
      ,[lkm]
      ,[Ammattiryhmä 1. taso] = d1.mitenna_ammattiryhma1
      ,[Ammattiryhmä 2. taso] = d1.mitenna_ammattiryhma2
      ,[Toimiala 1. taso] = d8.mitenna_toimiala1
      ,[Toimiala 2. taso] = d8.mitenna_toimiala2
      ,[Toimiala Tilastokeskus] = d2.toimiala1
      ,[Ikäryhmä] = d3.ika5v
      ,[Koulutusaste] = d4.koulutusaste2002
	  ,[Koulutusaste, taso 1] = d4b.iscle2011
	  ,[Koulutusaste, taso 2] = d4b.Koulutusaste_taso2
	  ,[Koulutusala, taso 1] = case f.koulutusala_taso3_id when -1 then d6b.iscfibroad2013 else d6c.iscfibroad2013 end
	  ,[Koulutusala, taso 2] = case f.koulutusala_taso3_id when -1 then d6b.iscfinarrow2013 else d6c.iscfinarrow2013 end
	  ,[Koulutusala, taso 3] = d6c.iscfi2013
	  ,[Ammatillisen koulutuksen koulutuslaji] = d5.ammatillisen_koulutuksen_koulutuslaji
      ,[Opintoala] = d6.opintoala2002
	  ,[Koulutusala] = d6.koulutusala2002
      ,[Työpaikan sijaintimaakunta] = d7.maakunta

	  --Ruotsi
	  ,[Statistikår] = [tilv]
      ,[Yrkesgrupp, nivå 1] = d1.mitenna_ammattiryhma1_SV
      ,[Yrkesgrupp, nivå 2] = d1.mitenna_ammattiryhma2_SV
      ,[Bransch, nivå 1] = d8.mitenna_toimiala1_SV
      ,[Bransch, nivå 2] = d8.mitenna_toimiala2_SV
      ,[Bransch] = d2.toimiala1_SV
      ,[Åldersgrupp] = d3.ika5v_SV
      ,[Utbildningsnivå] = d4.koulutusaste2002_SV
	  ,[Utbildningsnivå, nivå 1] = d4b.iscle2011_SV
	  ,[Utbildningsnivå, nivå 2] = d4b.Koulutusaste_taso2_SV
	  ,[Utbildningsområde, nivå 1] = case f.koulutusala_taso3_id when -1 then d6b.iscfibroad2013_SV else d6c.iscfibroad2013_SV end
	  ,[Utbildningsområde, nivå 2] = case f.koulutusala_taso3_id when -1 then d6b.iscfinarrow2013_SV else d6c.iscfinarrow2013_SV end
	  ,[Utbildningsområde, nivå 3] = d6c.iscfi2013_SV
	  ,[Utbildningsslag] = d5.ammatillisen_koulutuksen_koulutuslaji_SV
      ,[Studieområde] = d6.opintoala2002_SV
	  ,[Utbildningsområde] = d6.koulutusala2002_SV
      ,[Arbetsplatsens landskap] = d7.maakunta_SV

	  --Englanti
	  ,[Statistical year] = [tilv]
      ,[Profession group, level 1] = d1.mitenna_ammattiryhma1_EN
      ,[Profession group, level 2] = d1.mitenna_ammattiryhma2_EN
      ,[Industry, level 1] = d8.mitenna_toimiala1_EN
      ,[Industry, level 2] = d8.mitenna_toimiala2_EN
      ,[Industry] = d2.toimiala1_EN
      ,[Age group] = d3.ika5v_EN
      ,[Level of education] = d4.koulutusaste2002_EN
	  ,[Level of education, tier 1] = d4b.iscle2011_EN
	  ,[Level of education, tier 2] = d4b.Koulutusaste_taso2_EN
	  ,[Field of education, tier 1] = case f.koulutusala_taso3_id when -1 then d6b.iscfibroad2013_EN else d6c.iscfibroad2013_EN end
	  ,[Field of education, tier 2] = case f.koulutusala_taso3_id when -1 then d6b.iscfinarrow2013_EN else d6c.iscfinarrow2013_EN end
	  ,[Field of education, tier 3] = d6c.iscfi2013_EN
	  ,[Form of education and training] = d5.ammatillisen_koulutuksen_koulutuslaji_EN
      ,[Subfield of education] = d6.opintoala2002_EN
	  ,[Field of education] = d6.koulutusala2002_EN
      ,[Region where the job is located] = d7.maakunta_EN

	  --koodimuuttujat
	  ,d6.koulutusala2002_koodi as "Koodit Koulutusala"
	  ,d6.opintoala2002_koodi as "Koodit Opintoala"
	  ,d6.koulutusaste2002_koodi as "Koodit Koulutusaste"
	  ,d7.maakunta_koodi as "Koodit Työpaikan maakunta"
	  ,d4b.iscle2011_koodi as "Koodit Koulutusaste, taso 1"
	  ,d4b.Koulutusaste_taso2_koodi as "Koodit Koulutusaste, taso 2"
	  ,(case f.koulutusala_taso3_id when -1 then d6b.iscfibroad2013_koodi else d6c.iscfibroad2013_koodi end) as "Koodit Koulutusala, taso 1"
	  ,(case f.koulutusala_taso3_id when -1 then d6b.iscfinarrow2013_koodi else d6c.iscfinarrow2013_koodi end) as "Koodit Koulutusala, taso 2"
	  ,d6c.iscfi2013_koodi as "Koodit Koulutusala, taso 3"
/*
	  --isced
	  ,d6.iscle2011 as "Koulutusaste, taso 1"
	  ,d6.Koulutusaste_taso2 as "Koulutusaste, taso 2"
	  ,d6.iscfibroad2013 as "Koulutusala, taso 1"
	  ,d6.iscfinarrow2013 as "Koulutusala, taso 2"
	  ,d6.iscfi2013 as "Koulutusala, taso 3"
	  ,d6.OKM_ohjauksen_ala as "OKM ohjauksen ala, korkeak."
	  ,d6.iscle2011_SV as "Utbildn.nivå, nivå 1"
	  ,d6.Koulutusaste_taso2_SV as "Utbildn.nivå, nivå 2"
	  ,d6.iscfibroad2013_SV as "Utbildn.område, nivå 1"
	  ,d6.iscfinarrow2013_SV as "Utbildn.område, nivå 2"
	  ,d6.iscfi2013_SV as "Utbildn.område, nivå 3"
	  ,d6.OKM_ohjauksen_ala_SV as "UKM-styrningsområde, högskolor"
	  ,d6.iscle2011_EN as "Level of education, tier 1"
	  ,d6.Koulutusaste_taso2_EN as "Level of education, tier 2"
	  ,d6.iscfibroad2013_EN as "Field of education, tier 1"
	  ,d6.iscfinarrow2013_EN as "Field of education, tier 2"
	  ,d6.iscfi2013_EN as "Field of education, tier 3"
	  ,d6.OKM_ohjauksen_ala_EN as "Field of ed., HE steering"
*/
	  --järjestyskentät
	  ,[Ammattiryhmä 1. taso järj] = d1.jarjestys_ammattiryhma1
      ,[Ammattiryhmä 2. taso järj] = d1.jarjestys_ammattiryhma2
      ,[Toimiala 1. taso järj] = d8.jarjestys_mitenna_toimiala1
      ,[Toimiala 2. taso järj] = d8.jarjestys_mitenna_toimiala2
      ,[Toimiala Tilastokeskus järj] = d2.jarjestys_toimiala1
      ,[Ikäryhmä järj] = d3.jarjestys_ika5v
      ,[Koulutusaste järj] = d4.jarjestys_koulutusaste2002
	  ,[Ammatillisen_koulutuksen_koulutuslaji järj] = d5.jarjestys
      ,[Opintoala järj] = d6.jarjestys_opintoala2002
	  ,[Koulutusala järj] = d6.jarjestys_koulutusala2002
      ,[Työpaikan sijaintimaakunta järj] = d7.jarjestys_maakunta
	  ,jarj_isced_koulast1 = d4b.jarjestys_iscle2011
	  ,jarj_isced_koulast2 = d4b.jarjestys_Koulutusaste_taso2
	  ,jarj_isced_koulala1 = case f.koulutusala_taso3_id when -1 then d6b.jarjestys_iscfibroad2013 else d6c.jarjestys_iscfibroad2013 end
	  ,jarj_isced_koulala2 = case f.koulutusala_taso3_id when -1 then d6b.jarjestys_iscfinarrow2013 else d6c.jarjestys_iscfinarrow2013 end
	  ,jarj_isced_koulala3 = d6c.jarjestys_iscfi2013
	  --,d6.jarjestys_OKM_ohjauksen_ala as jarj_isced_okmohjaus1

  FROM [VipunenTK].[dbo].[f_alueella_tyossakayvat_toimialoittain] f
  LEFT JOIN dbo.d_mitenna_ammatti d1 on d1.id=f.mitenna_ammatti_id
  LEFT JOIN dbo.d_toimiala_tk d2 on d2.id=f.tol2008_id
  LEFT JOIN dbo.d_ika d3 on d3.id=f.ika_id
  LEFT JOIN dbo.d_koulutusluokitus d4 on d4.id=f.koulutusaste_id
  LEFT JOIN dbo.d_koulutusluokitus d4b on d4b.id=f.koulutusaste_taso2_id
  LEFT JOIN dbo.d_ammatillisen_koulutuksen_koulutuslaji d5 on d5.id=tutkintolaji_id
  LEFT JOIN dbo.d_koulutusluokitus d6 on d6.id=opintoala_id
  LEFT JOIN dbo.d_koulutusluokitus d6b on d6b.id=f.koulutusala_taso2_id
  LEFT JOIN dbo.d_koulutusluokitus d6c on d6c.id=f.koulutusala_taso3_id
  LEFT JOIN dbo.d_alueluokitus d7 on d7.id=f.tyomaakunta_id
  LEFT JOIN dbo.d_mitenna_toimiala d8 on d8.id=f.mitenna_toimiala_id





GO


USE [ANTERO]