USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_Tutkintoennusteaineisto_moninkertainen_koulutus]    Script Date: 7.4.2026 8.33.35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   VIEW [dbo].[v_f_Tutkintoennusteaineisto_moninkertainen_koulutus] AS

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
	[Myöhempi tutkinto],
	alkuperaisen_tutkinnon_suorittaneet,
	myohemman_tutkinnon_suorittaneet,
	Koulutusaste_taso2 as [Koulutusaste, taso 2],
	[Äidinkieli],
	CASE WHEN [Äidinkieli] in ('suomi (sis. saame)','ruotsi') THEN 0 ELSE 1 END as muunkielinen
FROM [VipunenTK].[dbo].[f_Tutkintoennuste]
WHERE alkuperaisen_tutkinnon_suorittaneet is not null or myohemman_tutkinnon_suorittaneet is not null