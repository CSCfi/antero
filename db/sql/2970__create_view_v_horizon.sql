USE [ANTERO]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


DROP view if exists [dw].[v_horizon] 
GO
CREATE view [dw].[v_horizon] AS

SELECT
	-- Organisaatiomuuttujat
	[name] AS 'Organisaatio',
	shortName AS 'Organisaation lyhenne',
	d1.Organisaatiotyyppi,
	[role] AS 'Organisaatiorooli',
	d2.Maa AS 'Organisaation sijaintimaa',
	endOfParticipation AS 'Keskeyttänyt projektin',

	-- Projektimuuttujat
	d3.title AS 'Projekti',
	projectAcronym AS 'Projektin lyhenne',
	d3.[status] AS 'Status',
	d3.[call] AS 'Call-tunnus',
	d3.topics AS 'Topic-tunnus',
	d3.objective AS 'Päämäärä',
	d3.coordinator AS 'Koordinaattori',
	d4.Maa AS 'Koordinaattorimaa',
	d3.fundingScheme AS 'Rahoitusohjelma',
	d3.frameworkProgramme AS 'Puiteohjelma',
	d3.programme AS 'Ohjelma',
	
	-- Aikamuuttujat
	d3.startDate AS 'Projektin alkamispäivämäärä',
	d3.endDate AS 'Projektin päättymispäivämäärä',

	-- Lukumäärämuuttujat
	ecContribution AS 'Rahoitus',

	-- Koodimuuttujat
	projectRcn AS 'Projektin RCN-koodi',
	projectID AS 'Projekti-ID',
	f.id AS 'OID'
		 
FROM [dw].[f_horizon] f
left join [dw].[d_horizon_organisaatiotyyppikoodit] d1 on d1.organisaatiotyyppi_koodi = f.activityType
left join [dw].[d_horizon_maakoodit] d2 on d2.eu_koodi = f.country
left join [dw].[d_horizon_projektit] d3 on d3.id = f.projectID
left join (
	SELECT d.coordinatorCountry, d.id, d1.Maa FROM [dw].[d_horizon_projektit] d
	left join [dw].[d_horizon_maakoodit] d1 on d1.eu_koodi = d.coordinatorCountry) d4 on f.projectID = d4.id