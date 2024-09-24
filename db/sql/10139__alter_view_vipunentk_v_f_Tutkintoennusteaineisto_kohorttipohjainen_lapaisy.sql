USE [VipunenTK]
GO

/****** Object:  View [dbo].[v_f_Tutkintoennusteaineisto_kohorttipohjainen_lapaisy]    Script Date: 23.9.2024 15:45:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER   VIEW [dbo].[v_f_Tutkintoennusteaineisto_kohorttipohjainen_lapaisy] AS

SELECT 
	Lukuvuosi,
	[Koulutusala, taso 3],
	[koulutusala_koodi],
	[Ennusteen koulutusaste],
	CASE	
		WHEN [Ennusteen koulutusaste] = 'Ammatillinen koulutus' THEN 1
		WHEN[Ennusteen koulutusaste] = 'Ammattikorkeakoulukoulutus' THEN 2
		ELSE 3
	END as ennusteen_koulutusaste_koodi,
	koulutustyyppi as Koulutustyyppi,
	coalesce([Alkuperäinen/muu tutkintolaji], 'Alkuperäinen tutkintolaji') as 'Suoritetun tutkinnon tutkintolaji',
	alkuperaisen_tutkinnon_aloittaneet,
	suoritetut_tutkinnot,
	lapaisseet,
	lapaisseet_ja_keskeyttaneet,
	Koulutusaste_taso2 as [Koulutusaste, taso 2],
	laskentalogiikka as Laskentalogiikka
FROM [VipunenTK].[dbo].[f_Tutkintoennuste]
WHERE suoritetut_tutkinnot is not null or alkuperaisen_tutkinnon_aloittaneet is not null or lapaisseet_ja_keskeyttaneet is not null

GO

USE [ANTERO]