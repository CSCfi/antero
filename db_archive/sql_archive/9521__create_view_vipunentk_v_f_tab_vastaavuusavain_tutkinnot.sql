USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_vastaavuusavain]    Script Date: 19.1.2024 10:28:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[v_f_tab_vastaavuusavain_tutkinnot] AS

SELECT DISTINCT
	tilastovuosi as Tilastovuosi,
	CASE 
		WHEN d.Koulutusaste_taso2 = 'Ammattikorkeakoulututkinto' THEN 'Ammattikorkeakoulukoulutus'
		WHEN d.Koulutusaste_taso2 like '%korkeakoulu%' THEN 'Yliopistokoulutus'
		WHEN d.Koulutusaste_taso2 = 'Ammatillinen peruskoulutus' THEN 'Ammatillinen koulutus'
		ELSE d.Koulutusaste_taso2
	END as Koulutusaste,
	d.iscfi2013 as Koulutusala,
	f.ika_int as 'Ikä',
	d2.ika5v as 'Ikäryhmä I',
	CASE 
		WHEN f.ika_int BETWEEN 15 and 34 THEN '15-34' 
		ELSE '35-64' 
	END as 'Ikäryhmä II',
	tutkinnot as tutk2
FROM VipunenTK.dbo.f_vastaavuusavain_tutkinnot f
LEFT JOIN VipunenTK.dbo.d_koulutusluokitus d on d.id = f.d_koulutusluokitus_id
LEFT JOIN VipunenTK.dbo.d_ika d2 on d2.ika_int = f.ika_int

GO

USE [ANTERO]
