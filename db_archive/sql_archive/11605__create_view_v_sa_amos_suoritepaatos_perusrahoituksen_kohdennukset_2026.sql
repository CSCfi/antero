USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [sa].[v_sa_amos_suoritepaatos_perusrahoituksen_kohdennukset_2026] AS

SELECT 
	[Koulutuksen järjestäjä]
	,[Omistajatyyppi]
	,[Y-tunnus]
	,[Vuosi]
	,[Suoritepäätöksen tyyppi]
	,[Suoritepäätös]
	,[Talousarvio]
	,[Käyttötarkoituksen kohdennus]

	,[Lukumäärätieto_koodi] = (
		select koodi 
		from [dw].[d_amos_suoritepaatokset_lukumaaratieto_2026]
		where selite_fi = 'Harkinnanvarainen rahoitus, €'
	)
	,[arvo] = [Harkinnanvarainen rahoitus, €]
	,[raportti] = 'perusrahoituksen_kohdennukset'

FROM [sa].[sa_amos_suoritepaatos_perusrahoituksen_kohdennukset_2026]
	
WHERE [Harkinnanvarainen rahoitus, €] != 0.00000

GO
