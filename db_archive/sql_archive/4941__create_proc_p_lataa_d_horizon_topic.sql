USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_d_horizon_topic]   ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_horizon_topic]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_horizon_topic] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_d_horizon_topic] AS

TRUNCATE TABLE dw.d_horizon_topic
INSERT INTO dw.d_horizon_topic (	
	[topic_id],
	[topic_koodi],
	[Topic],
	[call],
	[rcn],
	[loadtime],
	[username]
)
Select	
	   [topic_id]
      ,[code]
      ,coalesce([title], 'Missing information')
      ,[call]
      ,[rcn]
	  ,getdate(),
	   suser_name()
FROM [ANTERO].[sa].[sa_horizon_topics]


