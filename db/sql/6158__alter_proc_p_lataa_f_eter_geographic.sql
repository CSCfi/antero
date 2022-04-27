USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_eter_geographic]    Script Date: 27.4.2022 11:06:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_eter_geographic] AS

TRUNCATE TABLE dw.f_eter_geographic

INSERT INTO ANTERO.dw.f_eter_geographic (
	   [ETER_ID]
      ,[Name of the city]
      ,[Notes on region of establishment]
      ,[Multi-site institution]
      ,[Geographic coordinates - latitude]
      ,[Region of establishment (NUTS 2)]
      ,[NUTS 3 codes of other campuses]
      ,[Multi-site institution - Postcode]
      ,[Geographic coordinates - longitude]
      ,[Notes on city, postcode or coordinates]
      ,[Multi-site institution - City]
      ,[Notes on multisite institution]
      ,[Multi-site institution - Longitude]
      ,[Flag geographic information]
      ,[Region of establishment (NUTS 3)]
      ,[Postcode]
      ,[Multi-site institution - Latitude]
      ,[username]
      ,[source]
      ,[loadtime])
SELECT
	   [ETER_ID]
      ,[Name of the city]
      ,[Notes on region of establishment]
      ,[Multi-site institution]
      ,[Geographic coordinates - latitude]
      ,[Region of establishment (NUTS 2)]
      ,[NUTS 3 codes of other campuses]
      ,[Multi-site institution - Postcode]
      ,[Geographic coordinates - longitude]
      ,[Notes on city, postcode or coordinates]
      ,[Multi-site institution - City]
      ,[Notes on multisite institution]
      ,[Multi-site institution - Longitude]
      ,[Flag geographic information]
      ,[Region of establishment (NUTS 3)]
      ,[Postcode]
      ,[Multi-site institution - Latitude]
	  ,SUSER_NAME()
	  ,'ETL: p_lataa_f_eter_geographic' 
	  ,getdate()
FROM [ANTERO].[sa].[sa_eter_geographic]

GO

USE [ANTERO]