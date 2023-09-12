USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_poistuma_elakkeelle_siirtyneet_ja_kuolleet]    Script Date: 12.9.2023 10:02:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[v_f_tab_poistuma_elakkeelle_siirtyneet_ja_kuolleet] AS

SELECT 
	   [Tilastovuosi] = tilv
	  ,[Ikä] = d5.ika
	  ,[Eläkelaji] = d6.elakkeelle_siirtynyt_tai_kuollut
	  ,[Ammattiryhmä] = d1.mitenna_ammattiryhma2
      ,SUM([lkm_yht]) as lkm
FROM [VipunenTK].[dbo].[f_elakkeelle_siirtyneet_ja_kuolleet] f
LEFT JOIN VipunenTK.dbo.d_mitenna_ammatti d1 on d1.id=f.mitenna_ammatti_id
LEFT JOIN VipunenTK.dbo.d_tietojen_ajankohta d2 on d2.id=f.tietojen_ajankohta_id
LEFT JOIN VipunenTK.dbo.d_ika d5 on d5.id=f.ika_id
LEFT JOIN VipunenTK.dbo.d_elakkeelle_siirtynyt_tai_kuollut d6 on d6.id=f.elakkeelle_siirtynyt_tai_kuollut_id
WHERE d2.tietojen_ajankohta = '1v aiemmin' and d6.elakkeelle_siirtynyt_tai_kuollut in ('Työkyvyttömyyseläke (sis. työuraeläkkeen)', 'Vanhuuseläke', 'Kuollut')
GROUP BY tilv,d5.ika,d6.elakkeelle_siirtynyt_tai_kuollut,d1.mitenna_ammattiryhma2


GO
		
USE [ANTERO]