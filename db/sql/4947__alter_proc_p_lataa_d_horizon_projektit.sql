USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_horizon_projektit]    Script Date: 25.10.2021 9:00:26 ******/
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
	[loadtime],
	[username]
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
	getdate(),
	suser_name()
FROM [ANTERO].[sa].[sa_horizon_projektit]






GO


