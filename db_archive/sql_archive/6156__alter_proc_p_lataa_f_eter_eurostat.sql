USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_eter_eurostat]    Script Date: 27.4.2022 11:05:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_eter_eurostat] AS

TRUNCATE TABLE dw.f_eter_eurostat

INSERT INTO ANTERO.dw.f_eter_eurostat (
	   [TIME]
      ,[GEO]
      ,[GEO_LABEL]
      ,[SEX]
      ,[UNIT]
      ,[UNIT_LABEL]
      ,[Flag and Footnotes]
      ,[15-64 yr population]
      ,[Total population]
      ,[username]
      ,[source]
      ,[loadtime])
SELECT
	   [TIME]
      ,[GEO]
      ,[GEO_LABEL]
      ,[SEX]
      ,[UNIT]
      ,[UNIT_LABEL]
      ,[Flag and Footnotes]
      ,[15-64 yr population]
      ,[Total population]
	  ,SUSER_NAME()
	  ,'ETL: p_lataa_f_eter_eurostat' 
	  ,getdate()
FROM [ANTERO].[sa].[sa_eter_eurostat]

GO

USE [ANTERO]