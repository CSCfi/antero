USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_horizon]    Script Date: 25.10.2021 9:02:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_horizon] AS

TRUNCATE TABLE dw.f_horizon
INSERT INTO dw.f_horizon (	
	projectRcn,
	projectID,
	id,
	projectAcronym,
	[name],
	shortName,
	[role],
	activityType,
	endOfParticipation,
	country,
	ecContribution,
	[loadtime],
	[username]
)
Select	
	projectRcn,
	projectID,
	id,
	projectAcronym,
	[name],
	shortName,
	[role],
	activityType,
	endOfParticipation,
	country,
	ecContribution,
	getdate(),
	suser_name()
FROM [ANTERO].[sa].[sa_horizon_organisaatioiden_rahoitus]



GO


