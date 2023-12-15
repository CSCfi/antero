USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_ammattirakenne_ennuste]    Script Date: 15.12.2023 10:49:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





ALTER   VIEW [dbo].[v_f_tab_ammattirakenne_ennuste] AS

SELECT 
	[Tilastovuosi] = [tilv],
	[Ammattiryhmä 1. taso] = d1.oef_ammattiryhma1,
	[Ammattiryhmä 2. taso] = d1.oef_ammattiryhma2,
	[Toimiala 1. taso] = d2.oef_toimiala,
	[Toimiala 2. taso] = d2.oef_toimiala,
	[Ikä tilastovuonna] =f.ika,
	lkm,
	vieraskieliset_lkm
FROM [VipunenTK].[dbo].[f_ammattirakenne_ennuste] f
LEFT JOIN dbo.d_oef_ammatti d1 on d1.id=f.oef_ammatti_id
LEFT JOIN dbo.d_oef_toimiala d2 on d2.id=f.oef_toimiala_id

GO

USE [ANTERO]