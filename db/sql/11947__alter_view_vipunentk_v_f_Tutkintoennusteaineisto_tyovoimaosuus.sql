USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_Tutkintoennusteaineisto_tyovoimaosuus]    Script Date: 7.4.2026 8.35.07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   VIEW  [dbo].[v_f_Tutkintoennusteaineisto_tyovoimaosuus] AS

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
	[Ikä] as [Ikäryhmä],
	CASE WHEN [Pääasiallinen toiminta] = 'Työllinen opiskelija' THEN 'Työllinen opiskelija (vain lääkärit)' ELSE COALESCE([Pääasiallinen toiminta], 'Päätoiminen työllinen') END AS [Pääasiallinen toiminta],
	tutkinnon_suorittaneet,
	tyovoima_yhteensa,
	Koulutusaste_taso2 as [Koulutusaste, taso 2],
	[Äidinkieli],
	CASE WHEN [Äidinkieli] in ('suomi (sis. saame)','ruotsi') THEN 0 ELSE 1 END as muunkielinen
FROM [VipunenTK].[dbo].[f_Tutkintoennuste]
WHERE tutkinnon_suorittaneet is not null or tyovoima_yhteensa is not null