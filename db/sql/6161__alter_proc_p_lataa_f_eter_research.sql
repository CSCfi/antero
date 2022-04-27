USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_eter_research]    Script Date: 27.4.2022 11:08:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_eter_research] AS

TRUNCATE TABLE dw.f_eter_research

INSERT INTO ANTERO.dw.f_eter_research (
	   [ETER_ID]
      ,[Students enrolled at ISCED 8 - men]
      ,[Students enrolled at ISCED 8 - foreigner]
      ,[Students enrolled ISCED 8-mobility unclassified]
      ,[Students enrolled at ISCED 8 - Social sciences, journalism and information]
      ,[Students enrolled at ISCED 8 - Agriculture, forestry, fisheries and veterinary]
      ,[Students enrolled at ISCED 8 - part-time]
      ,[Flag Students ISCED 8 - gender]
      ,[Research active institution]
      ,[Students enrolled at ISCED 8 - national]
      ,[Students enrolled at ISCED 8 - resident]
      ,[Flag Students ISCED 8 - Age group]
      ,[Graduates at ISCED 8 - women]
      ,[Students enrolled at ISCED 8 - women]
      ,[Graduates at ISCED 8 - citizenship unclassified]
      ,[Flag Graduates ISCED 8 - mobility]
      ,[Students enrolled at ISCED 8 - Education]
      ,[Students enrolled ISCED 8-citizenship unclassified]
      ,[Graduates at ISCED 8 - Business, administration and law]
      ,[Students enrolled at ISCED 8 - mobile]
      ,[Graduates at ISCED 8 - Health and welfare]
      ,[Students enrolled at ISCED 8 - Arts and Humanities]
      ,[Students enrolled at ISCED 8 - Engineering, manufacturing and construction]
      ,[Students enrolled at ISCED 8 - Information and Communication Technologies]
      ,[Flag Students ISCED 8 - mobility]
      ,[Flag Students ISCED 8 - ISCED-FoE]
      ,[Flag Graduates at ISCED 8 - Age group]
      ,[Students enrolled at ISCED 8 - under 20 years old]
      ,[Students enrolled at ISCED 8 - Business, administration and law]
      ,[Students enrolled ISCED 8 - ISCED-FoE unclassified]
      ,[Students enrolled at ISCED 8 - Age goup unclassified]
      ,[R&D Expenditure (NC)]
      ,[R&D Expenditure (EURO)]
      ,[R&D Expenditure (PPP)]
      ,[Graduates at ISCED 8 - men]
      ,[Flag Students ISCED 8 - part-time, full-time]
      ,[Graduates at ISCED 8 - foreigner]
      ,[Graduates at ISCED 8 - mobility unclassified]
      ,[Graduates at ISCED 8 - Social sciences, journalism and information]
      ,[Graduates at ISCED 8 - Agriculture, forestry, fisheries and veterinary]
      ,[Students enrolled at ISCED 8 - Health and welfare]
      ,[Students enrolled at ISCED 8 - over 29 years old]
      ,[Graduates at ISCED 8 - under 20 years old]
      ,[Graduates at ISCED 8 - Age goup unclassified]
      ,[Included in official R&D statistics]
      ,[Students enrolled at ISCED 8 - full-time]
      ,[Notes on students enrolled at ISCED 8]
      ,[Students enrolled at ISCED 8 - between 22 and 24 years old]
      ,[Graduates at ISCED 8 - national]
      ,[Total students enrolled at ISCED 8]
      ,[Graduates at ISCED 8 - mobile]
      ,[Graduates at ISCED 8 - gender unclassified]
      ,[Graduates at ISCED 8 - Arts and Humanities]
      ,[Flag Graduates ISCED 8 - citizenship]
      ,[Graduates at ISCED 8 - Engineering, manufacturing and construction]
      ,[Flag Graduates ISCED 8 - ISCED-FoE]
      ,[Graduates at ISCED 8 - Generic programmes and qualifications]
      ,[Graduates at ISCED 8 - Natural sciences, mathematics and statistics]
      ,[Graduates at ISCED 8 - over 29 years old]
      ,[Graduates at ISCED 8 - Services]
      ,[Notes on graduates at ISCED 8]
      ,[Graduates at ISCED 8 - between 22 and 24 years old]
      ,[Flag R&D Expenditure]
      ,[Total graduates at ISCED 8]
      ,[Notes on research activities]
      ,[Students enrolled ISCED 8 - gender unclassified]
      ,[Flag Students ISCED 8 - citizenship]
      ,[Students enrolled at ISCED 8 - Generic programmes and qualifications]
      ,[Students enrolled at ISCED 8 - Natural sciences, mathematics and statistics]
      ,[Students enrolled at ISCED 8 - Services]
      ,[Students enrolled at ISCED 8 - part-, full-time unclassified]
      ,[Students enrolled at ISCED 8 - between 25 and 29 years old]
      ,[Flag Total students ISCED 8]
      ,[Flag Graduates ISCED 8 - gender]
      ,[Graduates at ISCED 8 - resident]
      ,[Graduates at ISCED 8 - Education]
      ,[Graduates at ISCED 8 - Information and Communication Technologies]
      ,[Graduates at ISCED 8 - ISCED-FoE unclassified]
      ,[Graduates at ISCED 8 - between 25 and 29 years old]
      ,[Flag Total graduates ISCED 8]
      ,[EU-FP Staff mobility]
      ,[EU-FP Researchers mobility]
      ,[EU-FP Research training cooperation]
      ,[Flag Researchers mobility]
      ,[username]
      ,[source]
      ,[loadtime])
SELECT
	   [ETER_ID]
      ,cast([Students enrolled at ISCED 8 - men] as float)
      ,cast([Students enrolled at ISCED 8 - foreigner] as float)
      ,cast([Students enrolled ISCED 8-mobility unclassified] as float)
      ,cast([Students enrolled at ISCED 8 - Social sciences, journalism and information] as float)
      ,cast([Students enrolled at ISCED 8 - Agriculture, forestry, fisheries and veterinary] as float)
      ,cast([Students enrolled at ISCED 8 - part-time] as float)
      ,[Flag Students ISCED 8 - gender]
      ,cast([Research active institution] as float)
      ,cast([Students enrolled at ISCED 8 - national] as float)
      ,cast([Students enrolled at ISCED 8 - resident] as float)
      ,[Flag Students ISCED 8 - Age group]
      ,cast([Graduates at ISCED 8 - women] as float)
      ,cast([Students enrolled at ISCED 8 - women] as float)
      ,cast([Graduates at ISCED 8 - citizenship unclassified] as float)
      ,[Flag Graduates ISCED 8 - mobility]
      ,cast([Students enrolled at ISCED 8 - Education] as float)
      ,cast([Students enrolled ISCED 8-citizenship unclassified] as float)
      ,cast([Graduates at ISCED 8 - Business, administration and law] as float)
      ,cast([Students enrolled at ISCED 8 - mobile] as float)
      ,cast([Graduates at ISCED 8 - Health and welfare] as float)
      ,cast([Students enrolled at ISCED 8 - Arts and Humanities] as float)
      ,cast([Students enrolled at ISCED 8 - Engineering, manufacturing and construction] as float)
      ,cast([Students enrolled at ISCED 8 - Information and Communication Technologies] as float)
      ,[Flag Students ISCED 8 - mobility]
      ,[Flag Students ISCED 8 - ISCED-FoE]
      ,[Flag Graduates at ISCED 8 - Age group]
      ,cast([Students enrolled at ISCED 8 - under 20 years old] as float)
      ,cast([Students enrolled at ISCED 8 - Business, administration and law] as float)
      ,cast([Students enrolled ISCED 8 - ISCED-FoE unclassified] as float)
      ,cast([Students enrolled at ISCED 8 - Age goup unclassified] as float)
      ,cast([R&D Expenditure (NC)] as float)
      ,cast([R&D Expenditure (EURO)] as float)
      ,cast([R&D Expenditure (PPP)] as float)
      ,cast([Graduates at ISCED 8 - men] as float)
      ,[Flag Students ISCED 8 - part-time, full-time]
      ,cast([Graduates at ISCED 8 - foreigner] as float)
      ,cast([Graduates at ISCED 8 - mobility unclassified] as float)
      ,cast([Graduates at ISCED 8 - Social sciences, journalism and information] as float)
      ,cast([Graduates at ISCED 8 - Agriculture, forestry, fisheries and veterinary] as float)
      ,cast([Students enrolled at ISCED 8 - Health and welfare] as float)
      ,cast([Students enrolled at ISCED 8 - over 29 years old] as float)
      ,cast([Graduates at ISCED 8 - under 20 years old] as float)
      ,cast([Graduates at ISCED 8 - Age goup unclassified] as float)
      ,[Included in official R&D statistics]
      ,cast([Students enrolled at ISCED 8 - full-time] as float)
      ,[Notes on students enrolled at ISCED 8]
      ,cast([Students enrolled at ISCED 8 - between 22 and 24 years old] as float)
      ,cast([Graduates at ISCED 8 - national] as float)
      ,cast([Total students enrolled at ISCED 8] as float)
      ,cast([Graduates at ISCED 8 - mobile] as float)
      ,cast([Graduates at ISCED 8 - gender unclassified] as float)
      ,cast([Graduates at ISCED 8 - Arts and Humanities] as float)
      ,[Flag Graduates ISCED 8 - citizenship]
      ,cast([Graduates at ISCED 8 - Engineering, manufacturing and construction] as float)
      ,[Flag Graduates ISCED 8 - ISCED-FoE]
      ,cast([Graduates at ISCED 8 - Generic programmes and qualifications] as float)
      ,cast([Graduates at ISCED 8 - Natural sciences, mathematics and statistics] as float)
      ,cast([Graduates at ISCED 8 - over 29 years old] as float)
      ,cast([Graduates at ISCED 8 - Services] as float)
      ,[Notes on graduates at ISCED 8]
      ,cast([Graduates at ISCED 8 - between 22 and 24 years old] as float)
      ,[Flag R&D Expenditure]
      ,cast([Total graduates at ISCED 8] as float)
      ,[Notes on research activities]
      ,cast([Students enrolled ISCED 8 - gender unclassified] as float)
      ,[Flag Students ISCED 8 - citizenship]
      ,cast([Students enrolled at ISCED 8 - Generic programmes and qualifications] as float)
      ,cast([Students enrolled at ISCED 8 - Natural sciences, mathematics and statistics] as float)
      ,cast([Students enrolled at ISCED 8 - Services] as float)
      ,cast([Students enrolled at ISCED 8 - part-, full-time unclassified] as float)
      ,cast([Students enrolled at ISCED 8 - between 25 and 29 years old] as float)
      ,[Flag Total students ISCED 8]
      ,[Flag Graduates ISCED 8 - gender]
      ,cast([Graduates at ISCED 8 - resident] as float)
      ,cast([Graduates at ISCED 8 - Education] as float)
      ,cast([Graduates at ISCED 8 - Information and Communication Technologies] as float)
      ,cast([Graduates at ISCED 8 - ISCED-FoE unclassified] as float)
      ,cast([Graduates at ISCED 8 - between 25 and 29 years old] as float)
      ,[Flag Total graduates ISCED 8]
      ,cast([EU-FP Staff mobility] as float)
      ,cast([EU-FP Researchers mobility] as float)
      ,cast([EU-FP Research training cooperation] as float)
      ,[Flag Researchers mobility]
	  ,SUSER_NAME()
	  ,'ETL: p_lataa_f_eter_research' 
	  ,getdate()
FROM [ANTERO].[sa].[sa_eter_research]

GO

USE [ANTERO]