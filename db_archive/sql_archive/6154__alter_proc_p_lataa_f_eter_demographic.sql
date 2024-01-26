USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_eter_demographic]    Script Date: 27.4.2022 11:04:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_eter_demographic] AS

TRUNCATE TABLE dw.f_eter_demographic

INSERT INTO ANTERO.dw.f_eter_demographic (
	   [ETER_ID]
      ,[Demographic event between past year and reference year]
      ,[RISIS-OrgReg demographic event ID]
      ,[Affected institutions (past)]
      ,[Demographic events between reference year and following year]
      ,[Short description of event]
      ,[Affected institutions (following year)]
      ,[username]
      ,[source]
      ,[loadtime])
SELECT
	   [ETER_ID]
      ,[Demographic event between past year and reference year]
      ,[RISIS-OrgReg demographic event ID]
      ,[Affected institutions (past)]
      ,[Demographic events between reference year and following year]
      ,[Short description of event]
      ,[Affected institutions (following year)]
	  ,SUSER_NAME()
	  ,'ETL: p_lataa_f_eter_demographic' 
	  ,getdate()
FROM [ANTERO].[sa].[sa_eter_demographic]



GO

USE [ANTERO]