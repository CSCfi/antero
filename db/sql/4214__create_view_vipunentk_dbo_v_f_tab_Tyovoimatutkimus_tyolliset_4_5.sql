USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_Tyovoimatutkimus_tyolliset_4_5]    Script Date: 8.1.2021 10:48:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

DROP view if exists [dbo].[v_f_tab_Tyovoimatutkimus_tyolliset_4_5]

GO

CREATE view [dbo].[v_f_tab_Tyovoimatutkimus_tyolliset_4_5] as

Select
	-- Aikamuuttujat
	[Tilastovuosi] = f.tilastovuosi,

	-- Henkilömuuttujat
	[Sukupuoli] = d1.sukupuoli,

	[Ammattiluokitus (2001)] = d2.ammattiluokitus_2001,
	[Ammattiluokitus, päätaso] = d3.ammattiluokitus_2010_paataso,
	[Ammattiluokitus, taso 2] = d3.ammattiluokitus_2010_2_taso,
	[Ammattiluokitus, taso 3] = d3.ammattiluokitus_2010_3_taso,
	[Ammattiluokitus, taso 4] = d3.ammattiluokitus_2010_4_taso,
	
	-- Työssäkäyntimuuttujat
	[Toimiala] = d4.toimiala_2008,

	-- Lukumäärämuuttujat
	lkm = f.lkm,
 
	-- Järjestyskentät
	[Jarjestys_toimiala] = d4.jarjestys,
	[Jarjestys_sukupuoli] = d1.jarjestys,
	[Jarjestys_ammattiluokitus_2001] = d2.jarjestys,
	[Jarjestys_ammattiluokitus_paataso_2010] = d3.jarjestys_ammattiluokitus_2010_paataso,
	[Jarjestys_ammattiluokitus_taso2_2010] = d3.jarjestys_ammattiluokitus_2010_taso2,
	[Jarjestys_ammattiluokitus_taso3_2010] = d3.jarjestys_ammattiluokitus_2010_taso3,
	[Jarjestys_ammattiluokitus_taso4_2010] = d3.jarjestys_ammattiluokitus_2010_taso4
      
FROM [dbo].[f_4_5_Tyovoimatutkimus_tyolliset] f

LEFT JOIN [dbo].[d_sukupuoli] d1 ON d1.id = f.sukupuoli_id
LEFT JOIN [dbo].[d_ammattiluokitus_2001] d2 ON d2.id = f.ammattiluokitus_2001_id
LEFT JOIN [dbo].[d_ammattiluokitus_2010] d3 ON d3.id = f.ammattiluokitus_2010_id
LEFT JOIN [dbo].[d_toimiala_2008] d4 ON d4.id = f.toimiala_2008_id

GO

USE [ANTERO]