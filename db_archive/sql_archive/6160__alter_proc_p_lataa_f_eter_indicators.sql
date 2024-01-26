USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_eter_indicators]    Script Date: 27.4.2022 11:07:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_eter_indicators] AS

TRUNCATE TABLE dw.f_eter_indicators

INSERT INTO ANTERO.dw.f_eter_indicators (
	   [ETER_ID]
      ,[Flag Share of women students ISCED 6]
      ,[Share of women students ISCED 6]
      ,[Flag Share of women students ISCED 5-7]
      ,[Flag Share of foreigners students ISCED 6]
      ,[Share of foreigners students ISCED 6]
      ,[Flag Share of foreigners students ISCED 5-7]
      ,[Share of mobile students ISCED 7]
      ,[Flag Share of mobile students ISCED 7]
      ,[Flag Herfindahl index students ISCED 5-7]
      ,[Share of women students ISCED 7]
      ,[Share of women students ISCED 5-7]
      ,[Share of foreigners students ISCED 7]
      ,[Share of foreigners students ISCED 5-7]
      ,[Flag Share of mobile students ISCED 6]
      ,[Share of mobile students ISCED 5-7]
      ,[Herfindahl index students ISCED 5-7]
      ,[Flag STEM orientation (students)]
      ,[Flag Share of women students ISCED 7]
      ,[Flag Share of foreigners students ISCED 7]
      ,[Share of mobile students ISCED 6]
      ,[Flag Share of mobile students ISCED 5-7]
      ,[STEM orientation (students)]
      ,[Share of women graduates ISCED 6]
      ,[Flag Share of women graduates ISCED 5-7]
      ,[Share of women graduates ISCED 5-7]
      ,[Share of foreigners graduates ISCED 6]
      ,[Flag Share of foreigners graduates ISCED 5-7]
      ,[Share of foreigners graduates ISCED 5-7]
      ,[Flag Share of mobile graduates ISCED 6]
      ,[Share of mobile graduates ISCED 7]
      ,[STEM orientation (graduates)]
      ,[Flag STEM orientation (graduates)]
      ,[Flag Share of women graduates ISCED 6]
      ,[Flag Share of women graduates ISCED 7]
      ,[Flag Share of foreigners graduates ISCED 6]
      ,[Flag Share of foreigners graduates ISCED 7]
      ,[Share of mobile graduates ISCED 6]
      ,[Flag Share of mobile graduates ISCED 7]
      ,[Flag Share of mobile graduates ISCED 5-7]
      ,[Master degree orientation]
      ,[Share of women graduates ISCED 7]
      ,[Share of foreigners graduates ISCED 7]
      ,[Share of mobile graduates ISCED 5-7]
      ,[Flag Master degree orientation]
      ,[Share of women academic staff]
      ,[Share of foreigners academic staff]
      ,[Flag Academic staff / total staff (FTE)]
      ,[Flag Share of women academic staff]
      ,[Flag Share of women full professors]
      ,[Flag Share of foreigners academic staff]
      ,[Flag Herfindahl index academic staff]
      ,[Full professors / academic staff (HC)]
      ,[Academic staff / total staff (FTE)]
      ,[Share of women full professors]
      ,[Herfindahl index academic staff]
      ,[Flag Full professors / academic staff (HC)]
      ,[Flag Share of women PhD graduates]
      ,[Flag Share of foreigners PhD graduates]
      ,[Share of mobile PhD students]
      ,[Flag Share of mobile PhD students]
      ,[Herfindahl index PhD graduates]
      ,[PhD intensity]
      ,[Flag PhD intensity]
      ,[Researchers mobility intensity]
      ,[Share of women PhD students]
      ,[Share of women PhD graduates]
      ,[Share of foreigners PhD students]
      ,[Share of foreigners PhD graduates]
      ,[Share of mobile PhD graduates]
      ,[Flag Herfindahl index PhD graduates]
      ,[Flag Researchers mobility intensity]
      ,[Flag Share of women PhD students]
      ,[Flag Share of foreigners PhD students]
      ,[Flag Share of mobile PhD graduates]
      ,[Total core budget / Total current revenues]
      ,[Student fees funding / Total current revenues]
      ,[Flag Student fees funding / Total current revenues]
      ,[Flag Total core budget / Total current revenues]
      ,[Flag Total third party funding / Total current revenues]
      ,[Total third party funding / Total current revenues]
      ,[Flag Erasmus credit mobility outgoing]
      ,[Erasmus credit mobility incoming]
      ,[Erasmus credit mobility outgoing]
      ,[Flag Erasmus credit mobility incoming]
      ,[Notes on indicators]
      ,[username]
      ,[source]
      ,[loadtime])
SELECT
	   [ETER_ID]
      ,[Flag Share of women students ISCED 6]
      ,cast([Share of women students ISCED 6] as float)
      ,[Flag Share of women students ISCED 5-7]
      ,[Flag Share of foreigners students ISCED 6]
      ,cast([Share of foreigners students ISCED 6] as float)
      ,[Flag Share of foreigners students ISCED 5-7]
      ,cast([Share of mobile students ISCED 7] as float)
      ,[Flag Share of mobile students ISCED 7]
      ,[Flag Herfindahl index students ISCED 5-7]
      ,cast([Share of women students ISCED 7] as float)
      ,cast([Share of women students ISCED 5-7] as float)
      ,cast([Share of foreigners students ISCED 7] as float)
      ,cast([Share of foreigners students ISCED 5-7] as float)
      ,[Flag Share of mobile students ISCED 6]
      ,cast([Share of mobile students ISCED 5-7] as float)
      ,cast([Herfindahl index students ISCED 5-7] as float)
      ,[Flag STEM orientation (students)] 
      ,[Flag Share of women students ISCED 7]
      ,[Flag Share of foreigners students ISCED 7]
      ,cast([Share of mobile students ISCED 6] as float)
      ,[Flag Share of mobile students ISCED 5-7]
      ,[STEM orientation (students)]
      ,cast([Share of women graduates ISCED 6] as float)
      ,[Flag Share of women graduates ISCED 5-7]
      ,cast([Share of women graduates ISCED 5-7] as float)
      ,cast([Share of foreigners graduates ISCED 6] as float)
      ,[Flag Share of foreigners graduates ISCED 5-7]
      ,cast([Share of foreigners graduates ISCED 5-7] as float)
      ,[Flag Share of mobile graduates ISCED 6] 
      ,cast([Share of mobile graduates ISCED 7] as float)
      ,[STEM orientation (graduates)]
      ,[Flag STEM orientation (graduates)] 
      ,[Flag Share of women graduates ISCED 6] 
      ,[Flag Share of women graduates ISCED 7] 
      ,[Flag Share of foreigners graduates ISCED 6]
      ,[Flag Share of foreigners graduates ISCED 7] 
      ,cast([Share of mobile graduates ISCED 6] as float)
      ,[Flag Share of mobile graduates ISCED 7]
      ,[Flag Share of mobile graduates ISCED 5-7] 
      ,[Master degree orientation]
      ,cast([Share of women graduates ISCED 7] as float)
      ,cast([Share of foreigners graduates ISCED 7] as float)
      ,cast([Share of mobile graduates ISCED 5-7] as float)
      ,[Flag Master degree orientation]
      ,cast([Share of women academic staff] as float)
      ,cast([Share of foreigners academic staff] as float)
      ,[Flag Academic staff / total staff (FTE)]
      ,[Flag Share of women academic staff]
      ,[Flag Share of women full professors]
      ,[Flag Share of foreigners academic staff]
      ,[Flag Herfindahl index academic staff]
      ,cast([Full professors / academic staff (HC)] as float)
      ,cast([Academic staff / total staff (FTE)] as float)
      ,cast([Share of women full professors] as float)
      ,cast([Herfindahl index academic staff] as float)
      ,[Flag Full professors / academic staff (HC)] 
      ,[Flag Share of women PhD graduates] 
      ,[Flag Share of foreigners PhD graduates]
      ,cast([Share of mobile PhD students] as float)
      ,[Flag Share of mobile PhD students]
      ,cast([Herfindahl index PhD graduates] as float)
      ,cast([PhD intensity] as float)
      ,[Flag PhD intensity]
      ,cast([Researchers mobility intensity] as float)
      ,cast([Share of women PhD students] as float)
      ,cast([Share of women PhD graduates] as float)
      ,cast([Share of foreigners PhD students] as float)
      ,cast([Share of foreigners PhD graduates] as float)
      ,cast([Share of mobile PhD graduates] as float)
      ,[Flag Herfindahl index PhD graduates]
      ,[Flag Researchers mobility intensity] 
      ,[Flag Share of women PhD students]
      ,[Flag Share of foreigners PhD students] 
      ,[Flag Share of mobile PhD graduates]
      ,cast([Total core budget / Total current revenues] as float)
      ,cast([Student fees funding / Total current revenues] as float)
      ,[Flag Student fees funding / Total current revenues]
      ,[Flag Total core budget / Total current revenues]
      ,[Flag Total third party funding / Total current revenues]
      ,cast([Total third party funding / Total current revenues] as float)
      ,[Flag Erasmus credit mobility outgoing]
      ,cast([Erasmus credit mobility incoming] as float)
      ,cast([Erasmus credit mobility outgoing] as float)
      ,[Flag Erasmus credit mobility incoming]
      ,[Notes on indicators]
	  ,SUSER_NAME()
	  ,'ETL: p_lataa_f_eter_indicators' 
	  ,getdate()
FROM [ANTERO].[sa].[sa_eter_indicators]

GO

USE [ANTERO]