USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_eter_demographic]    Script Date: 4.2.2019 9:19:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*
ETER demographic information lataus SA-tauluista
4.2.2019
JKO
*/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_eter_demographic]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_eter_demographic] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_f_eter_demographic] AS

TRUNCATE TABLE dw.f_eter_demographic

INSERT INTO dw.f_eter_demographic (
[id]
,[Demographic_event_past-reference_year]
,[Affected_institutions_past]
,[Demographic_events_reference-following_year]
,[Affected_institutions_following_year]
,[Short_event_description]
,[username]
,[Source]
,[Loadtime]
)
SELECT [id]=sa.[_id]
      ,[Demographic_event_past-reference_year]=sa.[DEMO.EVENTPASTYEAR]
      ,[Affected_institutions_past]=sa.[DEMO.AFFINSTPASTYEAR]
      ,[Demographic_events_reference-following_year]=sa.[DEMO.EVENTREFYEAR]
      ,[Affected_institutions_following_year]=sa.[DEMO.AFFINSTREFYEAR]
      ,[Short_event_description]=sa.[DEMO.DESCRIPTION]
      ,sa.[username]
      ,sa.[Source]
      ,sa.[Loadtime]
FROM antero.sa.sa_eter_demographic as sa

GO



USE [ANTERO]