USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_elakkeelle_siirtyneet_ja_kuolleet]    Script Date: 17.1.2024 13:43:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO














ALTER VIEW [dbo].[v_f_tab_elakkeelle_siirtyneet_ja_kuolleet] AS

SELECT
	   [Tilastovuosi] = tilv
	   ,[Tietojen ajankohta] = d2.tietojen_ajankohta

      ,[Sukupuoli] = d3.sukupuoli
      ,[Äidinkieli] = d4.aidinkieli_versio1
      ,[Ikäryhmä] = d5.ika5v
	  ,[Ikä] = d5.ika
	  ,[Eläkelaji] = d6.elakkeelle_siirtynyt_tai_kuollut
      ,[Eläkkeelle siirtynyt tai kuollut] = d6.elakkeelle_siirtynyt_tai_kuollut_ryhma
      ,[Pääasiallinen toiminta] = d7.paaasiallinen_toiminta
      
	  ,[Ammattiryhmä 1. taso] = d10.oef_ammattiryhma1
      ,[Ammattiryhmä 2. taso] = d10.oef_ammattiryhma2
	  ,[Ammattiryhmä 1. taso (Mitenna)] = d1.mitenna_ammattiryhma1
	  ,[Ammattiryhmä 2. taso (Mitenna)] = d1.mitenna_ammattiryhma2
	  ,[Työpaikan maakunta] = d9.maakunta
      
      ,[lkm_yht]
      ,[lkm_elakkeelle_siirtyneet]
      ,[lkm_kuolleet]

	  ,[järj Sukupuoli] = d3.jarjestys
      ,[järj Äidinkieli] = d4.jarjestys
      ,[järj Ikäryhmä] = d5.jarjestys_ika5v
	  ,[järj Eläkelaji] = d6.jarjestys
      ,[järj Pääasiallinen toiminta] = d7.jarjestys
	  ,[järj Ammattiryhmä 1. taso] = d10.jarjestys_ammattiryhma1
      ,[järj Ammattiryhmä 2. taso] = d10.jarjestys_ammattiryhma2
      ,[järj Ammattiryhmä 1. taso (Mitenna)] = d1.jarjestys_ammattiryhma1
	  ,[järj Ammattiryhmä 2. taso (Mitenna)] = d1.jarjestys_ammattiryhma2
	  ,[järj Työpaikan maakunta] = d9.jarjestys_maakunta

  FROM [VipunenTK].[dbo].[f_elakkeelle_siirtyneet_ja_kuolleet] f
  LEFT JOIN VipunenTK.dbo.d_mitenna_ammatti d1 on d1.id=f.mitenna_ammatti_id
  LEFT JOIN VipunenTK.dbo.d_tietojen_ajankohta d2 on d2.id=f.tietojen_ajankohta_id
  LEFT JOIN VipunenTK.dbo.d_sukupuoli d3 on d3.id=f.sukupuoli_id
  LEFT JOIN VipunenTK.dbo.d_aidinkieli_versio1 d4 on d4.id=f.aidinkieli_versio1_id
  LEFT JOIN VipunenTK.dbo.d_ika d5 on d5.id=f.ika_id
  LEFT JOIN VipunenTK.dbo.d_elakkeelle_siirtynyt_tai_kuollut d6 on d6.id=f.elakkeelle_siirtynyt_tai_kuollut_id
  LEFT JOIN VipunenTK.dbo.d_paaasiallinen_toiminta d7 on d7.id=f.paaasiallinen_toiminta_id
  LEFT JOIN VipunenTK.dbo.d_alueluokitus d9 on d9.id=f.alueluokitus_id
  LEFT JOIN VipunenTK.dbo.d_oef_ammatti d10 on d10.id=f.oef_ammatti_id














GO


