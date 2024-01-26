USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_poistuma]    Script Date: 15.12.2023 10:37:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER   VIEW [dbo].[v_f_tab_poistuma] AS

SELECT 
	tilastovuosi AS Tilastovuosi,
	ennustevuosi AS Ennustevuosi,
	d5.ika as 'Ikä ennustevuonna',
	f.ika_int + tilastovuosi - ennustevuosi  as 'Ikä tilastovuonna',
	d1.oef_ammattiryhma2 as 'Ammattiryhmä',
	d2.oef_toimiala as 'Toimiala',
	f.tyolliset_3v,
	f.kuolleisuus_3v,
	f.tyokyvyttomyys_3v,
	f.vanhuuselake_3v,
	f.poistuma_3v,
	f.tyolliset_5v,
	f.kuolleisuus_5v,
	f.tyokyvyttomyys_5v,
	f.vanhuuselake_5v,
	f.poistuma_5v,
	f.tyolliset_7v,
	f.kuolleisuus_7v,
	f.tyokyvyttomyys_7v,
	f.vanhuuselake_7v,
	f.poistuma_7v
FROM [VipunenTK].[dbo].[f_poistuma] f
LEFT JOIN VipunenTK.dbo.d_oef_ammatti d1 on d1.id = f.d_oef_ammatti_id
LEFT JOIN VipunenTK.dbo.d_oef_toimiala d2 on d2.oef_toimiala_koodi = f.oef_toimiala_koodi
LEFT JOIN VipunenTK.dbo.d_ika d5 on d5.ika_int=f.ika_int
WHERE NOT (f.poistuma_3v = 0 and f.tyolliset_3v = 0 and f.poistuma_5v = 0 and f.tyolliset_5v = 0 and f.poistuma_7v = 0 and f.tyolliset_7v = 0)

GO

USE [ANTERO]