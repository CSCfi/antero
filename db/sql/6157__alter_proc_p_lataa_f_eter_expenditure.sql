USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_eter_expenditure]    Script Date: 27.4.2022 11:05:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_eter_expenditure] AS

TRUNCATE TABLE dw.f_eter_expenditure

INSERT INTO ANTERO.dw.f_eter_expenditure (
	   [ETER_ID]
      ,[Personnel expenditure (PPP)]
      ,[Personnel expenditure (EURO)]
      ,[Personnel expenditure (NC)]
      ,[Flag Non-personnel expenditure]
      ,[Flag Personnel expenditure]
      ,[Non-personnel expenditure (NC)]
      ,[Non-personnel expenditure (PPP)]
      ,[Non-personnel expenditure (EURO)]
      ,[Total Current expenditure (NC)]
      ,[Total Current expenditure (EURO)]
      ,[Total Current expenditure (PPP)]
      ,[Expenditure unclassified (NC)]
      ,[Expenditure unclassified (EURO)]
      ,[Expenditure unclassified (PPP)]
      ,[Flag Expenditure unclassified]
      ,[Capital expenditure (EURO)]
      ,[Capital expenditure (NC)]
      ,[Capital expenditure (PPP)]
      ,[Flag Capital expenditure]
      ,[Notes on expenditure]
      ,[Flag Total current expenditure]
      ,[Accounting system of capital expenditure]
      ,[username]
      ,[source]
      ,[loadtime])
SELECT
	   [ETER_ID]
      ,[Personnel expenditure (PPP)]
      ,[Personnel expenditure (EURO)]
      ,[Personnel expenditure (NC)]
      ,[Flag Non-personnel expenditure]
      ,[Flag Personnel expenditure]
      ,[Non-personnel expenditure (NC)]
      ,[Non-personnel expenditure (PPP)]
      ,[Non-personnel expenditure (EURO)]
      ,[Total Current expenditure (NC)]
      ,[Total Current expenditure (EURO)]
      ,[Total Current expenditure (PPP)]
      ,[Expenditure unclassified (NC)]
      ,[Expenditure unclassified (EURO)]
      ,[Expenditure unclassified (PPP)]
      ,[Flag Expenditure unclassified]
      ,[Capital expenditure (EURO)]
      ,[Capital expenditure (NC)]
      ,[Capital expenditure (PPP)]
      ,[Flag Capital expenditure]
      ,[Notes on expenditure]
      ,[Flag Total current expenditure]
      ,[Accounting system of capital expenditure]
	  ,SUSER_NAME()
	  ,'ETL: p_lataa_f_eter_expenditure' 
	  ,getdate()
FROM [ANTERO].[sa].[sa_eter_expenditure]



GO

USE [ANTERO]