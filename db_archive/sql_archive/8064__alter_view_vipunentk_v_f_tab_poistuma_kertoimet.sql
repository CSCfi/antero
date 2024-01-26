USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_poistuma_kertoimet]    Script Date: 18.9.2023 9:55:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [dbo].[v_f_tab_poistuma_kertoimet] AS

SELECT
	f.tilastovuosi as Tilastovuosi,
	f.ika_int as 'Ikä',
	d1.mitenna_ammattiryhma2 as 'Ammattiryhmä',
	coalesce(f1.kerroin,0) as 'Kerroin (vanhuuseläke)',
	coalesce(f2.kerroin,0) as 'Kerroin (työttömyyseläke)',
	coalesce(f3.kerroin,0) as 'Kerroin (kuollut)',
	f.vuodet as 'Vuosien lukumäärä' 
FROM (
	SELECT 
		DISTINCT f.tilastovuosi, f.ika_int, f.mitenna_ammattiryhma2_koodi, vuodet
	FROM [VipunenTK].[dbo].[f_poistuma_kertoimet] f
) f
LEFT JOIN (SELECT DISTINCT mitenna_ammattiryhma2_koodi, mitenna_ammattiryhma2 FROM VipunenTK.dbo.d_mitenna_ammatti d) d1 on d1.mitenna_ammattiryhma2_koodi=f.mitenna_ammattiryhma2_koodi
LEFT JOIN [VipunenTK].[dbo].[f_poistuma_kertoimet] f1 on f.ika_int = f1.ika_int and f.mitenna_ammattiryhma2_koodi = f1.mitenna_ammattiryhma2_koodi and f.tilastovuosi = f1.tilastovuosi and f1.d_elakkeelle_siirtynyt_tai_kuollut_id = 1 and f.vuodet = f1.vuodet
LEFT JOIN [VipunenTK].[dbo].[f_poistuma_kertoimet] f2 on f.ika_int = f2.ika_int and f.mitenna_ammattiryhma2_koodi = f2.mitenna_ammattiryhma2_koodi and f.tilastovuosi = f2.tilastovuosi and f2.d_elakkeelle_siirtynyt_tai_kuollut_id = 2 and f.vuodet = f2.vuodet
LEFT JOIN [VipunenTK].[dbo].[f_poistuma_kertoimet] f3 on f.ika_int = f3.ika_int and f.mitenna_ammattiryhma2_koodi = f3.mitenna_ammattiryhma2_koodi and f.tilastovuosi = f3.tilastovuosi and f3.d_elakkeelle_siirtynyt_tai_kuollut_id = 6 and f.vuodet = f3.vuodet

GO

USE [ANTERO]