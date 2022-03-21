USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_horizon_projektit]   ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_horizon_projektit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_horizon_projektit] AS' 
END
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
	[rcn]
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
	[X.U.FEFF.rcn]
FROM [ANTERO].[sa].[sa_horizon_projektit]


