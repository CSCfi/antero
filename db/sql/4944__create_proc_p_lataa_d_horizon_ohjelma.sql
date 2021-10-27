USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_horizon_ohjelma]   ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_horizon_ohjelma]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_horizon_ohjelma] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_d_horizon_ohjelma] AS

TRUNCATE TABLE dw.d_horizon_ohjelma
INSERT INTO dw.d_horizon_ohjelma (	
	[ohjelma_koodi],
	[Ohjelma],
	[Ohjelman lyhenne],
	[rcn],
	[loadtime],
	[username]
)
Select	
	   [programme_id]
      ,coalesce(coalesce([title], [shortTitle]), 'Missing information')
      ,coalesce(coalesce([shortTitle], [title]), 'Missing information')
      ,[rcn]
	  ,getdate()
	  ,suser_name()
FROM [ANTERO].[sa].[sa_horizon_ohjelmat]


