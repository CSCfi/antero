USE [ANTERO]
GO

/****** Object:  View [dw].[v_horizon]    Script Date: 15.6.2020 17:29:08 ******/
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
	d3.fundingScheme AS 'Funding scheme',
	d3.frameworkProgramme AS 'Framework program',
	d3.programme AS 'Program',
	d3.pillar AS 'Pillar',
	
	-- Aikamuuttujat
	coalesce(d3.startDate, 'Missing data') AS 'Start date',
	coalesce(d3.endDate, 'Missing data') AS 'End date',
	coalesce(cast(year(d3.startDate) as nvarchar), 'Missing data') AS 'Start year',
	coalesce(cast(year(d3.endDate) as nvarchar), 'Missing data') AS 'End year',

	-- Lukumäärämuuttujat
	ecContribution,

	-- Koodimuuttujat
	d3.[call] AS 'Call ID',
	d3.topics AS 'Topic ID',
	projectRcn AS 'Project RCN',
	projectID AS 'Project ID',
	f.id AS 'OID',

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





