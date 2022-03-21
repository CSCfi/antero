USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_horizon]   ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_horizon]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_horizon] AS' 
END
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
	ecContribution
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
	ecContribution
FROM [ANTERO].[sa].[sa_horizon_organisaatioiden_rahoitus]


