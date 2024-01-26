USE [ANTERO]
GO

/****** Object:  View [dw].[v_amos_suoritepaatokset]    Script Date: 24.11.2023 14:11:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE OR ALTER VIEW [dw].[v_amos_suoritepaatokset] AS

SELECT
	[Koulutuksen järjestäjä]
	,[Y-tunnus]
	,[Koul. järj. omistajatyyppi] = [Omistajatyyppi]
	,[Vuosi]
	,[Suoritepäätöksen tyyppi]
	,[Suoritepäätös]
	,[Talousarvio]
	,[Työvoimakoulutuksen kohdennus]
	
	,[Käyttötarkoituksen kohdennus] = d0b.selite_fi
	,[Lukumäärätieto] = d0.selite_fi
	,[Lukumäärätiedon tyyppi] = d0.lukumaaratiedon_tyyppi_fi
	,[Rahoitusosuus] = d0.rahoitusosuus_fi
	,[Vaikuttavuusrahoituksen peruste] = d0.vaikuttavuusrahoituksen_peruste_fi

	,[arvo]
	,d0.[desimaalien_lkm]
	,[raportti]

	,[Koul. järj. opetuskieli] = coalesce(d2.opetuskieli_fi, 'Tieto puuttuu')
	,[Koul. järj. kunta] = d3.kunta_fi
	,[Koul. järj. maakunta] = d3.maakunta_fi
	,[Koul. järj. hyvinvointialue] = d3.hyvinvointialue_fi
	,[Koul. järj. AVI] = d3.avi_fi
	,[Koul. järj. ELY] = d3.ely_fi

	--jarj
	,[jarjestys_suoritepaatoksen_tyyppi] =
		case left(ltrim([Suoritepäätöksen tyyppi]), 6)
			when 'varsin' then 0
			when 'ensimm' then 1
			when 'toinen' then 2
			when 'kolmas' then 3
			when 'neljäs' then 4
			else 5
		end
	,[jarjestys_suoritepaatos] = 
		10 * Vuosi
		+ case left(ltrim([Suoritepäätöksen tyyppi]), 6)
			when 'varsin' then 0
			when 'ensimm' then 1
			when 'toinen' then 2
			when 'kolmas' then 3
			when 'neljäs' then 4
			else 5
		end
	,[jarjestys_talousarvio] =
		case left(ltrim([Talousarvio]), 6)
			when 'varsin' then 0
			when 'ensimm' then 1
			when 'toinen' then 2
			when 'kolmas' then 3
			when 'neljäs' then 4
			else 5
		end
	,[jarjestys_kayttotarkoituksen_kohdennus] = d0b.jarjestys
	,[jarjestys_lukumaaratieto] = d0.jarjestys
	,d0.[jarjestys_lukumaaratiedon_tyyppi]
	,d0.[jarjestys_rahoitusosuus]
	,d0.[jarjestys_vaikuttavuusrahoituksen_peruste]

	,[jarjestys_opetuskieli_koodi] = coalesce(d2.opetuskieli_koodi, 'ööö')
	,d3.jarjestys_maakunta_koodi
	,d3.jarjestys_hyvinvointialue_koodi
	,d3.jarjestys_avi_koodi
	,d3.jarjestys_ely_koodi

FROM (

	SELECT
		[Koulutuksen järjestäjä]
		,[Y-tunnus]
		,[Omistajatyyppi]
		,[Vuosi]
		,[Suoritepäätöksen tyyppi]
		,[Suoritepäätös]
		,[Talousarvio] = 'Varsinainen talousarvio'
		,[Työvoimakoulutuksen kohdennus] = 'Kohdentamaton'
		,[Käyttötarkoituksen kohdennus_koodi] = 99
		,[Lukumäärätieto_koodi]
		,[arvo]
		,[raportti]
	FROM [sa].[v_sa_amos_suoritepaatos_rahoitusperusteet_ja_myonnetty_rahoitus]

	UNION ALL

	SELECT
		[Koulutuksen järjestäjä]
		,[Y-tunnus]
		,[Omistajatyyppi]
		,[Vuosi]
		,[Suoritepäätöksen tyyppi]
		,[Suoritepäätös]
		,[Talousarvio]
		,[Työvoimakoulutuksen kohdennus]
		,[Käyttötarkoituksen kohdennus_koodi]
		,[Lukumäärätieto_koodi]
		,[arvo]
		,[raportti]
	FROM [sa].[v_sa_amos_suoritepaatos_perusrahoituksen_kohdennukset]

) q

LEFT JOIN dw.d_amos_suoritepaatokset_lukumaaratieto d0 on d0.koodi = q.[Lukumäärätieto_koodi]
LEFT JOIN dw.d_amos_suoritepaatokset_kayttotarkoituksen_kohdennus d0b on d0b.koodi = q.[Käyttötarkoituksen kohdennus_koodi]
LEFT JOIN dw.d_organisaatioluokitus d1 ON d1.organisaatio_avain = 'koulutustoimija_' + q.[Y-tunnus]
LEFT JOIN dw.d_oiva_amm_jarjestaja_opetuskieli d2 ON d2.organisaatio_koodi = q.[Y-tunnus]
LEFT JOIN dw.d_alueluokitus d3 ON d3.alueluokitus_avain = 'kunta_' + d1.kunta_koodi

GO
