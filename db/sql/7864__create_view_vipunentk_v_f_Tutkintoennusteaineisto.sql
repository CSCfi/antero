USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_Tutkintoennusteaineisto]    Script Date: 13.7.2023 14:22:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER VIEW [dbo].[v_f_Tutkintoennusteaineisto] AS

SELECT DISTINCT
	[Koulutusala, taso 3],
	[koulutusala_koodi],
	[Ennusteen koulutusaste],
	CASE	
		WHEN [Ennusteen koulutusaste] = 'Ammatillinen koulutus' THEN 1
		WHEN[Ennusteen koulutusaste] = 'Ammattikorkeakoulukoulutus' THEN 2
		ELSE 3
	END as ennusteen_koulutusaste_koodi
FROM [VipunenTK].[dbo].[f_Tutkintoennuste]

GO

USE [ANTERO]
