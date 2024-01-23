USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_alueella_tyossakayvat_ika1v]    Script Date: 23.1.2024 15:44:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO












CREATE OR ALTER VIEW [dbo].[v_f_tab_alueella_tyossakayvat_ika1v] AS

SELECT [Tilastovuosi] = [tilv]
      ,[lkm]
      ,[Ammattiryhmä 1. taso (Mitenna)] = d1.mitenna_ammattiryhma1
      ,[Ammattiryhmä 2. taso (Mitenna)] = d1.mitenna_ammattiryhma2
	  ,[Ammattiryhmä 1. taso] = d9.oef_ammattiryhma1
      ,[Ammattiryhmä 2. taso] = d9.oef_ammattiryhma2
      ,[Toimiala 1. taso (Mitenna)] = d2.mitenna_toimiala1
      ,[Toimiala 2. taso (Mitenna)] = d2.mitenna_toimiala2
	  ,[Toimiala 2. taso (Tilastokeskus)] = d8.toimiala1
	  ,[Toimiala] = d10.oef_toimiala
	  ,[Äidinkieli] = d4.aidinkieli_versio1
      ,[Ikäryhmä] = d3.ika5v
	  ,[Ikä] = d3.ika
	  ,[Asuinmaakunta] = d5.maakunta
      ,[Työpaikan sijaintimaakunta] = d7.maakunta

	  --Ruotsi
	  ,[Statistikår] = [tilv]
      ,[Yrkesgrupp, nivå 1 (Mitenna)] = d1.mitenna_ammattiryhma1_SV
      ,[Yrkesgrupp, nivå 2 (Mitenna)] = d1.mitenna_ammattiryhma2_SV
	  ,[Yrkesgrupp, nivå 1] = d9.oef_ammattiryhma1_SV
      ,[Yrkesgrupp, nivå 2] = d9.oef_ammattiryhma2_SV
      ,[Bransch, nivå 1 (Mitenna)] = d2.mitenna_toimiala1_SV
      ,[Bransch, nivå 2 (Mitenna)] = d2.mitenna_toimiala2_SV
	  ,[Bransch, nivå 2 (Statistikcentralen)] = d8.toimiala1_SV
	  ,[Bransch] = d10.oef_toimiala_SV
	  ,[Modersmål] = d4.aidinkieli_versio1_SV
      ,[Åldersgrupp] = d3.ika5v_SV
	  ,[Ålder] = d3.ika_SV
	  ,[Bostadslandskap] = d5.maakunta_SV
      ,[Arbetsplatsens landskap] = d7.maakunta_SV

	  --Englanti
	  ,[Statistical year] = [tilv]
      ,[Profession group, level 1 (Mitenna)] = d1.mitenna_ammattiryhma1_EN
      ,[Profession group, level 2 (Mitenna)] = d1.mitenna_ammattiryhma2_EN
	  ,[Profession group, level 1] = d9.oef_ammattiryhma1_EN
      ,[Profession group, level 2] = d9.oef_ammattiryhma2_EN
      ,[Industry, level 1 (Mitenna)] = d2.mitenna_toimiala1_EN
      ,[Industry, level 2 (Mitenna)] = d2.mitenna_toimiala2_EN
	  ,[Industry, level 2 (Statistics Finland)] = d8.toimiala1_EN
	  ,[Industry] = d10.oef_toimiala_EN
	  ,[Mother tongue] = d4.aidinkieli_versio1_EN
      ,[Age group] = d3.ika5v_EN
	  ,[Age] = d3.ika_EN
	  ,[Region of residence] = d5.maakunta_EN
      ,[Region where the job is located] = d7.maakunta_EN

	  --koodimuuttujat
	  ,[Koodit Työpaikan maakunta] = d7.maakunta_koodi

	  --järjestyskentät
	  ,[Ammattiryhmä 1. taso järj (Mitenna)] = d1.jarjestys_ammattiryhma1
      ,[Ammattiryhmä 2. taso järj (Mitenna)] = d1.jarjestys_ammattiryhma2
	  ,[Ammattiryhmä 1. taso järj] = d9.jarjestys_ammattiryhma1
      ,[Ammattiryhmä 2. taso järj] = d9.jarjestys_ammattiryhma2
      ,[Toimiala 1. taso järj (Mitenna)] = d2.jarjestys_mitenna_toimiala1
      ,[Toimiala 2. taso järj (Mitenna)] = d2.jarjestys_mitenna_toimiala2
	  ,[Toimiala TK 2. taso järj] = d8.jarjestys_toimiala1
	  ,[Toimiala järj] = d10.jarjestys_oef_toimiala
	  ,[Äidinkieli järj] = d4.jarjestys
      ,[Ikäryhmä järj] = d3.jarjestys_ika5v
	  ,[Ikä järj] = d3.jarjestys_ika
	  ,[Asuinmaakunta järj] = d5.jarjestys_maakunta
      ,[Työpaikan sijaintimaakunta järj] = d7.jarjestys_maakunta


  FROM [VipunenTK].[dbo].[f_alueella_tyossakayvat_1v] f
  LEFT JOIN dbo.d_mitenna_ammatti d1 on d1.id=f.mitenna_ammatti_id
  LEFT JOIN dbo.d_mitenna_toimiala d2 on d2.id=f.mitenna_toimiala_id
  LEFT JOIN dbo.d_ika d3 on d3.id=f.ika_id
  LEFT JOIN dbo.d_aidinkieli_versio1 d4 on d4.id=f.aikielir1_id
  LEFT JOIN dbo.d_alueluokitus d5 on d5.id=f.asuinmaakunta_id
  LEFT JOIN dbo.d_alueluokitus d7 on d7.id=f.tyomaakunta_id
  LEFT JOIN dbo.d_toimiala_tk d8 on d8.id=f.tol2008_2_id

  LEFT JOIN VipunenTK.dbo.d_oef_ammatti d9 on d9.id=f.oef_ammatti_id
  LEFT JOIN VipunenTK.dbo.d_oef_toimiala d10 on d10.id=f.oef_toimiala_id








GO


