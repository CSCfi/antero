USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_Tutkintoennusteaineisto_aloittaneet]    Script Date: 13.7.2023 14:24:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dbo].[v_f_Tutkintoennusteaineisto_aloittaneet] AS

SELECT 
	Tilastovuosi,
	[Koulutusala, taso 3],
	[koulutusala_koodi],
	[Ennusteen koulutusaste],
	CASE	
		WHEN [Ennusteen koulutusaste] = 'Ammatillinen koulutus' THEN 1
		WHEN[Ennusteen koulutusaste] = 'Ammattikorkeakoulukoulutus' THEN 2
		ELSE 3
	END as ennusteen_koulutusaste_koodi,
	koulutustyyppi as Koulutustyyppi,
	[Ikä] as 'Ikäryhmä',
	Aloit2,
	Koulutusaste_taso2 as [Koulutusaste, taso 2]
FROM [VipunenTK].[dbo].[f_Tutkintoennuste]
WHERE Aloit2 is not null

GO

USE [ANTERO]
