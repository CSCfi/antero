USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_Tutkintoennusteaineisto_tutkinnot]    Script Date: 7.4.2026 8.34.17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER   VIEW [dbo].[v_f_Tutkintoennusteaineisto_tutkinnot] AS

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
	Koulutusaste_taso2 as [Koulutusaste, taso 2],
	[Äidinkieli],
	CASE WHEN [Äidinkieli] in ('suomi (sis. saame)','ruotsi') THEN 0 ELSE 1 END as muunkielinen
FROM [VipunenTK].[dbo].[f_Tutkintoennuste]
WHERE tutkinnot is not null