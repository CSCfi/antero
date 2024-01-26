USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_toimialaennuste]    Script Date: 19.12.2023 14:16:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER   VIEW [dbo].[v_f_tab_toimialaennuste] AS

SELECT 
	t.[oef_toimiala_koodi] as Toimiala_koodi,
	d.oef_toimiala as Toimiala,
    [tilastovuosi] as Tilastovuosi,
    [tyolliset] as ennuste2,
    'Perus' as Skenaario
FROM [VipunenTK_lisatiedot].[dbo].[toimialaennuste_perus] t
LEFT JOIN VipunenTK.dbo.d_oef_toimiala d on  t.oef_toimiala_koodi = d.oef_toimiala_koodi

UNION ALL

SELECT
	t.[oef_toimiala_koodi] as Toimiala_koodi,
	d.oef_toimiala as Toimiala,
    [tilastovuosi] as Tilastovuosi,
    [tyolliset] as ennuste2,
    'Maahanmuutto' as Skenaario
FROM [VipunenTK_lisatiedot].[dbo].[toimialaennuste_maahanmuutto] t
LEFT JOIN VipunenTK.dbo.d_oef_toimiala d on  t.oef_toimiala_koodi = d.oef_toimiala_koodi

UNION ALL

SELECT
	t.[oef_toimiala_koodi] as Toimiala_koodi,
	d.oef_toimiala as Toimiala,
    [tilastovuosi] as Tilastovuosi,
    [tyolliset] as ennuste2,
    'Tuottavuus' as Skenaario
FROM [VipunenTK_lisatiedot].[dbo].[toimialaennuste_tuottavuus] t
LEFT JOIN VipunenTK.dbo.d_oef_toimiala d on  t.oef_toimiala_koodi = d.oef_toimiala_koodi

GO

USE [ANTERO]