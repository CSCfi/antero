USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_eter_allfields_codes]    Script Date: 27.4.2022 11:01:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_eter_allfields_codes] AS

TRUNCATE TABLE dw.f_eter_allfields_codes

INSERT INTO ANTERO.dw.f_eter_allfields_codes (
	   [ID]
      ,[name]
      ,[code]
      ,[value]
      ,[username]
      ,[source]
      ,[loadtime])
SELECT
	   [_id]
      ,[name]
      ,[code]
      ,[value]
	  ,SUSER_NAME()
	  ,'ETL: p_lataa_f_eter_allfields_codes' 
	  ,getdate()
FROM [ANTERO].[sa].[sa_eter_allfields_codes]



GO

USE [ANTERO]