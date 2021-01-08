USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_Tyovoimatutkimus_tyolliset_ja_tyottomat_4_6]    Script Date: 8.1.2021 11:22:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP view if exists [dbo].[v_f_tab_Tyovoimatutkimus_tyolliset_ja_tyottomat_4_6]

GO

CREATE view [dbo].[v_f_tab_Tyovoimatutkimus_tyolliset_ja_tyottomat_4_6] as

SELECT 
	-- Aikamuuttujat
	[Tilastovuosi] = f.tilastovuosi,

	-- Henkilömuuttujat
	[Sukupuoli] = d1.sukupuoli,
	[Ikäryhmä] = d4.ika5v,
	[tyovoima] = f.tyovoima,
	
	[Ammattiluokitus (2001)] = d2.ammattiluokitus_2001,
	[Ammattiluokitus, päätaso] = d3.ammattiluokitus_2010_paataso,
	[Ammattiluokitus, taso 2] = d3.ammattiluokitus_2010_2_taso,
	[Ammattiluokitus, taso 3] = d3.ammattiluokitus_2010_3_taso,
	[Ammattiluokitus, taso 4] = d3.ammattiluokitus_2010_4_taso,
	
	-- Koulutusmuuttujat
	[Koulutusaste, taso 2] = d5.Koulutusaste_taso2,
	[Koulutusaste, taso 1] = d5.iscle2011,
	[Koulutusala, taso 2] = d6.iscfinarrow2013,
	[Koulutusala, taso 1] = d6.iscfibroad2013,
	[Koulutusaste (2002)] = d7.koulutusaste2002,
	[Koulutusala (2002)] = d8.koulutusala2002,

	-- Lukumäärämuuttujat
	lkm = f.lkm,
 
	-- Järjestyskentät
	[Jarjestys_sukupuoli] = d1.jarjestys,
	[Jarjestys_ikaryhmä] = d4.jarjestys_ika5v,
	[Jarjestys_ammattiluokitus_2001] = d2.jarjestys,
	[Jarjestys_ammattiluokitus_paataso_2010] = d3.jarjestys_ammattiluokitus_2010_paataso,
	[Jarjestys_ammattiluokitus_taso2_2010] = d3.jarjestys_ammattiluokitus_2010_taso2,
	[Jarjestys_ammattiluokitus_taso3_2010] = d3.jarjestys_ammattiluokitus_2010_taso3,
	[Jarjestys_ammattiluokitus_taso4_2010] = d3.jarjestys_ammattiluokitus_2010_taso4,
  	[Jarjestys_koulutusaste_taso2] = d5.jarjestys_Koulutusaste_taso2,
	[Jarjestys_koulutusaste_taso1] = d5.jarjestys_iscle2011,
	[Jarjestys_koulutusala_taso2] = d6.jarjestys_iscfinarrow2013,
	[Jarjestys_koulutusala_taso1] = d6.jarjestys_iscfibroad2013,
	[Jarjestys_koulutusaste_2002] = d7.jarjestys_koulutusaste2002,
	[Jarjestys_koulutusala_2002] = d7.jarjestys_koulutusala2002
      
FROM [dbo].[f_4_6ab_Tyovoimatutkimus_tyolliset_ja_tyottomat] f

LEFT JOIN [dbo].[d_sukupuoli] d1 ON d1.id = f.sukupuoli_id
LEFT JOIN [dbo].[d_ammattiluokitus_2001] d2 ON d2.id = f.ammattiluokitus_2001_id
LEFT JOIN [dbo].[d_ammattiluokitus_2010] d3 ON d3.id = f.ammattiluokitus_2010_id
LEFT JOIN [dbo].[d_ika] d4 ON d4.id = f.ikaryhma_id
LEFT JOIN [dbo].[d_koulutusluokitus] d5 ON d5.id = f.koulutusaste_taso2_id
LEFT JOIN [dbo].[d_koulutusluokitus] d6 ON d6.id = f.koulutusala_taso2_id
LEFT JOIN [dbo].[d_koulutusluokitus] d7 ON d7.id = f.koulutusaste_2002_id
LEFT JOIN [dbo].[d_koulutusluokitus] d8 ON d8.id = f.koulutusala_2002_id

GO

USE [ANTERO]