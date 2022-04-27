USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_eter_staff]    Script Date: 27.4.2022 11:09:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_eter_staff] AS

TRUNCATE TABLE dw.f_eter_staff

INSERT INTO ANTERO.dw.f_eter_staff (
	   [ETER_ID]
      ,[Total academic personnel (FTE)]
      ,[Flag Academic personnel (HC) - gender]
      ,[Academic personnel - Generic programmes and qualifications (HC)]
      ,[Academic personnel - men (HC)]
      ,[Academic personnel - gender unclassified (HC)]
      ,[Flag Total academic personnel (FTE)]
      ,[Academic personnel - Natural sciences, mathematics and statistics (HC)]
      ,[Academic personnel - foreigner (HC)]
      ,[Flag Academic personnel (HC) - citizenship]
      ,[Academic personnel - national (HC)]
      ,[Academic personnel - Arts and Humanities (HC)]
      ,[Academic personnel - Business, administration and law (HC)]
      ,[Academic personnel - Services (HC)]
      ,[Academic personnel - Education (HC)]
      ,[Academic personnel - Engineering, manufacturing and construction (HC)]
      ,[Academic personnel - Health and welfare (HC)]
      ,[Number of full professors - men]
      ,[Academic personnel - Information and Communication Technologies (HC)]
      ,[Flag Total academic personnel (HC)]
      ,[Flag Academic personnel (HC) - ISCED-FoE]
      ,[Number of research and teaching assistants (FTE)]
      ,[Number of full professors - unclassified]
      ,[Academic personnel - ISCED-FoE unclassified]
      ,[Flag Number of full professors]
      ,[Number of support and administrative personnel (FTE)]
      ,[Number of research and teaching assistants (HC)]
      ,[Number of full professors - women]
      ,[Notes on academic personnel]
      ,[Total personnel (FTE)]
      ,[Number of support and administrative personnel (HC)]
      ,[Flag Number of research and teaching assistants (FTE)]
      ,[Notes on support and administrative personnel]
      ,[Total personnel (HC)]
      ,[Flag Number of support and administrative personnel (FTE)]
      ,[Notes on total personnel]
      ,[Flag Total personnel (FTE)]
      ,[Academic personnel - women (HC)]
      ,[Academic personnel - citizenship unclassified]
      ,[Academic personnel - Social sciences, journalism and information (HC)]
      ,[Academic personnel - Agriculture, forestry, fisheries and veterinary (HC)]
      ,[Total academic personnel (HC)]
      ,[Total number of full professors]
      ,[Flag Number of research and teaching assistants (HC)]
      ,[Flag Number of support and administrative personnel (HC)]
      ,[Flag Total personnel (HC)]
      ,[username]
      ,[source]
      ,[loadtime])
SELECT
	   [ETER_ID]
      ,cast([Total academic personnel (FTE)] as float)
      ,[Flag Academic personnel (HC) - gender]
      ,cast([Academic personnel - Generic programmes and qualifications (HC)] as float)
      ,cast([Academic personnel - men (HC)] as float)
      ,cast([Academic personnel - gender unclassified (HC)] as float)
      ,[Flag Total academic personnel (FTE)]
      ,cast([Academic personnel - Natural sciences, mathematics and statistics (HC)] as float)
      ,cast([Academic personnel - foreigner (HC)] as float)
      ,[Flag Academic personnel (HC) - citizenship]
      ,cast([Academic personnel - national (HC)] as float)
      ,cast([Academic personnel - Arts and Humanities (HC)] as float)
      ,cast([Academic personnel - Business, administration and law (HC)] as float)
      ,cast([Academic personnel - Services (HC)] as float)
      ,cast([Academic personnel - Education (HC)] as float)
      ,cast([Academic personnel - Engineering, manufacturing and construction (HC)] as float)
      ,cast([Academic personnel - Health and welfare (HC)] as float)
      ,cast([Number of full professors - men] as float)
      ,cast([Academic personnel - Information and Communication Technologies (HC)] as float)
      ,[Flag Total academic personnel (HC)]
      ,[Flag Academic personnel (HC) - ISCED-FoE]
      ,cast([Number of research and teaching assistants (FTE)] as float)
      ,cast([Number of full professors - unclassified] as float)
      ,cast([Academic personnel - ISCED-FoE unclassified] as float)
      ,[Flag Number of full professors]
      ,cast([Number of support and administrative personnel (FTE)] as float)
      ,cast([Number of research and teaching assistants (HC)] as float)
      ,cast([Number of full professors - women] as float)
      ,[Notes on academic personnel]
      ,cast([Total personnel (FTE)] as float)
      ,cast([Number of support and administrative personnel (HC)] as float)
      ,[Flag Number of research and teaching assistants (FTE)]
      ,[Notes on support and administrative personnel]
      ,cast([Total personnel (HC)] as float)
      ,[Flag Number of support and administrative personnel (FTE)]
      ,[Notes on total personnel]
      ,[Flag Total personnel (FTE)]
      ,cast([Academic personnel - women (HC)] as float)
      ,cast([Academic personnel - citizenship unclassified] as float)
      ,cast([Academic personnel - Social sciences, journalism and information (HC)] as float)
      ,cast([Academic personnel - Agriculture, forestry, fisheries and veterinary (HC)] as float)
      ,cast([Total academic personnel (HC)] as float)
      ,cast([Total number of full professors] as float)
      ,[Flag Number of research and teaching assistants (HC)]
      ,[Flag Number of support and administrative personnel (HC)]
      ,[Flag Total personnel (HC)]
	  ,SUSER_NAME()
	  ,'ETL: p_lataa_f_eter_staff' 
	  ,getdate()
FROM [ANTERO].[sa].[sa_eter_staff]

GO

USE [ANTERO]