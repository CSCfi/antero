USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_ammattirakenne_ennuste]    Script Date: 26.1.2026 8.52.04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER  VIEW [dbo].[v_f_tab_ammatit_palkat] AS

SELECT 
	[Ammattiryhmä 2. taso] = d1.oef_ammattiryhma2,
	f.palkka as palkka2,
	d1.jarjestys_ammattiryhma2
FROM [VipunenTK_lisatiedot].[dbo].[oef_ammatit_palkat] f
LEFT JOIN dbo.d_oef_ammatti d1 on d1.oef_ammatti_koodi = f.oef_ammattiryhma2_koodi
