USE [ANTERO]
GO

/****** Object:  View [dw].[v_horizon]    Script Date: 23.9.2022 14:39:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER view [dw].[v_horizon] AS

SELECT

	-- Organisaatiomuuttujat
	CASE 
		WHEN ([name] = 'Missing data' or [name] is null) and shortName != 'Missing data' and shortName is not null THEN shortName
		ELSE coalesce([name], 'Missing data') 
	END AS 'Organisation',

	CASE 
		WHEN ([shortName] = 'Missing data' or shortName is null) and [name] != 'Missing data' and [name] is not null THEN [name]
		ELSE coalesce(shortName , 'Missing data')
	END AS 'Organisation acronym',

	d1.Organisaatiotyyppi AS 'Organisation type',
	[role] AS 'Organisation role',
	d2.Maa AS 'Country',
	endOfParticipation AS 'End of participation',

	-- Projektimuuttujat
	d3.title AS 'Project',
	d3.acronym AS 'Project acronym',
	d3.[status] AS 'Status',
	coalesce(d3.objective, 'Missing data') AS 'Objective',
	d3.coordinator AS 'Coordinator',
	d7.Rahoitusohjelma AS 'Funding scheme',
	CASE 
		WHEN d3.frameworkProgramme = 'H2020' THEN 'Horizon 2020' 
		WHEN d3.frameworkProgramme = 'HORIZON' THEN 'Horizon Europe' 
		ELSE 'Other'
	END AS 'Framework program',
	d6.[Ohjelman lyhenne] AS 'Program',
	d5.Pilari AS 'Pillar',
	d8.Topic AS 'Topic',
	
	-- Aikamuuttujat
	coalesce(case when d3.startDate like '%/%' then concat(right(d3.startDate,4),'-', right(left(d3.startDate,5),2), '-', left(d3.startDate,2)) else d3.startDate end, 'Missing data') AS 'Start date',
	coalesce(case when d3.endDate like '%/%' then concat(right(d3.endDate,4),'-', right(left(d3.endDate,5),2), '-', left(d3.endDate,2)) else d3.endDate end, 'Missing data') AS 'End date',
	coalesce(case when startDate like '%/%' then right(startDate, 4) else left(startDate,4) end, 'Missing data') AS 'Start year',
	coalesce(case when endDate like '%/%' then right(endDate, 4) else left(endDate,4) end, 'Missing data') AS 'End year',

	-- Lukumäärämuuttujat
	coalesce(ecContribution, 0) as ecContribution,

	-- Koodimuuttujat
	coalesce(d3.[call], '-1') AS 'Call ID',
	coalesce(d3.topics, '-1') AS 'Topic ID',
	coalesce(d3.rcn, '-1') AS 'Project RCN',
	coalesce(d3.project_id, '-1') AS 'Project ID',
	coalesce(f.organisation_id, '-1') AS 'OID',
	coalesce(d3.fundingScheme, '-1') AS 'Codes Funding scheme',
	coalesce(d3.programme, '-1') AS 'Codes Program',

	-- Järjestysmuuttujat

	CASE
		WHEN [name] = 'Missing data' THEN 'ÖÖÖ' 
		WHEN ([name] = 'Missing data' or [name] is null) and shortName != 'Missing data' and shortName is not null THEN shortName
		ELSE coalesce([name], 'ÖÖÄ') 
	END AS jarjestys_organisation,

	CASE 
		WHEN [shortName] = 'Missing data' THEN 'ÖÖÖ'
		WHEN ([shortName] = 'Missing data' or shortName is null) and [name] != 'Missing data' and [name] is not null THEN [name]
		ELSE coalesce(shortName , 'ÖÖÄ')
	END AS jarjestys_organisation_acronym,

	CASE WHEN d1.Organisaatiotyyppi is null THEN 'ÖÖÖ' ELSE d1.Organisaatiotyyppi END jarjestys_organisation_type,
	CASE WHEN d2.eu_koodi = 'FI' THEN 'AAA' WHEN d2.id = '-1' THEN 'ÖÖÖ' ELSE d2.Maa END jarjestys_country,
	CASE WHEN d3.startDate is null THEN 9999 ELSE 9999 - cast(case when startDate like '%/%' then right(startDate, 4) else left(startDate,4) end as int) END AS jarjestys_start_year,
	CASE WHEN d3.endDate is null THEN 9999 ELSE 9999 - cast(case when endDate like '%/%' then right(endDate, 4) else left(endDate,4) end as int) END AS jarjestys_end_year
FROM [dw].[f_horizon] f
left join [dw].[d_horizon_organisaatiotyyppikoodit] d1 on d1.id = f.d_horizon_organisaatiotyyppi_id
left join [dw].[d_horizon_maakoodit] d2 on d2.id = f.d_horizon_maa_id
left join [dw].[d_horizon_projektit] d3 on d3.id = f.d_horizon_projekti_id
left join [dw].[d_horizon_pilari] d5 on d5.id = f.d_horizon_pilari_id
left join [dw].[d_horizon_ohjelma] d6 on d6.id = f.d_horizon_ohjelma_id
left join [dw].[d_horizon_rahoitusohjelma] d7 on d7.id = f.d_horizon_rahoitusohjelma_id
left join [dw].[d_horizon_topic] d8 on d8.id = f.d_horizon_topic_id
WHERE d3.frameworkProgramme <> 'FP6'



GO

USE [ANTERO]