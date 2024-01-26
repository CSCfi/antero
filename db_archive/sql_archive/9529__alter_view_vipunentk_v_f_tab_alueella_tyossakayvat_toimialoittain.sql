USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_alueella_tyossakayvat_toimialoittain]    Script Date: 23.1.2024 15:01:44 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











CREATE OR ALTER VIEW [dbo].[v_f_tab_alueella_tyossakayvat_toimialoittain] AS

SELECT [Tilastovuosi] = [tilv]
      ,[lkm]
      ,[Ammattiryhm� 1. taso (Mitenna)] = d1.mitenna_ammattiryhma1
      ,[Ammattiryhm� 2. taso (Mitenna)] = d1.mitenna_ammattiryhma2
	  ,[Ammattiryhm� 1. taso] = d9.oef_ammattiryhma1
      ,[Ammattiryhm� 2. taso] = d9.oef_ammattiryhma2
      ,[Toimiala 1. taso (Mitenna)] = d8.mitenna_toimiala1
      ,[Toimiala 2. taso (Mitenna)] = d8.mitenna_toimiala2
      ,[Toimiala Tilastokeskus] = d2.toimiala1
	  ,[Toimiala] = d10.oef_toimiala
      ,[Ik�ryhm�] = d3.ika5v
      ,[Koulutusaste] = d4.koulutusaste2002
	  ,[Koulutusaste, taso 1] = d4b.iscle2011
	  ,[Koulutusaste, taso 2] = d4b.Koulutusaste_taso2
	  ,[Koulutusala, taso 1] = case f.koulutusala_taso3_id when -1 then d6b.iscfibroad2013 else d6c.iscfibroad2013 end
	  ,[Koulutusala, taso 2] = case f.koulutusala_taso3_id when -1 then d6b.iscfinarrow2013 else d6c.iscfinarrow2013 end
	  ,[Koulutusala, taso 3] = d6c.iscfi2013
	  ,[Ammatillisen koulutuksen koulutuslaji] = d5.ammatillisen_koulutuksen_koulutuslaji
      ,[Opintoala] = d6.opintoala2002
	  ,[Koulutusala] = d6.koulutusala2002
      ,[Ty�paikan sijaintimaakunta] = d7.maakunta

	  --Ruotsi
	  ,[Statistik�r] = [tilv]
      ,[Yrkesgrupp, niv� 1 (Mitenna)] = d1.mitenna_ammattiryhma1_SV
      ,[Yrkesgrupp, niv� 2 (Mitenna)] = d1.mitenna_ammattiryhma2_SV
	  ,[Yrkesgrupp, niv� 1] = d9.oef_ammattiryhma1_SV
      ,[Yrkesgrupp, niv� 2] = d9.oef_ammattiryhma2_SV
      ,[Bransch, niv� 1 (Mitenna)] = d8.mitenna_toimiala1_SV
      ,[Bransch, niv� 2 (Mitenna)] = d8.mitenna_toimiala2_SV
      ,[Bransch (Statistikcentralen)] = d2.toimiala1_SV
	  ,[Bransch] = d10.oef_toimiala_SV
      ,[�ldersgrupp] = d3.ika5v_SV
      ,[Utbildningsniv�] = d4.koulutusaste2002_SV
	  ,[Utbildningsniv�, niv� 1] = d4b.iscle2011_SV
	  ,[Utbildningsniv�, niv� 2] = d4b.Koulutusaste_taso2_SV
	  ,[Utbildningsomr�de, niv� 1] = case f.koulutusala_taso3_id when -1 then d6b.iscfibroad2013_SV else d6c.iscfibroad2013_SV end
	  ,[Utbildningsomr�de, niv� 2] = case f.koulutusala_taso3_id when -1 then d6b.iscfinarrow2013_SV else d6c.iscfinarrow2013_SV end
	  ,[Utbildningsomr�de, niv� 3] = d6c.iscfi2013_SV
	  ,[Utbildningsslag] = d5.ammatillisen_koulutuksen_koulutuslaji_SV
      ,[Studieomr�de] = d6.opintoala2002_SV
	  ,[Utbildningsomr�de] = d6.koulutusala2002_SV
      ,[Arbetsplatsens landskap] = d7.maakunta_SV

	  --Englanti
	  ,[Statistical year] = [tilv]
      ,[Profession group, level 1 (Mitenna)] = d1.mitenna_ammattiryhma1_EN
      ,[Profession group, level 2 (Mitenna)] = d1.mitenna_ammattiryhma2_EN
	  ,[Profession group, level 1] = d9.oef_ammattiryhma1_EN
      ,[Profession group, level 2] = d9.oef_ammattiryhma2_EN
      ,[Industry, level 1 (Mitenna)] = d8.mitenna_toimiala1_EN
      ,[Industry, level 2 (Mitenna)] = d8.mitenna_toimiala2_EN
      ,[Industry (Statistics Finland)] = d2.toimiala1_EN
	  ,[Industry] = d10.oef_toimiala_EN
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
	  ,d7.maakunta_koodi as "Koodit Ty�paikan maakunta"
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
	  ,d6.iscle2011_SV as "Utbildn.niv�, niv� 1"
	  ,d6.Koulutusaste_taso2_SV as "Utbildn.niv�, niv� 2"
	  ,d6.iscfibroad2013_SV as "Utbildn.omr�de, niv� 1"
	  ,d6.iscfinarrow2013_SV as "Utbildn.omr�de, niv� 2"
	  ,d6.iscfi2013_SV as "Utbildn.omr�de, niv� 3"
	  ,d6.OKM_ohjauksen_ala_SV as "UKM-styrningsomr�de, h�gskolor"
	  ,d6.iscle2011_EN as "Level of education, tier 1"
	  ,d6.Koulutusaste_taso2_EN as "Level of education, tier 2"
	  ,d6.iscfibroad2013_EN as "Field of education, tier 1"
	  ,d6.iscfinarrow2013_EN as "Field of education, tier 2"
	  ,d6.iscfi2013_EN as "Field of education, tier 3"
	  ,d6.OKM_ohjauksen_ala_EN as "Field of ed., HE steering"
*/
	  --j�rjestyskent�t
	  ,[Ammattiryhm� 1. taso j�rj (Mitenna)] = d1.jarjestys_ammattiryhma1
      ,[Ammattiryhm� 2. taso j�rj (Mitenna)] = d1.jarjestys_ammattiryhma2
	  ,[Ammattiryhm� 1. taso j�rj] = d9.jarjestys_ammattiryhma1
      ,[Ammattiryhm� 2. taso j�rj] = d9.jarjestys_ammattiryhma2
      ,[Toimiala 1. taso j�rj (Mitenna)] = d8.jarjestys_mitenna_toimiala1
      ,[Toimiala 2. taso j�rj (Mitenna)] = d8.jarjestys_mitenna_toimiala2
      ,[Toimiala Tilastokeskus j�rj] = d2.jarjestys_toimiala1
	  ,[Toimiala j�rj] = d10.jarjestys_oef_toimiala
      ,[Ik�ryhm� j�rj] = d3.jarjestys_ika5v
      ,[Koulutusaste j�rj] = d4.jarjestys_koulutusaste2002
	  ,[Ammatillisen_koulutuksen_koulutuslaji j�rj] = d5.jarjestys
      ,[Opintoala j�rj] = d6.jarjestys_opintoala2002
	  ,[Koulutusala j�rj] = d6.jarjestys_koulutusala2002
      ,[Ty�paikan sijaintimaakunta j�rj] = d7.jarjestys_maakunta
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

  LEFT JOIN VipunenTK.dbo.d_oef_ammatti d9 on d9.id=f.oef_ammatti_id
  LEFT JOIN VipunenTK.dbo.d_oef_toimiala d10 on d10.id=f.oef_toimiala_id






GO


