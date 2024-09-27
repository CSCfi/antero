USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_arvo_amis_tep_mittarit_ohjaajakysely] AS 

SELECT DISTINCT
	[koodi]
	,[koodi_piilosuodatin] = koodi
    ,[selite_fi]
    ,[selite_sv]
    ,[selite_en]
    ,[jarjestys]

FROM [dbo].[translations]

WHERE 1=1
AND tyyppi = 'mittari'
AND koodi IN (
	--'kyselyn_kohteet_tyopaikkojen_lkm',
	'kyselyn_kohteet_tyopaikkajaksojen_lkm',
	'kyselyn_kohteet_tyopaikkajaksojen_paivien_lkm',
	--'vastattu_tyopaikkojen_lkm',
	'vastattu_tyopaikkajaksojen_lkm',
	'vastattu_tyopaikkajaksojen_paivien_lkm',
	--'vastausosuus_tyopaikkojen_lkm',
	'vastausosuus_tyopaikkajaksojen_lkm',
	'vastausosuus_tyopaikkajaksojen_paivien_lkm',
	'kyselyn_kohteiden_keskimaarainen_kesto',
	'vastattujen_tyopaikkajaksojen_keskimaarainen_kesto',
	'keskiarvo_painotettu_tyopaikkajaksojen_kestolla',
	'keskihajonta_painotettu_tyopaikkajaksojen_kestolla'
)

GO
