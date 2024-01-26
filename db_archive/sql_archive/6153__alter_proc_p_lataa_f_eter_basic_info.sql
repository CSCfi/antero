USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_eter_basic_info]    Script Date: 27.4.2022 11:03:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_eter_basic_info] AS

TRUNCATE TABLE dw.f_eter_basic_info

INSERT INTO ANTERO.dw.f_eter_basic_info (
	   [ETER_ID]
      ,[ETER ID Year]
      ,[ETER ID]
      ,[National identifier]
      ,[Institution Acronym]
      ,[Reference year]
      ,[Country Code]
      ,[English Institution Name]
      ,[Institution Category - National Language]
      ,[Institution Category standardized]
      ,[Notes on institution name]
      ,[Institution Category - English]
      ,[Institution Name]
      ,[Notes on foundation year]
      ,[Foundation year]
      ,[Legal status year]
      ,[University hospital]
      ,[Notes on legal status year]
      ,[University hospital OrgReg ID]
      ,[Notes on ancestor year]
      ,[Notes on institutional website]
      ,[Legal status]
      ,[RISIS-OrgReg institutional page]
      ,[Institutional website]
      ,[University hospital name]
      ,[Notes on institution category]
      ,[Ancestor year]
      ,[Notes on university hospital]
      ,[ROR ID]
      ,[WHED ID]
      ,[username]
      ,[source]
      ,[loadtime])
SELECT
	   [ETER_ID]
      ,[ETER ID Year]
      ,[ETER ID]
      ,[National identifier]
      ,[Institution Acronym]
      ,[Reference year]
      ,[Country Code]
      ,[English Institution Name]
      ,[Institution Category - National Language]
      ,[Institution Category standardized]
      ,[Notes on institution name]
      ,[Institution Category - English]
      ,[Institution Name]
      ,[Notes on foundation year]
      ,[Foundation year]
      ,[Legal status year]
      ,[University hospital]
      ,[Notes on legal status year]
      ,[University hospital OrgReg ID]
      ,[Notes on ancestor year]
      ,[Notes on institutional website]
      ,[Legal status]
      ,[RISIS-OrgReg institutional page]
      ,[Institutional website]
      ,[University hospital name]
      ,[Notes on institution category]
      ,[Ancestor year]
      ,[Notes on university hospital]
      ,[ROR ID]
      ,[WHED ID]
	  ,SUSER_NAME()
	  ,'ETL: p_lataa_f_eter_basic_info' 
	  ,getdate()
FROM [ANTERO].[sa].[sa_eter_basic_info]

GO

USE [ANTERO]