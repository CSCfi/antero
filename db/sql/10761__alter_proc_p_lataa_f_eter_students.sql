USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_eter_students]    Script Date: 24.4.2025 9.13.45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER PROCEDURE [dw].[p_lataa_f_eter_students] AS

TRUNCATE TABLE dw.f_eter_students

INSERT INTO ANTERO.dw.f_eter_students (
	   [ETER_ID]
      ,[Lowest degree delivered]
      ,[Flag Students ISCED 5 - gender]
      ,[Students enrolled at ISCED 5 - men]
      ,[Students enrolled at ISCED 5 - resident]
      ,[Students enrolled at ISCED 5 - gender unclassified]
      ,[Highest degree delivered]
      ,[Students enrolled at ISCED 5 - Education]
      ,[Flag Students ISCED 5 - citizenship]
      ,[Students enrolled at ISCED 5 - foreigner]
      ,[Students enrolled at ISCED 5 - Information and Communication Technologies]
      ,[Students enrolled at ISCED 5 - national]
      ,[Students enrolled at ISCED 5 - Generic programmes and qualifications]
      ,[Students enrolled at ISCED 5-mobility unclassified]
      ,[Students enrolled at ISCED 5-ISCED-FoE unclassified]
      ,[Students enrolled at ISCED 5 - Natural sciences, mathematics and statistics]
      ,[Students enrolled at ISCED 5 - mobile]
      ,[Students enrolled at ISCED 5 - Social sciences, journalism and information]
      ,[Flag Students ISCED 5 - part-time, full-time]
      ,[Students enrolled at ISCED 5 - Services]
      ,[Students enrolled at ISCED 5 - Arts and Humanities]
      ,[Students enrolled at ISCED 5 - Agriculture, forestry, fisheries and veterinary]
      ,[Students enrolled at ISCED 5 - over 29 years old]
      ,[Students enrolled at ISCED 5 - Engineering, manufacturing and construction]
      ,[Students enrolled at ISCED 5 - part-, full-time unclassified]
      ,[Students enrolled at ISCED 5 - between 25 and 29 years old]
      ,[Flag Students ISCED 5 - ISCED-FoE]
      ,[Notes on students enrolled at ISCED 5]
      ,[Students enrolled at ISCED 5 - part-time]
      ,[Students enrolled at ISCED 5 - under 20 years old]
      ,[Flag Total students ISCED 5]
      ,[Students enrolled at ISCED 6 - national]
      ,[Students enrolled at ISCED 6 - mobile]
      ,[Students enrolled at ISCED 5 - Age goup unclassified]
      ,[Flag Students ISCED 5 - Age group]
      ,[Students enrolled at ISCED 6 - Arts and Humanities]
      ,[Flag Students ISCED 6 - gender]
      ,[Students enrolled at ISCED 6 - resident]
      ,[Students enrolled at ISCED 6 - men]
      ,[Students enrolled at ISCED 6 - women]
      ,[Students enrolled at ISCED 6 - Engineering, manufacturing and construction]
      ,[Students enrolled at ISCED 6 - Education]
      ,[Students at ISCED 6-citizenship unclassified]
      ,[Students enrolled at ISCED 6 - foreigner]
      ,[Flag Students ISCED 6 - ISCED-FoE]
      ,[Students enrolled at ISCED 6 - Information and Communication Technologies]
      ,[Students at ISCED 6 - mobility unclassified]
      ,[Flag Students ISCED 6 - mobility]
      ,[Students enrolled at ISCED 6 - under 20 years old]
      ,[Students at ISCED 6 - ISCED-FoE unclassified]
      ,[Students enrolled at ISCED 6 - Social sciences, journalism and information]
      ,[Students enrolled at ISCED 6 - Age goup unclassified]
      ,[Students enrolled at ISCED 6 - Business, administration and law]
      ,[Students enrolled at ISCED 7 - men]
      ,[Flag Students ISCED 6 - part-time, full-time]
      ,[Students enrolled at ISCED 6 - Health and welfare]
      ,[Students enrolled at ISCED 6 - Agriculture, forestry, fisheries and veterinary]
      ,[Students enrolled at ISCED 6 - over 29 years old]
      ,[Students enrolled at ISCED 6 - full-time]
      ,[Students enrolled at ISCED 7 - foreigner]
      ,[Students enrolled at ISCED 5 - women]
      ,[Students enrolled at ISCED 6 - part-time]
      ,[Notes on students enrolled at ISCED 6]
      ,[Students enrolled at ISCED 6 - between 22 and 24 years old]
      ,[Students at ISCED 7 - mobility unclassified]
      ,[Students enrolled at ISCED 7 - national]
      ,[Total students enrolled at ISCED 6]
      ,[Students enrolled at ISCED 7 - Social sciences, journalism and information]
      ,[Students at ISCED 5-citizenship unclassified]
      ,[Students enrolled at ISCED 7 - gender unclassified]
      ,[Students enrolled at ISCED 7 - mobile]
      ,[Students enrolled at ISCED 7 - Agriculture, forestry, fisheries and veterinary]
      ,[Flag Students ISCED 5 - mobility]
      ,[Students enrolled at ISCED 7 - Arts and Humanities]
      ,[Students enrolled at ISCED 7 - part-time]
      ,[Flag Students ISCED 6 - Age group]
      ,[Students enrolled at ISCED 5 - Business, administration and law]
      ,[Students enrolled at ISCED 7 - Engineering, manufacturing and construction]
      ,[Flag Students ISCED 7 - citizenship]
      ,[Students enrolled at ISCED 7 - Generic programmes and qualifications]
      ,[Students enrolled at ISCED 7 - women]
      ,[Flag Students ISCED 7 - ISCED-FoE]
      ,[Flag Students ISCED 7 - Age group]
      ,[Students enrolled at ISCED 5 - Health and welfare]
      ,[Students enrolled at ISCED 7 - Natural sciences, mathematics and statistics]
      ,[Students at ISCED 7-citizenship unclassified]
      ,[Students enrolled at ISCED 7 - under 20 years old]
      ,[Students enrolled ISCED 7 long degree - women]
      ,[Students enrolled at ISCED 5 - full-time]
      ,[Flag Students ISCED 7 - mobility]
      ,[Students enrolled at ISCED 7 - Services]
      ,[Students ISCED7 long degree-citiz. unclassified]
      ,[Students enrolled at ISCED 7 - Age goup unclassified]
      ,[Students enrolled at ISCED 7 - Business, administration and law]
      ,[Students enrolled at ISCED 5 - between 22 and 24 years old]
      ,[Students enrolled at ISCED 7 - part-, full-time unclassified]
      ,[Total students enrolled at ISCED 5]
      ,[Students enrolled at ISCED 7 - Health and welfare]
      ,[Students enrolled ISCED 7 long degree - men]
      ,[Students enrolled at ISCED 7 - between 25 and 29 years old]
      ,[Students enrolled at ISCED 6 - gender unclassified]
      ,[Flag Students ISCED 7 long degree - mobility]
      ,[Students enrolled at ISCED 7 - full-time]
      ,[Students enrolled ISCED 7 long degree - foreigner]
      ,[Flag Total students ISCED 7]
      ,[Students ISCED 7 long degree-mobility unclassified]
      ,[Flag Students ISCED 6 - citizenship]
      ,[Students enrolled ISCED 7 long degree - Business, administration and law]
      ,[Students enrolled at ISCED 7 - between 22 and 24 years old]
      ,[Flag Students ISCED 7 long degree - gender]
      ,[Students enrolled ISCED 7 long degree - Social sciences, journalism and information]
      ,[Students enrolled at ISCED 6 - Generic programmes and qualifications]
      ,[Students enrolled ISCED 7 long degree - Health and welfare]
      ,[Total students enrolled at ISCED 7]
      ,[Students enrolled ISCED 7 long degree - resident]
      ,[Students enrolled at ISCED 6 - Natural sciences, mathematics and statistics]
      ,[Students enrolled at ISCED 7 long degree - full-time]
      ,[Students enrolled ISCED 7 long degree - Agriculture, forestry, fisheries and veterinary]
      ,[Students ISCED 7 long degree - gender unclassified]
      ,[Students enrolled ISCED 7 long degree - Education]
      ,[Students enrolled at ISCED 6 - Services]
      ,[Students enrolled at ISCED 7 long degree - part-time]
      ,[Students enrolled at ISCED 7 long degree - between 22 and 24 years old]
      ,[Flag Students ISCED 7 long degree - citizenship]
      ,[Students enrolled ISCED 7 long degree - Information and Communication Technologies]
      ,[Total students enrolled ISCED 7 long degree]
      ,[Students enrolled at ISCED 6 - part-, full-time unclassified]
      ,[Students enrolled at ISCED 6 - between 25 and 29 years old]
      ,[Students ISCED7 long degree - ISCED-FoE unclassified]
      ,[Flag Students ISCED 7 long degree - Age group]
      ,[Students enrolled at ISCED 5-7 - gender unclassified]
      ,[Students enrolled ISCED 7 long degree - Generic programmes and qualifications]
      ,[Flag Students ISCED 7 long degree - part-time, full-time]
      ,[Flag Total students ISCED 6]
      ,[Students enrolled at ISCED 5-7 - women]
      ,[Flag students enrolled at ISCED 5-7 - citizenship]
      ,[Students enrolled ISCED 7 long degree - Natural sciences, mathematics and statistics]
      ,[Students enrolled at ISCED 7 long degree - over 29 years old]
      ,[Flag Students ISCED 7 - gender]
      ,[Students enrolled at ISCED 5-7 - Generic programmes and qualifications]
      ,[Students enrolled at ISCED 5-7 - citizenship unclassified]
      ,[Students enrolled ISCED 7 long degree - Services]
      ,[Students enrolled at ISCED 7 - resident]
      ,[Notes on students enrolled at ISCED 7 long degree]
      ,[Flag students enrolled at ISCED 5-7 - mobility]
      ,[Students enrolled at ISCED 5-7 - Natural sciences, mathematics and statistics]
      ,[Students enrolled at ISCED 7 long degree - part-, full-time unclassified]
      ,[Students enrolled at ISCED 7 - Education]
      ,[Students enrolled at ISCED 5-7 - Services]
      ,[Students enrolled at ISCED 5-7 - national]
      ,[Students enrolled at ISCED 5-7 - Business, administration and law]
      ,[Students enrolled at ISCED 7 long degree - between 25 and 29 years old]
      ,[Students enrolled at ISCED 5-7 - Health and welfare]
      ,[Students enrolled at ISCED 5-7 - part-, full-time unclassified]
      ,[Students enrolled at ISCED 5-7 - full-time]
      ,[Students enrolled at ISCED 7 - Information and Communication Technologies]
      ,[Students enrolled at ISCED 5-7 - between 22 and 24 years old]
      ,[Flag Total students ISCED 7 long degree]
      ,[Total students enrolled ISCED 5-7]
      ,[Students at ISCED 7 - ISCED-FoE unclassified]
      ,[Students enrolled at ISCED 5-7 - between 25 and 29 years old]
      ,[Flag students enrolled at ISCED 5-7 - gender]
      ,[Flag Students ISCED 7 - part-time, full-time]
      ,[Students enrolled at ISCED 5-7 - mobile]
      ,[Flag Total students ISCED 5-7]
      ,[Students enrolled at ISCED 5-7 - resident]
      ,[Students enrolled at ISCED 7 - over 29 years old]
      ,[Students enrolled at ISCED 5-7 - Arts and Humanities]
      ,[Students enrolled at ISCED 5-7 - Education]
      ,[Students enrolled at ISCED 5-7 - Engineering, manufacturing and construction]
      ,[Notes on students enrolled at ISCED 7]
      ,[Students enrolled ISCED 7 long degree - national]
      ,[Flag students enrolled at ISCED 5-7 - ISCED-FoE]
      ,[Students enrolled at ISCED 5-7 - Information and Communication Technologies]
      ,[Students enrolled ISCED 7 long degree - mobile]
      ,[Students enrolled at ISCED 5-7 - ISCED-FoE unclassified]
      ,[Students enrolled at ISCED 5-7 - under 20 years old]
      ,[Flag Students ISCED 5-7 - part-time, full-time]
      ,[Students enrolled at ISCED 5-7 - Age goup unclassified]
      ,[Students enrolled ISCED 7 long degree - Arts and Humanities]
      ,[Distance education institution]
      ,[Students enrolled ISCED 7 long degree - Engineering, manufacturing and construction]
      ,[Students enrolled at ISCED 5-7 - over 29 years old]
      ,[Flag Students ISCED 7 long degree - ISCED-FoE]
      ,[Notes on total students enrolled ISCED 5-7]
      ,[Students enrolled at ISCED 7 long degree - under 20 years old]
      ,[Students enrolled at ISCED 7 long degree - Age goup unclassified]
      ,[Students enrolled at ISCED 5-7 - men]
      ,[Students enrolled at ISCED 5-7 - foreigner]
      ,[Students enrolled at ISCED 5-7 - mobility unclassified]
      ,[Students enrolled at ISCED 5-7 - Social sciences, journalism and information]
      ,[Students enrolled at ISCED 5-7 - Agriculture, forestry, fisheries and veterinary]
      ,[Students enrolled at ISCED 5-7 - part-time]
      ,[Flag Students ISCED 5-7 - Age group]
      ,[Notes on educational activities (Students)]
      ,[username]
      ,[source]
      ,[loadtime])
SELECT
	   [ETER_ID]
      ,[Lowest degree delivered]
      ,[Flag Students ISCED 5 - gender]
      ,cast([Students enrolled at ISCED 5 - men] as float)
      ,cast([Students enrolled at ISCED 5 - resident] as float)
      ,cast([Students enrolled at ISCED 5 - gender unclassified] as float)
      ,[Highest degree delivered]
      ,cast([Students enrolled at ISCED 5 - Education] as float)
      ,[Flag Students ISCED 5 - citizenship]
      ,cast([Students enrolled at ISCED 5 - foreigner] as float)
      ,cast([Students enrolled at ISCED 5 - Information and Communication Technologies] as float)
      ,cast([Students enrolled at ISCED 5 - national] as float)
      ,cast([Students enrolled at ISCED 5 - Generic programmes and qualifications] as float)
      ,cast([Students enrolled at ISCED 5-mobility unclassified] as float)
      ,cast([Students enrolled at ISCED 5-ISCED-FoE unclassified] as float)
      ,cast([Students enrolled at ISCED 5 - Natural sciences, mathematics and statistics] as float)
      ,cast([Students enrolled at ISCED 5 - mobile] as float)
      ,cast([Students enrolled at ISCED 5 - Social sciences, journalism and information] as float)
      ,[Flag Students ISCED 5 - part-time, full-time]
      ,cast([Students enrolled at ISCED 5 - Services] as float)
      ,cast([Students enrolled at ISCED 5 - Arts and Humanities] as float)
      ,cast([Students enrolled at ISCED 5 - Agriculture, forestry, fisheries and veterinary] as float)
      ,cast([Students enrolled at ISCED 5 - over 29 years old] as float)
      ,cast([Students enrolled at ISCED 5 - Engineering, manufacturing and construction] as float)
      ,cast([Students enrolled at ISCED 5 - part-, full-time unclassified] as float)
      ,cast([Students enrolled at ISCED 5 - between 25 and 29 years old] as float)
      ,[Flag Students ISCED 5 - ISCED-FoE]
      ,[Notes on students enrolled at ISCED 5]
      ,cast([Students enrolled at ISCED 5 - part-time] as float)
      ,cast([Students enrolled at ISCED 5 - under 20 years old] as float)
      ,[Flag Total students ISCED 5] 
      ,cast([Students enrolled at ISCED 6 - national] as float)
      ,cast([Students enrolled at ISCED 6 - mobile] as float)
      ,cast([Students enrolled at ISCED 5 - Age goup unclassified] as float)
      ,[Flag Students ISCED 5 - Age group]
      ,cast([Students enrolled at ISCED 6 - Arts and Humanities] as float)
      ,[Flag Students ISCED 6 - gender]
      ,cast([Students enrolled at ISCED 6 - resident] as float)
      ,cast([Students enrolled at ISCED 6 - men] as float)
      ,cast([Students enrolled at ISCED 6 - women] as float)
      ,cast([Students enrolled at ISCED 6 - Engineering, manufacturing and construction] as float)
      ,cast([Students enrolled at ISCED 6 - Education] as float)
      ,cast([Students at ISCED 6-citizenship unclassified] as float)
      ,cast([Students enrolled at ISCED 6 - foreigner] as float)
      ,[Flag Students ISCED 6 - ISCED-FoE]
      ,cast([Students enrolled at ISCED 6 - Information and Communication Technologies] as float)
      ,cast([Students at ISCED 6 - mobility unclassified] as float)
      ,[Flag Students ISCED 6 - mobility]
      ,cast([Students enrolled at ISCED 6 - under 20 years old] as float)
      ,cast([Students at ISCED 6 - ISCED-FoE unclassified] as float)
      ,cast([Students enrolled at ISCED 6 - Social sciences, journalism and information] as float)
      ,cast([Students enrolled at ISCED 6 - Age goup unclassified] as float)
      ,cast([Students enrolled at ISCED 6 - Business, administration and law] as float)
      ,cast([Students enrolled at ISCED 7 - men] as float)
      ,[Flag Students ISCED 6 - part-time, full-time]
      ,cast([Students enrolled at ISCED 6 - Health and welfare] as float)
      ,cast([Students enrolled at ISCED 6 - Agriculture, forestry, fisheries and veterinary] as float)
      ,cast([Students enrolled at ISCED 6 - over 29 years old] as float)
      ,cast([Students enrolled at ISCED 6 - full-time] as float)
      ,cast([Students enrolled at ISCED 7 - foreigner] as float)
      ,cast([Students enrolled at ISCED 5 - women] as float)
      ,cast([Students enrolled at ISCED 6 - part-time] as float)
      ,[Notes on students enrolled at ISCED 6]
      ,cast([Students enrolled at ISCED 6 - between 22 and 24 years old] as float)
      ,cast([Students at ISCED 7 - mobility unclassified] as float)
      ,cast([Students enrolled at ISCED 7 - national] as float)
      ,cast([Total students enrolled at ISCED 6] as float)
      ,cast([Students enrolled at ISCED 7 - Social sciences, journalism and information] as float)
      ,cast([Students at ISCED 5-citizenship unclassified] as float)
      ,cast([Students enrolled at ISCED 7 - gender unclassified] as float)
      ,cast([Students enrolled at ISCED 7 - mobile] as float)
      ,cast([Students enrolled at ISCED 7 - Agriculture, forestry, fisheries and veterinary] as float)
      ,[Flag Students ISCED 5 - mobility] 
      ,cast([Students enrolled at ISCED 7 - Arts and Humanities] as float)
      ,cast([Students enrolled at ISCED 7 - part-time] as float)
      ,[Flag Students ISCED 6 - Age group] 
      ,cast([Students enrolled at ISCED 5 - Business, administration and law] as float)
      ,cast([Students enrolled at ISCED 7 - Engineering, manufacturing and construction] as float)
      ,[Flag Students ISCED 7 - citizenship]
      ,cast([Students enrolled at ISCED 7 - Generic programmes and qualifications] as float)
      ,cast([Students enrolled at ISCED 7 - women] as float)
      ,[Flag Students ISCED 7 - ISCED-FoE] 
      ,[Flag Students ISCED 7 - Age group]
      ,cast([Students enrolled at ISCED 5 - Health and welfare] as float)
      ,cast([Students enrolled at ISCED 7 - Natural sciences, mathematics and statistics] as float)
      ,cast([Students at ISCED 7-citizenship unclassified] as float)
      ,cast([Students enrolled at ISCED 7 - under 20 years old] as float)
      ,cast([Students enrolled ISCED 7 long degree - women] as float)
      ,cast([Students enrolled at ISCED 5 - full-time] as float)
      ,[Flag Students ISCED 7 - mobility]
      ,cast([Students enrolled at ISCED 7 - Services] as float)
      ,cast([Students ISCED7 long degree-citiz. unclassified] as float)
      ,cast([Students enrolled at ISCED 7 - Age goup unclassified] as float)
      ,cast([Students enrolled at ISCED 7 - Business, administration and law] as float)
      ,cast([Students enrolled at ISCED 5 - between 22 and 24 years old] as float)
      ,cast([Students enrolled at ISCED 7 - part-, full-time unclassified] as float)
      ,cast([Total students enrolled at ISCED 5] as float)
      ,cast([Students enrolled at ISCED 7 - Health and welfare] as float)
      ,cast([Students enrolled ISCED 7 long degree - men] as float)
      ,cast([Students enrolled at ISCED 7 - between 25 and 29 years old] as float)
      ,cast([Students enrolled at ISCED 6 - gender unclassified] as float)
      ,[Flag Students ISCED 7 long degree - mobility]
      ,cast([Students enrolled at ISCED 7 - full-time] as float)
      ,cast([Students enrolled ISCED 7 long degree - foreigner] as float)
      ,[Flag Total students ISCED 7] 
      ,cast([Students ISCED 7 long degree-mobility unclassified] as float)
      ,[Flag Students ISCED 6 - citizenship] 
      ,cast([Students enrolled ISCED 7 long degree - Business, administration and law] as float)
      ,cast([Students enrolled at ISCED 7 - between 22 and 24 years old] as float)
      ,[Flag Students ISCED 7 long degree - gender] 
      ,cast([Students enrolled ISCED 7 long degree - Social sciences, journalism and information] as float)
      ,cast([Students enrolled at ISCED 6 - Generic programmes and qualifications] as float)
      ,cast([Students enrolled ISCED 7 long degree - Health and welfare] as float)
      ,cast([Total students enrolled at ISCED 7] as float)
      ,cast([Students enrolled ISCED 7 long degree - resident] as float)
      ,cast([Students enrolled at ISCED 6 - Natural sciences, mathematics and statistics] as float)
      ,cast([Students enrolled at ISCED 7 long degree - full-time] as float)
      ,cast([Students enrolled ISCED 7 long degree - Agriculture, forestry, fisheries and veterinary] as float)
      ,cast([Students ISCED 7 long degree - gender unclassified] as float)
      ,cast([Students enrolled ISCED 7 long degree - Education] as float)
      ,cast([Students enrolled at ISCED 6 - Services] as float)
      ,cast([Students enrolled at ISCED 7 long degree - part-time] as float)
      ,cast([Students enrolled at ISCED 7 long degree - between 22 and 24 years old] as float)
      ,[Flag Students ISCED 7 long degree - citizenship]
      ,cast([Students enrolled ISCED 7 long degree - Information and Communication Technologies] as float)
      ,cast([Total students enrolled ISCED 7 long degree] as float)
      ,cast([Students enrolled at ISCED 6 - part-, full-time unclassified] as float)
      ,cast([Students enrolled at ISCED 6 - between 25 and 29 years old] as float)
      ,cast([Students ISCED7 long degree - ISCED-FoE unclassified] as float)
      ,[Flag Students ISCED 7 long degree - Age group]
      ,cast([Students enrolled at ISCED 5-7 - gender unclassified] as float)
      ,cast([Students enrolled ISCED 7 long degree - Generic programmes and qualifications] as float)
      ,[Flag Students ISCED 7 long degree - part-time, full-time] 
      ,[Flag Total students ISCED 6] 
      ,cast([Students enrolled at ISCED 5-7 - women] as float)
      ,[Flag students enrolled at ISCED 5-7 - citizenship]
      ,cast([Students enrolled ISCED 7 long degree - Natural sciences, mathematics and statistics] as float)
      ,cast([Students enrolled at ISCED 7 long degree - over 29 years old] as float)
      ,[Flag Students ISCED 7 - gender]
      ,cast([Students enrolled at ISCED 5-7 - Generic programmes and qualifications] as float)
      ,cast([Students enrolled at ISCED 5-7 - citizenship unclassified] as float)
      ,cast([Students enrolled ISCED 7 long degree - Services] as float)
      ,cast([Students enrolled at ISCED 7 - resident] as float)
      ,[Notes on students enrolled at ISCED 7 long degree] 
      ,[Flag students enrolled at ISCED 5-7 - mobility]
      ,cast([Students enrolled at ISCED 5-7 - Natural sciences, mathematics and statistics] as float)
      ,cast([Students enrolled at ISCED 7 long degree - part-, full-time unclassified] as float)
      ,cast([Students enrolled at ISCED 7 - Education] as float)
      ,cast([Students enrolled at ISCED 5-7 - Services] as float)
      ,cast([Students enrolled at ISCED 5-7 - national] as float)
      ,cast([Students enrolled at ISCED 5-7 - Business, administration and law] as float)
      ,cast([Students enrolled at ISCED 7 long degree - between 25 and 29 years old] as float)
      ,cast([Students enrolled at ISCED 5-7 - Health and welfare] as float)
      ,cast([Students enrolled at ISCED 5-7 - part-, full-time unclassified] as float)
      ,cast([Students enrolled at ISCED 5-7 - full-time] as float)
      ,cast([Students enrolled at ISCED 7 - Information and Communication Technologies] as float)
      ,cast([Students enrolled at ISCED 5-7 - between 22 and 24 years old] as float)
      ,[Flag Total students ISCED 7 long degree] 
      ,coalesce(cast([Total students enrolled ISCED 5-7] as float), cast([Total students enrolled at ISCED 5] as float) + cast([Total students enrolled at ISCED 6] as float) + cast([Total students enrolled at ISCED 7] as float))  
      ,cast([Students at ISCED 7 - ISCED-FoE unclassified] as float)
      ,cast([Students enrolled at ISCED 5-7 - between 25 and 29 years old] as float)
      ,[Flag students enrolled at ISCED 5-7 - gender]
      ,[Flag Students ISCED 7 - part-time, full-time] 
      ,cast([Students enrolled at ISCED 5-7 - mobile] as float)
      ,[Flag Total students ISCED 5-7] 
      ,cast([Students enrolled at ISCED 5-7 - resident] as float)
      ,cast([Students enrolled at ISCED 7 - over 29 years old] as float)
      ,cast([Students enrolled at ISCED 5-7 - Arts and Humanities] as float)
      ,cast([Students enrolled at ISCED 5-7 - Education] as float)
      ,cast([Students enrolled at ISCED 5-7 - Engineering, manufacturing and construction] as float)
      ,[Notes on students enrolled at ISCED 7]
      ,cast([Students enrolled ISCED 7 long degree - national] as float)
      ,[Flag students enrolled at ISCED 5-7 - ISCED-FoE]
      ,cast([Students enrolled at ISCED 5-7 - Information and Communication Technologies] as float)
      ,cast([Students enrolled ISCED 7 long degree - mobile] as float)
      ,cast([Students enrolled at ISCED 5-7 - ISCED-FoE unclassified] as float)
      ,cast([Students enrolled at ISCED 5-7 - under 20 years old] as float)
      ,[Flag Students ISCED 5-7 - part-time, full-time]
      ,cast([Students enrolled at ISCED 5-7 - Age goup unclassified] as float)
      ,cast([Students enrolled ISCED 7 long degree - Arts and Humanities] as float)
      ,[Distance education institution] 
      ,cast([Students enrolled ISCED 7 long degree - Engineering, manufacturing and construction] as float)
      ,cast([Students enrolled at ISCED 5-7 - over 29 years old] as float)
      ,[Flag Students ISCED 7 long degree - ISCED-FoE]
      ,[Notes on total students enrolled ISCED 5-7] 
      ,cast([Students enrolled at ISCED 7 long degree - under 20 years old] as float)
      ,cast([Students enrolled at ISCED 7 long degree - Age goup unclassified] as float)
      ,cast([Students enrolled at ISCED 5-7 - men] as float)
      ,cast([Students enrolled at ISCED 5-7 - foreigner] as float)
      ,cast([Students enrolled at ISCED 5-7 - mobility unclassified] as float)
      ,cast([Students enrolled at ISCED 5-7 - Social sciences, journalism and information] as float)
      ,cast([Students enrolled at ISCED 5-7 - Agriculture, forestry, fisheries and veterinary] as float)
      ,cast([Students enrolled at ISCED 5-7 - part-time] as float)
      ,[Flag Students ISCED 5-7 - Age group]
      ,[Notes on educational activities (Students)]
	  ,SUSER_NAME()
	  ,'ETL: p_lataa_f_eter_students' 
	  ,getdate()
FROM [ANTERO].[sa].[sa_eter_students]


GO

USE [ANTERO]