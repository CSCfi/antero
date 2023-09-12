USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_poistuma]    Script Date: 12.9.2023 10:01:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[v_f_tab_poistuma] AS

SELECT 
	tilastovuosi AS Tilastovuosi,
	ennustevuosi AS Ennustevuosi,
	d5.ika as 'Ikä ennustevuonna',
	f.ika_int + tilastovuosi - ennustevuosi  as 'Ikä tilastovuonna',
	d1.mitenna_ammattiryhma2 as 'Ammattiryhmä',
	d2.mitenna_toimiala1 as 'Toimiala',
	f.tyolliset,
	f.kuolleisuus,
	f.tyokyvyttomyys,
	f.vanhuuselake,
	f.poistuma
FROM [VipunenTK].[dbo].[f_poistuma] f
LEFT JOIN (SELECT DISTINCT mitenna_ammattiryhma2_koodi, mitenna_ammattiryhma2 FROM VipunenTK.dbo.d_mitenna_ammatti) d1 on d1.mitenna_ammattiryhma2_koodi = f.mitenna_ammattiryhma2_koodi
LEFT JOIN (SELECT DISTINCT mitenna_toimiala1_koodi, mitenna_toimiala1 FROM VipunenTK.dbo.d_mitenna_toimiala) d2 on d2.mitenna_toimiala1_koodi = f.mitenna_toimiala1_koodi
LEFT JOIN VipunenTK.dbo.d_ika d5 on d5.ika_int=f.ika_int
WHERE NOT (f.poistuma = 0 and f.tyolliset = 0)

GO
		
USE [ANTERO]