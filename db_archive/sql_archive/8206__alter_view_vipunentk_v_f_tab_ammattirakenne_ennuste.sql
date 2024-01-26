USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_ammattirakenne_ennuste]    Script Date: 17.10.2023 9:14:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   VIEW [dbo].[v_f_tab_ammattirakenne_ennuste] AS

SELECT 
	[Tilastovuosi] = [tilv],
	[Ammattiryhmä 1. taso] = d1.mitenna_ammattiryhma1,
	[Ammattiryhmä 2. taso] = d1.mitenna_ammattiryhma2,
	[Toimiala 1. taso] = d2.mitenna_toimiala1,
	[Toimiala 2. taso] = d2.mitenna_toimiala2,
	[Ikä tilastovuonna] =f.ika,
	lkm,
	vieraskieliset_lkm
FROM [VipunenTK].[dbo].[f_ammattirakenne_ennuste] f
LEFT JOIN dbo.d_mitenna_ammatti d1 on d1.id=f.mitenna_ammatti_id
LEFT JOIN dbo.d_mitenna_toimiala d2 on d2.id=f.mitenna_toimiala_id

GO

USE [ANTERO]