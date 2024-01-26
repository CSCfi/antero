USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_eter_graduates]    Script Date: 27.4.2022 11:07:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_eter_graduates] AS

TRUNCATE TABLE dw.f_eter_graduates

INSERT INTO ANTERO.dw.f_eter_graduates (
	   [ETER_ID]
      ,[Graduates at ISCED 5 - men]
      ,[Graduates at ISCED 5 - foreigner]
      ,[Graduates at ISCED 5 - women]
      ,[Graduates at ISCED 5 - mobility unclassified]
      ,[Graduates at ISCED 5 - citizenship unclassified]
      ,[Graduates at ISCED 5 - Social sciences, journalism and information]
      ,[Flag Graduates ISCED 5 - mobility]
      ,[Graduates at ISCED 5 - Agriculture, forestry, fisheries and veterinary]
      ,[Graduates at ISCED 5 - Business, administration and law]
      ,[Graduates at ISCED 5 - under 20 years old]
      ,[Graduates at ISCED 5 - Health and welfare]
      ,[Graduates at ISCED 5 - Age goup unclassified]
      ,[Flag Graduates ISCED 5 - gender]
      ,[Graduates at ISCED 6 - men]
      ,[Flag Graduates at ISCED 5 - Age group]
      ,[Graduates at ISCED 5 - resident]
      ,[Graduates at ISCED 6 - foreigner]
      ,[Graduates at ISCED 5 - Education]
      ,[Graduates at ISCED 6 - women]
      ,[Graduates at ISCED 6 - mobility unclassified]
      ,[Graduates at ISCED 5 - gender unclassified]
      ,[Graduates at ISCED 5 - Information and Communication Technologies]
      ,[Graduates at ISCED 5 - ISCED-FoE unclassified]
      ,[Graduates at ISCED 6 - Social sciences, journalism and information]
      ,[Flag Graduates ISCED 5 - citizenship]
      ,[Graduates at ISCED 5 - between 25 and 29 years old]
      ,[Graduates at ISCED 6 - Agriculture, forestry, fisheries and veterinary]
      ,[Graduates at ISCED 6 - citizenship unclassified]
      ,[Flag Graduates ISCED 6 - mobility]
      ,[Graduates at ISCED 6 - under 20 years old]
      ,[Flag Total graduates ISCED 5]
      ,[Graduates at ISCED 6 - Business, administration and law]
      ,[Graduates at ISCED 6 - Age goup unclassified]
      ,[Graduates at ISCED 5 - Generic programmes and qualifications]
      ,[Graduates at ISCED 5 - Natural sciences, mathematics and statistics]
      ,[Flag Graduates ISCED 6 - gender]
      ,[Graduates at ISCED 6 - Health and welfare]
      ,[Graduates at ISCED 7 - men]
      ,[Graduates at ISCED 6 - resident]
      ,[Graduates at ISCED 5 - Services]
      ,[Graduates at ISCED 7 - foreigner]
      ,[Graduates at ISCED 5 - between 22 and 24 years old]
      ,[Graduates at ISCED 6 - Education]
      ,[Total graduates at ISCED 5]
      ,[Graduates at ISCED 6 - Information and Communication Technologies]
      ,[Flag Graduates at ISCED 6 - Age group]
      ,[Graduates at ISCED 6 - ISCED-FoE unclassified]
      ,[Graduates at ISCED 6 - between 25 and 29 years old]
      ,[Graduates at ISCED 7 - mobility unclassified]
      ,[Flag Total graduates ISCED 6]
      ,[Graduates at ISCED 7 - Social sciences, journalism and information]
      ,[Graduates at ISCED 6 - gender unclassified]
      ,[Graduates at ISCED 7 - women]
      ,[Flag Graduates ISCED 6 - citizenship]
      ,[Flag Graduates ISCED 7 - gender]
      ,[Graduates at ISCED 7 - citizenship unclassified]
      ,[Graduates at ISCED 6 - Generic programmes and qualifications]
      ,[Graduates at ISCED 7 - resident]
      ,[Graduates at ISCED 7 - Agriculture, forestry, fisheries and veterinary]
      ,[Graduates at ISCED 6 - Natural sciences, mathematics and statistics]
      ,[Graduates at ISCED 6 - Services]
      ,[Graduates at ISCED 7 - Education]
      ,[Graduates at ISCED 6 - between 22 and 24 years old]
      ,[Graduates at ISCED 7 - under 20 years old]
      ,[Graduates at ISCED 7 - Information and Communication Technologies]
      ,[Flag Graduates ISCED 7 - mobility]
      ,[Total graduates at ISCED 6]
      ,[Graduates at ISCED 7 - gender unclassified]
      ,[Graduates at ISCED 7 - Business, administration and law]
      ,[Graduates at ISCED 7 - Age goup unclassified]
      ,[Flag Graduates ISCED 7 - citizenship]
      ,[Graduates at ISCED 5 - national]
      ,[Graduates at ISCED 7 long degree - men]
      ,[Graduates at ISCED 7 - ISCED-FoE unclassified]
      ,[Graduates at ISCED 7 - Generic programmes and qualifications]
      ,[Graduates at ISCED 7 - between 25 and 29 years old]
      ,[Graduates at ISCED 7 - Natural sciences, mathematics and statistics]
      ,[Graduates at ISCED 7 - Health and welfare]
      ,[Graduates at ISCED 7 - Services]
      ,[Graduates at ISCED 5 - mobile]
      ,[Graduates at ISCED 7 long degree - foreigner]
      ,[Graduates at ISCED 7 - between 22 and 24 years old]
      ,[Graduates at ISCED 5 - Arts and Humanities]
      ,[Flag Total graduates ISCED 7]
      ,[Flag Graduates at ISCED 7 - Age group]
      ,[Total graduates at ISCED 7]
      ,[Graduates at ISCED 5 - Engineering, manufacturing and construction]
      ,[Graduates ISCED7 long degree-mobility unclassified]
      ,[Flag Graduates ISCED 7 long degree - gender]
      ,[Graduates ISCED 7 long degree-gender unclassified]
      ,[Graduates at ISCED 7 long degree - Social sciences, journalism and information]
      ,[Flag Graduates ISCED 7 long degree - citizenship]
      ,[Graduates at ISCED 7 long degree - Generic programmes and qualifications]
      ,[Graduates at ISCED 7 long degree - Agriculture, forestry, fisheries and veterinary]
      ,[Graduates at ISCED 7 long degree - women]
      ,[Graduates at ISCED 7 long degree - Natural sciences, mathematics and statistics]
      ,[Graduates at ISCED 7 long degree - resident]
      ,[Flag Graduates ISCED 5 - ISCED-FoE]
      ,[Graduates at ISCED 7 long degree - Services]
      ,[Graduates ISCED 7 long degree-citiz. unclassified]
      ,[Graduates at ISCED 7 long degree - under 20 years old]
      ,[Graduates at ISCED 5 - over 29 years old]
      ,[Graduates at ISCED 7 long degree - Education]
      ,[Graduates at ISCED 7 long degree - Age goup unclassified]
      ,[Graduates at ISCED 7 long degree - between 22 and 24 years old]
      ,[Flag Graduates ISCED 7 long degree - mobility]
      ,[Graduates at ISCED 5-7 - men]
      ,[Notes on graduates at ISCED 5]
      ,[Total graduates at ISCED 7 long degree]
      ,[Graduates at ISCED 7 long degree - Business, administration and law]
      ,[Graduates at ISCED 5-7 - foreigner]
      ,[Graduates at ISCED 6 - national]
      ,[Graduates at ISCED 5-7 - gender unclassified]
      ,[Graduates at ISCED 7 long degree - Health and welfare]
      ,[Graduates at ISCED 6 - mobile]
      ,[Flag Graduates at ISCED 5-7 - citizenship]
      ,[Graduates at ISCED 7 long degree - Information and Communication Technologies]
      ,[Graduates at ISCED 5-7 - mobility unclassified]
      ,[Graduates at ISCED 5-7 - Generic programmes and qualifications]
      ,[Graduates at ISCED 5-7 - Natural sciences, mathematics and statistics]
      ,[Graduates ISCED7 long degree-ISCED-FoE unclassified]
      ,[Graduates at ISCED 5-7 - Services]
      ,[Graduates at ISCED 7 long degree - between 25 and 29 years old]
      ,[Graduates at ISCED 5-7 - between 22 and 24 years old]
      ,[Flag Total graduates ISCED 7 long degree]
      ,[Graduates at ISCED 5-7 - Social sciences, journalism and information]
      ,[Graduates at ISCED 6 - Arts and Humanities]
      ,[Flag Graduates at ISCED 7 long degree - Age group]
      ,[Total graduates ISCED 5-7]
      ,[Graduates at ISCED 5-7 - women]
      ,[Flag Graduates at ISCED 5-7 - gender]
      ,[Graduates at ISCED 6 - Engineering, manufacturing and construction]
      ,[Graduates at ISCED 5-7 - resident]
      ,[Graduates at ISCED 5-7 - Agriculture, forestry, fisheries and veterinary]
      ,[Graduates at ISCED 5-7 - Education]
      ,[Graduates at ISCED 5-7 - under 20 years old]
      ,[Graduates at ISCED 5-7 - Information and Communication Technologies]
      ,[Graduates at ISCED 5-7 - citizenship unclassified]
      ,[Flag Graduates ISCED 6 - ISCED-FoE]
      ,[Flag Graduates at ISCED 5-7 - mobility]
      ,[Graduates at ISCED 6 - over 29 years old]
      ,[Graduates at ISCED 5-7 - Business, administration and law]
      ,[Graduates at ISCED 5-7 - Age goup unclassified]
      ,[Notes on graduates at ISCED 6]
      ,[Graduates at ISCED 5-7 - ISCED-FoE unclassified]
      ,[Graduates at ISCED 5-7 - Health and welfare]
      ,[Graduates at ISCED 7 - national]
      ,[Notes on educational activities (Graduates)]
      ,[Graduates at ISCED 5-7 - between 25 and 29 years old]
      ,[Graduates at ISCED 7 - mobile]
      ,[Flag Graduates at ISCED 5-7 - Age group]
      ,[Graduates at ISCED 7 - Arts and Humanities]
      ,[Graduates at ISCED 7 - Engineering, manufacturing and construction]
      ,[Flag Total graduates ISCED 5-7]
      ,[Flag Graduates ISCED 7 - ISCED-FoE]
      ,[Graduates at ISCED 7 - over 29 years old]
      ,[Notes on graduates at ISCED 7]
      ,[Graduates at ISCED 7 long degree - national]
      ,[Graduates at ISCED 7 long degree - mobile]
      ,[Graduates at ISCED 7 long degree - Arts and Humanities]
      ,[Graduates at ISCED 7 long degree - Engineering, manufacturing and construction]
      ,[Flag Graduates ISCED 7 long degree - ISCED-FoE]
      ,[Graduates at ISCED 7 long degree - over 29 years old]
      ,[Notes on graduates at ISCED 7 long degree]
      ,[Graduates at ISCED 5-7 - national]
      ,[Graduates at ISCED 5-7 - mobile]
      ,[Graduates at ISCED 5-7 - Arts and Humanities]
      ,[Graduates at ISCED 5-7 - Engineering, manufacturing and construction]
      ,[Flag Graduates at ISCED 5-7 - ISCED-FoE]
      ,[Graduates at ISCED 5-7 - over 29 years old]
      ,[Notes on total graduates ISCED 5-7]
      ,[username]
      ,[source]
      ,[loadtime])
SELECT
	   [ETER_ID]
      ,cast([Graduates at ISCED 5 - men] as float)
      ,cast([Graduates at ISCED 5 - foreigner] as float)
      ,cast([Graduates at ISCED 5 - women] as float)
      ,cast([Graduates at ISCED 5 - mobility unclassified] as float)
      ,cast([Graduates at ISCED 5 - citizenship unclassified] as float)
      ,cast([Graduates at ISCED 5 - Social sciences, journalism and information] as float)
      ,[Flag Graduates ISCED 5 - mobility]
      ,cast([Graduates at ISCED 5 - Agriculture, forestry, fisheries and veterinary] as float)
      ,cast([Graduates at ISCED 5 - Business, administration and law] as float)
      ,cast([Graduates at ISCED 5 - under 20 years old] as float)
      ,cast([Graduates at ISCED 5 - Health and welfare] as float)
      ,cast([Graduates at ISCED 5 - Age goup unclassified] as float)
      ,[Flag Graduates ISCED 5 - gender] 
      ,cast([Graduates at ISCED 6 - men] as float)
      ,[Flag Graduates at ISCED 5 - Age group]
      ,cast([Graduates at ISCED 5 - resident] as float)
      ,cast([Graduates at ISCED 6 - foreigner] as float)
      ,cast([Graduates at ISCED 5 - Education] as float)
      ,cast([Graduates at ISCED 6 - women] as float)
      ,cast([Graduates at ISCED 6 - mobility unclassified] as float)
      ,cast([Graduates at ISCED 5 - gender unclassified] as float)
      ,cast([Graduates at ISCED 5 - Information and Communication Technologies] as float)
      ,cast([Graduates at ISCED 5 - ISCED-FoE unclassified] as float)
      ,cast([Graduates at ISCED 6 - Social sciences, journalism and information] as float)
      ,[Flag Graduates ISCED 5 - citizenship]
      ,cast([Graduates at ISCED 5 - between 25 and 29 years old] as float)
      ,cast([Graduates at ISCED 6 - Agriculture, forestry, fisheries and veterinary] as float)
      ,cast([Graduates at ISCED 6 - citizenship unclassified] as float)
      ,[Flag Graduates ISCED 6 - mobility]
      ,cast([Graduates at ISCED 6 - under 20 years old] as float)
      ,[Flag Total graduates ISCED 5]
      ,cast([Graduates at ISCED 6 - Business, administration and law] as float)
      ,cast([Graduates at ISCED 6 - Age goup unclassified] as float)
      ,cast([Graduates at ISCED 5 - Generic programmes and qualifications] as float)
      ,cast([Graduates at ISCED 5 - Natural sciences, mathematics and statistics] as float)
      ,[Flag Graduates ISCED 6 - gender]
      ,cast([Graduates at ISCED 6 - Health and welfare] as float)
      ,cast([Graduates at ISCED 7 - men] as float)
      ,cast([Graduates at ISCED 6 - resident] as float)
      ,cast([Graduates at ISCED 5 - Services] as float)
      ,cast([Graduates at ISCED 7 - foreigner] as float)
      ,cast([Graduates at ISCED 5 - between 22 and 24 years old] as float)
      ,cast([Graduates at ISCED 6 - Education] as float)
      ,cast([Total graduates at ISCED 5] as float)
      ,cast([Graduates at ISCED 6 - Information and Communication Technologies] as float)
      ,[Flag Graduates at ISCED 6 - Age group]
      ,cast([Graduates at ISCED 6 - ISCED-FoE unclassified] as float)
      ,cast([Graduates at ISCED 6 - between 25 and 29 years old] as float)
      ,cast([Graduates at ISCED 7 - mobility unclassified] as float)
      ,[Flag Total graduates ISCED 6]
      ,cast([Graduates at ISCED 7 - Social sciences, journalism and information] as float)
      ,cast([Graduates at ISCED 6 - gender unclassified] as float)
      ,cast([Graduates at ISCED 7 - women] as float)
      ,[Flag Graduates ISCED 6 - citizenship] 
      ,[Flag Graduates ISCED 7 - gender]
      ,cast([Graduates at ISCED 7 - citizenship unclassified] as float)
      ,cast([Graduates at ISCED 6 - Generic programmes and qualifications] as float)
      ,cast([Graduates at ISCED 7 - resident] as float)
      ,cast([Graduates at ISCED 7 - Agriculture, forestry, fisheries and veterinary] as float)
      ,cast([Graduates at ISCED 6 - Natural sciences, mathematics and statistics] as float)
      ,cast([Graduates at ISCED 6 - Services] as float)
      ,cast([Graduates at ISCED 7 - Education] as float)
      ,cast([Graduates at ISCED 6 - between 22 and 24 years old] as float)
      ,cast([Graduates at ISCED 7 - under 20 years old] as float)
      ,cast([Graduates at ISCED 7 - Information and Communication Technologies] as float)
      ,[Flag Graduates ISCED 7 - mobility]
      ,cast([Total graduates at ISCED 6] as float)
      ,cast([Graduates at ISCED 7 - gender unclassified] as float)
      ,cast([Graduates at ISCED 7 - Business, administration and law] as float)
      ,cast([Graduates at ISCED 7 - Age goup unclassified] as float)
      ,[Flag Graduates ISCED 7 - citizenship]
      ,cast([Graduates at ISCED 5 - national] as float)
      ,cast([Graduates at ISCED 7 long degree - men] as float)
      ,cast([Graduates at ISCED 7 - ISCED-FoE unclassified] as float)
      ,cast([Graduates at ISCED 7 - Generic programmes and qualifications] as float)
      ,cast([Graduates at ISCED 7 - between 25 and 29 years old] as float)
      ,cast([Graduates at ISCED 7 - Natural sciences, mathematics and statistics] as float)
      ,cast([Graduates at ISCED 7 - Health and welfare] as float)
      ,cast([Graduates at ISCED 7 - Services] as float)
      ,cast([Graduates at ISCED 5 - mobile] as float)
      ,cast([Graduates at ISCED 7 long degree - foreigner] as float)
      ,cast([Graduates at ISCED 7 - between 22 and 24 years old] as float)
      ,cast([Graduates at ISCED 5 - Arts and Humanities] as float)
      ,[Flag Total graduates ISCED 7] 
      ,[Flag Graduates at ISCED 7 - Age group]
      ,cast([Total graduates at ISCED 7] as float)
      ,cast([Graduates at ISCED 5 - Engineering, manufacturing and construction] as float)
      ,cast([Graduates ISCED7 long degree-mobility unclassified] as float)
      ,[Flag Graduates ISCED 7 long degree - gender]
      ,cast([Graduates ISCED 7 long degree-gender unclassified] as float)
      ,cast([Graduates at ISCED 7 long degree - Social sciences, journalism and information] as float)
      ,[Flag Graduates ISCED 7 long degree - citizenship]
      ,cast([Graduates at ISCED 7 long degree - Generic programmes and qualifications] as float)
      ,cast([Graduates at ISCED 7 long degree - Agriculture, forestry, fisheries and veterinary] as float)
      ,cast([Graduates at ISCED 7 long degree - women] as float)
      ,cast([Graduates at ISCED 7 long degree - Natural sciences, mathematics and statistics] as float)
      ,cast([Graduates at ISCED 7 long degree - resident] as float)
      ,[Flag Graduates ISCED 5 - ISCED-FoE]
      ,cast([Graduates at ISCED 7 long degree - Services] as float)
      ,cast([Graduates ISCED 7 long degree-citiz. unclassified] as float)
      ,cast([Graduates at ISCED 7 long degree - under 20 years old] as float)
      ,cast([Graduates at ISCED 5 - over 29 years old] as float)
      ,cast([Graduates at ISCED 7 long degree - Education] as float)
      ,cast([Graduates at ISCED 7 long degree - Age goup unclassified] as float)
      ,cast([Graduates at ISCED 7 long degree - between 22 and 24 years old] as float)
      ,[Flag Graduates ISCED 7 long degree - mobility]
      ,cast([Graduates at ISCED 5-7 - men] as float)
      ,[Notes on graduates at ISCED 5]
      ,cast([Total graduates at ISCED 7 long degree] as float)
      ,cast([Graduates at ISCED 7 long degree - Business, administration and law] as float)
      ,cast([Graduates at ISCED 5-7 - foreigner] as float)
      ,cast([Graduates at ISCED 6 - national] as float)
      ,cast([Graduates at ISCED 5-7 - gender unclassified] as float)
      ,cast([Graduates at ISCED 7 long degree - Health and welfare] as float)
      ,cast([Graduates at ISCED 6 - mobile] as float)
      ,[Flag Graduates at ISCED 5-7 - citizenship]
      ,cast([Graduates at ISCED 7 long degree - Information and Communication Technologies] as float)
      ,cast([Graduates at ISCED 5-7 - mobility unclassified] as float)
      ,cast([Graduates at ISCED 5-7 - Generic programmes and qualifications] as float)
      ,cast([Graduates at ISCED 5-7 - Natural sciences, mathematics and statistics] as float)
      ,cast([Graduates ISCED7 long degree-ISCED-FoE unclassified] as float)
      ,cast([Graduates at ISCED 5-7 - Services] as float)
      ,cast([Graduates at ISCED 7 long degree - between 25 and 29 years old] as float)
      ,cast([Graduates at ISCED 5-7 - between 22 and 24 years old] as float)
      ,[Flag Total graduates ISCED 7 long degree]
      ,cast([Graduates at ISCED 5-7 - Social sciences, journalism and information] as float)
      ,cast([Graduates at ISCED 6 - Arts and Humanities] as float)
      ,[Flag Graduates at ISCED 7 long degree - Age group]
      ,cast([Total graduates ISCED 5-7] as float)
      ,cast([Graduates at ISCED 5-7 - women] as float)
      ,[Flag Graduates at ISCED 5-7 - gender]
      ,cast([Graduates at ISCED 6 - Engineering, manufacturing and construction] as float)
      ,cast([Graduates at ISCED 5-7 - resident] as float)
      ,cast([Graduates at ISCED 5-7 - Agriculture, forestry, fisheries and veterinary] as float)
      ,cast([Graduates at ISCED 5-7 - Education] as float)
      ,cast([Graduates at ISCED 5-7 - under 20 years old] as float)
      ,cast([Graduates at ISCED 5-7 - Information and Communication Technologies] as float)
      ,cast([Graduates at ISCED 5-7 - citizenship unclassified] as float)
      ,[Flag Graduates ISCED 6 - ISCED-FoE] 
      ,[Flag Graduates at ISCED 5-7 - mobility]
      ,cast([Graduates at ISCED 6 - over 29 years old] as float)
      ,cast([Graduates at ISCED 5-7 - Business, administration and law] as float)
      ,cast([Graduates at ISCED 5-7 - Age goup unclassified] as float)
      ,[Notes on graduates at ISCED 6]
      ,cast([Graduates at ISCED 5-7 - ISCED-FoE unclassified] as float)
      ,cast([Graduates at ISCED 5-7 - Health and welfare] as float)
      ,cast([Graduates at ISCED 7 - national] as float)
      ,[Notes on educational activities (Graduates)]
      ,cast([Graduates at ISCED 5-7 - between 25 and 29 years old] as float)
      ,cast([Graduates at ISCED 7 - mobile] as float)
      ,[Flag Graduates at ISCED 5-7 - Age group]
      ,cast([Graduates at ISCED 7 - Arts and Humanities] as float)
      ,cast([Graduates at ISCED 7 - Engineering, manufacturing and construction] as float)
      ,[Flag Total graduates ISCED 5-7]
      ,[Flag Graduates ISCED 7 - ISCED-FoE]
      ,cast([Graduates at ISCED 7 - over 29 years old] as float)
      ,[Notes on graduates at ISCED 7]
      ,cast([Graduates at ISCED 7 long degree - national] as float)
      ,cast([Graduates at ISCED 7 long degree - mobile] as float)
      ,cast([Graduates at ISCED 7 long degree - Arts and Humanities] as float)
      ,cast([Graduates at ISCED 7 long degree - Engineering, manufacturing and construction] as float)
      ,[Flag Graduates ISCED 7 long degree - ISCED-FoE]
      ,cast([Graduates at ISCED 7 long degree - over 29 years old] as float)
      ,[Notes on graduates at ISCED 7 long degree]
      ,cast([Graduates at ISCED 5-7 - national] as float)
      ,cast([Graduates at ISCED 5-7 - mobile] as float)
      ,cast([Graduates at ISCED 5-7 - Arts and Humanities] as float)
      ,cast([Graduates at ISCED 5-7 - Engineering, manufacturing and construction] as float)
      ,[Flag Graduates at ISCED 5-7 - ISCED-FoE]
      ,cast([Graduates at ISCED 5-7 - over 29 years old] as float)
      ,[Notes on total graduates ISCED 5-7]
	  ,SUSER_NAME()
	  ,'ETL: p_lataa_f_eter_graduates' 
	  ,getdate()
FROM [ANTERO].[sa].[sa_eter_graduates]



GO

USE [ANTERO]