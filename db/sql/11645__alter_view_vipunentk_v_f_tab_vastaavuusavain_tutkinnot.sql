USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_tab_vastaavuusavain_tutkinnot]    Script Date: 10.2.2026 10.06.23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   VIEW [dbo].[v_f_tab_vastaavuusavain_tutkinnot] AS

SELECT DISTINCT
	tilastovuosi as Tilastovuosi,
	CASE 
		WHEN d.Koulutusaste_taso2 like '%mmattikorkeakoulututkinto%' THEN 'Ammattikorkeakoulukoulutus'
		WHEN d.Koulutusaste_taso2 in ('Alempi korkeakoulututkinto', 'Ylempi korkeakoulututkinto', 'Lisensiaatintutkinto', 'Tohtorintutkinto') THEN 'Yliopistokoulutus'
		WHEN d.Koulutusaste_taso2 in ('Ammatillinen peruskoulutus', 'Erikoisammattitutkinto', 'Ammattitutkinto') THEN 'Ammatillinen koulutus'
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