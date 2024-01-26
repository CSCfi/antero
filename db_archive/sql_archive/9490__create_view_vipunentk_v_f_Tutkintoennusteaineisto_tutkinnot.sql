USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_Tutkintoennusteaineisto_tutkinnot]    Script Date: 16.1.2024 13:47:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER VIEW [dbo].[v_f_Tutkintoennusteaineisto_tutkinnot] AS

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
	[ika2] as 'Ikä',
	tutkinnot as tutk2,
	Koulutusaste_taso2 as [Koulutusaste, taso 2]
FROM [VipunenTK].[dbo].[f_Tutkintoennuste]
WHERE tutkinnot is not null

GO

USE [ANTERO]