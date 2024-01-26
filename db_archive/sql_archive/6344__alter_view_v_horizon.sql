USE [ANTERO]
GO

/****** Object:  View [dw].[v_horizon]    Script Date: 12.8.2022 13:31:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER view [dw].[v_horizon] AS

SELECT

	-- Organisaatiomuuttujat
	CASE 
		WHEN ([name] = 'Unknown' or [name] is null) and shortName != 'Unknown' and shortName is not null THEN shortName
		ELSE coalesce([name], 'Missing data') 
	END AS 'Organisation',

	CASE 
		WHEN ([shortName] = 'Unknown' or shortName is null) and [name] != 'Unknown' and [name] is not null THEN [name]
		ELSE coalesce(shortName , 'Missing data')
	END AS 'Organisation acronym',

	coalesce(d1.Organisaatiotyyppi, 'Missing data') AS 'Organisation type',
	[role] AS 'Organisation role',
	coalesce(d2.Maa, 'Missing data') AS 'Country',
	endOfParticipation AS 'End of participation',

	-- Projektimuuttujat
	d3.title AS 'Project',
	projectAcronym AS 'Project acronym',
	d3.[status] AS 'Status',
	coalesce(d3.objective, 'Missing data') AS 'Objective',
	d3.coordinator AS 'Coordinator',
	coalesce(d4.Maa, 'Missing data') AS 'Coordinator country',
	coalesce(d7.Rahoitusohjelma, 'Missing data') AS 'Funding scheme',
	coalesce(d3.frameworkProgramme, 'H2020') AS 'Framework program',
	coalesce(d6.[Ohjelman lyhenne], 'Unknown') AS 'Program',
	coalesce(d5.Pilari, 'Unknown') AS 'Pillar',
	coalesce(d8.Topic, 'Unknown') AS 'Topic',
	
	-- Aikamuuttujat
	coalesce(d3.startDate, 'Missing data') AS 'Start date',
	coalesce(d3.endDate, 'Missing data') AS 'End date',
	coalesce(cast(year(d3.startDate) as nvarchar), 'Missing data') AS 'Start year',
	coalesce(cast(year(d3.endDate) as nvarchar), 'Missing data') AS 'End year',

	-- Lukumäärämuuttujat
	coalesce(ecContribution, 0) as ecContribution,

	-- Koodimuuttujat
	coalesce(d3.[call], '-1') AS 'Call ID',
	coalesce(d3.topics, '-1') AS 'Topic ID',
	coalesce(d3.rcn, '-1') AS 'Project RCN',
	coalesce(d3.id, '-1') AS 'Project ID',
	coalesce(f.id, '-1') AS 'OID',
	coalesce(d3.fundingScheme, '-1') AS 'Codes Funding scheme',
	coalesce(d3.programme, '-1') AS 'Codes Program',

	-- Järjestysmuuttujat

	CASE
		WHEN [name] = 'Unknown' THEN 'ÖÖÖ' 
		WHEN ([name] = 'Unknown' or [name] is null) and shortName != 'Unknown' and shortName is not null THEN shortName
		ELSE coalesce([name], 'ÖÖÄ') 
	END AS jarjestys_organisation,

	CASE 
		WHEN [shortName] = 'Unknown' THEN 'ÖÖÖ'
		WHEN ([shortName] = 'Unknown' or shortName is null) and [name] != 'Unknown' and [name] is not null THEN [name]
		ELSE coalesce(shortName , 'ÖÖÄ')
	END AS jarjestys_organisation_acronym,

	CASE WHEN d1.Organisaatiotyyppi is null THEN 'ÖÖÖ' ELSE d1.Organisaatiotyyppi END jarjestys_organisation_type,
	CASE WHEN f.country = 'FI' THEN 'AAA' WHEN d2.Maa is null THEN 'ÖÖÖ' ELSE d2.Maa END jarjestys_country,
	CASE WHEN d4.eu_koodi = 'FI' THEN 'AAA' WHEN d4.Maa is null THEN 'ÖÖÖ' ELSE d4.Maa END jarjestys_coordinator_country,
	CASE WHEN d3.startDate is null THEN 9999 ELSE 9999 - year(d3.startDate) END AS jarjestys_start_year,
	CASE WHEN d3.endDate is null THEN 9999 ELSE 9999 - year(d3.endDate) END AS jarjestys_end_year
FROM [dw].[f_horizon] f
left join [dw].[d_horizon_organisaatiotyyppikoodit] d1 on d1.organisaatiotyyppi_koodi = f.activityType
left join [dw].[d_horizon_maakoodit] d2 on d2.eu_koodi = f.country
left join [dw].[d_horizon_projektit] d3 on d3.id = f.projectID
left join (
	SELECT d.coordinatorCountry, d.id, d1.Maa, d1.eu_koodi FROM [dw].[d_horizon_projektit] d
	left join [dw].[d_horizon_maakoodit] d1 on d1.eu_koodi = d.coordinatorCountry) d4 on f.projectID = d4.id
left join [dw].[d_horizon_pilari] d5 on d5.ohjelma_koodi = substring(d3.programme,1,len(d5.ohjelma_koodi))
left join [dw].[d_horizon_ohjelma] d6 on d6.ohjelma_koodi = d3.programme
left join [dw].[d_horizon_rahoitusohjelma] d7 on d7.rahoitusohjelma_koodi = d3.fundingScheme
left join [dw].[d_horizon_topic] d8 on d8.topic_koodi = d3.topics
WHERE d3.frameworkProgramme <> 'FP6'


GO

USE [ANTERO]