USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_horizon_projektit]    Script Date: 15.6.2020 17:05:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dw].[p_lataa_d_horizon_projektit] AS

TRUNCATE TABLE dw.d_horizon_projektit
INSERT INTO dw.d_horizon_projektit (	
	[acronym],
	[call],
	[coordinator],
	[coordinatorCountry],
	[ecMaxContribution],
	[endDate],
	[frameworkProgramme],
	[fundingScheme],
	[id],
	[objective],
	[programme],
	[startDate],
	[status],
	[title],
	[topics],
	[totalCost],
	[rcn],
	[pillar]
)
Select	
	[acronym],
	[call],
	[coordinator],
	[coordinatorCountry],
	[ecMaxContribution],
	[endDate],
	[frameworkProgramme],
	[fundingScheme],
	[id],
	[objective],
	[programme],
	[startDate],
	[status],
	[title],
	[topics],
	[totalCost],
	[X.U.FEFF.rcn],
	CASE 
		WHEN [programme] like 'H2020-EU.1%' THEN 'Excellent Science'
		WHEN [programme] like 'H2020-EU.2%' THEN 'Industrial Leadership'
		WHEN [programme] like 'H2020-EU.3%' THEN 'Societal Challenges'
		WHEN [programme] like 'H2020-EU.4%' THEN 'Spreading excellence and widening participation'
		WHEN [programme] like 'H2020-EU.5%' THEN 'Science with and for Society'
		WHEN [programme] like 'H2020-Euratom%' THEN 'Euratom'
		WHEN [programme] like 'H2020-EC%' THEN 'EC'
		ELSE 'Unknown'
	END AS [pillar]
FROM [ANTERO].[sa].[sa_horizon_projektit]




