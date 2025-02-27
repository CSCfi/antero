USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_eter_graduates]   ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*
f_eter_graduates information lataus SA-tauluista
25.2.2019
JKO
*/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_eter_graduates]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_eter_graduates] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_f_eter_graduates] AS

TRUNCATE TABLE dw.f_eter_graduates
INSERT INTO dw.f_eter_graduates
(
	[_id]
      ,Graduates_at_ISCED_5_women_code
      ,Graduates_at_ISCED_5_women_value
      ,Graduates_at_ISCED_5_national_code
      ,Graduates_at_ISCED_5_national_value
      ,Graduates_at_ISCED_5_men_code
      ,Graduates_at_ISCED_5_men_value
      ,Graduates_at_ISCED_5_citizenship_unclassified_code
      ,Graduates_at_ISCED_5_citizenship_unclassified_value
      ,Flag_Graduates_ISCED_5_gender_value
      ,Flag_Graduates_ISCED_5_gender_record
      ,Graduates_at_ISCED_5_mobile_code
      ,Graduates_at_ISCED_5_mobile_value
      ,Graduates_at_ISCED_5_foreigner_code
      ,Graduates_at_ISCED_5_foreigner_value
      ,Graduates_at_ISCED_5_resident_code
      ,Graduates_at_ISCED_5_resident_value
      ,Graduates_at_ISCED_5_gender_unclassified_code
      ,Graduates_at_ISCED_5_gender_unclassified_value
      ,Flag_Graduates_ISCED_5_citizenship_value
      ,Flag_Graduates_ISCED_5_citizenship_record
     ,Graduates_at_ISCED_5_mobility_unclassified_code
     ,Graduates_at_ISCED_5_mobility_unclassified_value
     ,Flag_Graduates_ISCED_5_mobility_value
     ,Flag_Graduates_ISCED_5_mobility_record
     ,Graduates_at_ISCED_5_Generic_programmes_and_qualifications_code
     ,Graduates_at_ISCED_5_Generic_programmes_and_qualifications_value
     ,Graduates_at_ISCED_5_Education_code
     ,Graduates_at_ISCED_5_Education_value
     ,Graduates_at_ISCED_5_Social_sciences_journalism_and_information_code
     ,Graduates_at_ISCED_5_Social_sciences_journalism_and_information_value
     ,Graduates_at_ISCED_5_Arts_and_Humanities_code
     ,Graduates_at_ISCED_5_Arts_and_Humanities_value
     ,Graduates_at_ISCED_5_Business_administration_and_law_code
     ,Graduates_at_ISCED_5_Business_administration_and_law_value
     ,Graduates_at_ISCED_5_Natural_sciences_mathematics_and_statistics_code
     ,Graduates_at_ISCED_5_Natural_sciences_mathematics_and_statistics_value
     ,Graduates_at_ISCED_5_Information_and_Communication_Technologies_code
     ,Graduates_at_ISCED_5_Information_and_Communication_Technologies_value
     ,Graduates_at_ISCED_5_Agriculture_forestry_fisheries_and_veterinary_code
     ,Graduates_at_ISCED_5_Agriculture_forestry_fisheries_and_veterinary_value
     ,Graduates_at_ISCED_5_Engineering_manufacturing_and_construction_code
     ,Graduates_at_ISCED_5_Engineering_manufacturing_and_construction_value
     ,Graduates_at_ISCED_5_Health_and_welfare_code
     ,Graduates_at_ISCED_5_Health_and_welfare_value
     ,Graduates_at_ISCED_5_Services_code
     ,Graduates_at_ISCED_5_Services_value
     ,Graduates_at_ISCED_5_ISCED_FoE_unclassified_code
     ,Graduates_at_ISCED_5_ISCED_FoE_unclassified_value
     ,Fotal_graduates_at_ISCED_5_code
     ,Fotal_graduates_at_ISCED_5_value
     ,Flag_Graduates_ISCED_5_ISCED_FoE_value
     ,Flag_Graduates_ISCED_5_ISCED_FoE_record
     ,Flag_Total_graduates_ISCED_5_value
     ,Flag_Total_graduates_ISCED_5_record
     ,Fotes_on_graduates_at_ISCED_5
     ,Graduates_at_ISCED_6_men_code
     ,Graduates_at_ISCED_6_men_value
     ,Graduates_at_ISCED_6_gender_unclassified_code
     ,Graduates_at_ISCED_6_gender_unclassified_value
     ,Graduates_at_ISCED_6_women_code
     ,Graduates_at_ISCED_6_women_value
     ,Flag_Graduates_ISCED_6_gender_value
     ,Flag_Graduates_ISCED_6_gender_record
     ,Graduates_at_ISCED_6_national_code
     ,Graduates_at_ISCED_6_national_value
     ,Graduates_at_ISCED_6_foreigner_code
     ,Graduates_at_ISCED_6_foreigner_value
     ,Flag_Graduates_ISCED_6_citizenship_value
     ,Flag_Graduates_ISCED_6_citizenship_record
     ,Graduates_at_ISCED_6_citizenship_unclassified_code
     ,Graduates_at_ISCED_6_citizenship_unclassified_value
     ,Graduates_at_ISCED_6_resident_code
     ,Graduates_at_ISCED_6_resident_value
     ,Graduates_at_ISCED_6_mobile_code
     ,Graduates_at_ISCED_6_mobile_value
     ,Graduates_at_ISCED_6_mobility_unclassified_code
     ,Graduates_at_ISCED_6_mobility_unclassified_value
     ,Graduates_at_ISCED_6_Generic_programmes_and_qualifications_code
     ,Graduates_at_ISCED_6_Generic_programmes_and_qualifications_value
     ,Flag_Graduates_ISCED_6_mobility_value
     ,Flag_Graduates_ISCED_6_mobility_record
     ,Graduates_at_ISCED_6_Education_code
     ,Graduates_at_ISCED_6_Education_value
     ,Graduates_at_ISCED_6_Arts_and_Humanities_code
     ,Graduates_at_ISCED_6_Arts_and_Humanities_value
     ,Graduates_at_ISCED_6_Social_sciences_journalism_and_information_code
     ,Graduates_at_ISCED_6_Social_sciences_journalism_and_information_value
     ,Graduates_at_ISCED_6_Natural_sciences_mathematics_and_statistics_code
     ,Graduates_at_ISCED_6_Natural_sciences_mathematics_and_statistics_value
     ,Graduates_at_ISCED_6_Business_administration_and_law_code
     ,Graduates_at_ISCED_6_Business_administration_and_law_value
     ,Graduates_at_ISCED_6_Information_and_Communication_Technologies_code
     ,Graduates_at_ISCED_6_Information_and_Communication_Technologies_value
     ,Graduates_at_ISCED_6_Engineering_manufacturing_and_construction_code
     ,Graduates_at_ISCED_6_Engineering_manufacturing_and_construction_value
     ,Graduates_at_ISCED_6_Agriculture_forestry_fisheries_and_veterinary_code
     ,Graduates_at_ISCED_6_Agriculture_forestry_fisheries_and_veterinary_value
     ,Graduates_at_ISCED_6_Services_code
     ,Graduates_at_ISCED_6_Services_value
     ,Graduates_at_ISCED_6_Health_and_welfare_code
     ,Graduates_at_ISCED_6_Health_and_welfare_value
     ,Graduates_at_ISCED_6_ISCED_FoE_unclassified_code
     ,Graduates_at_ISCED_6_ISCED_FoE_unclassified_value
     ,Flag_Graduates_ISCED_6_ISCED_FoE_value
     ,Flag_Graduates_ISCED_6_ISCED_FoE_record
     ,Fotal_graduates_at_ISCED_6_code
     ,Fotal_graduates_at_ISCED_6_value
     ,Flag_Total_graduates_ISCED_6_value
     ,Flag_Total_graduates_ISCED_6_record
	 ,Graduates_at_ISCED_7_men_code
     ,Graduates_at_ISCED_7_men_valu
     ,Graduates_at_ISCED_7_women_code
     ,Graduates_at_ISCED_7_women_value
     ,Graduates_at_ISCED_7_gender_unclassified_code
     ,Graduates_at_ISCED_7_gender_unclassified_value
     ,Flag_Graduates_ISCED_7_gender_value
     ,Flag_Graduates_ISCED_7_gender_record
     ,Graduates_at_ISCED_7_foreigner_code
     ,Graduates_at_ISCED_7_foreigner_value
     ,Fotes_on_graduates_at_ISCED_6_value
     ,Fotes_on_graduates_at_ISCED_6_record
     ,Graduates_at_ISCED_7_national_code
     ,Graduates_at_ISCED_7_national_value
     ,Graduates_at_ISCED_7_citizenship_unclassified_code
     ,Graduates_at_ISCED_7_citizenship_unclassified_value
     ,Flag_Graduates_ISCED_7_citizenship_value
     ,Flag_Graduates_ISCED_7_citizenship_record
     ,Graduates_at_ISCED_7_mobile_code
     ,Graduates_at_ISCED_7_mobile_value
     ,Graduates_at_ISCED_7_resident_code
     ,Graduates_at_ISCED_7_resident_value
     ,Graduates_at_ISCED_7_mobility_unclassified_code
     ,Graduates_at_ISCED_7_mobility_unclassified_value
     ,Flag_Graduates_ISCED_7_mobility_value
     ,Flag_Graduates_ISCED_7_mobility_record
     ,Graduates_at_ISCED_7_Generic_programmes_and_qualifications_code
     ,Graduates_at_ISCED_7_Generic_programmes_and_qualifications_value
     ,Graduates_at_ISCED_7_Arts_and_Humanities_code
     ,Graduates_at_ISCED_7_Arts_and_Humanities_value
     ,Graduates_at_ISCED_7_Education_code
     ,Graduates_at_ISCED_7_Education_value
     ,Graduates_at_ISCED_7_Social_sciences_journalism_and_information_code
     ,Graduates_at_ISCED_7_Social_sciences_journalism_and_information_value
     ,Graduates_at_ISCED_7_Business_administration_and_law_code
     ,Graduates_at_ISCED_7_Business_administration_and_law_value
     ,Graduates_at_ISCED_7_Natural_sciences_mathematics_and_statistics_code
     ,Graduates_at_ISCED_7_Natural_sciences_mathematics_and_statistics_value
     ,Graduates_at_ISCED_7_Engineering_manufacturing_and_construction_code
     ,Graduates_at_ISCED_7_Engineering_manufacturing_and_construction_value
     ,Graduates_at_ISCED_7_Information_and_Communication_Technologies_code
     ,Graduates_at_ISCED_7_Information_and_Communication_Technologies_value
     ,Graduates_at_ISCED_7_Agriculture_forestry_fisheries_and_veterinary_code
     ,Graduates_at_ISCED_7_Agriculture_forestry_fisheries_and_veterinary_value
     ,Graduates_at_ISCED_7_Health_and_welfare_code
     ,Graduates_at_ISCED_7_Health_and_welfare_value
     ,Graduates_at_ISCED_7_Services_code
     ,Graduates_at_ISCED_7_Services_value
     ,Flag_Graduates_ISCED_7_ISCED_FoE_value
     ,Flag_Graduates_ISCED_7_ISCED_FoE_record
     ,Graduates_at_ISCED_7_ISCED_FoE_unclassified_code
     ,Graduates_at_ISCED_7_ISCED_FoE_unclassified_value
     ,Fotal_graduates_at_ISCED_7_code
     ,Fotal_graduates_at_ISCED_7_value
     ,Flag_Total_graduates_ISCED_7_value
     ,Flag_Total_graduates_ISCED_7_record
     ,Fotes_on_graduates_at_ISCED_7
     ,Graduates_at_ISCED_7_long_degree_women_code
     ,Graduates_at_ISCED_7_long_degree_women_value
     ,Graduates_at_ISCED_7_long_degree_men_code
     ,Graduates_at_ISCED_7_long_degree_men_value
     ,Graduates_ISCED_7_long_degree_gender_unclassified_code
     ,Graduates_ISCED_7_long_degree_gender_unclassified_value
     ,Flag_Graduates_ISCED_7_long_degree_gender_value
     ,Flag_Graduates_ISCED_7_long_degree_gender_record
     ,Graduates_at_ISCED_7_long_degree_national_code
     ,Graduates_at_ISCED_7_long_degree_national_value
     ,Graduates_ISCED_7_long_degree_citiz_unclassified_code
     ,Graduates_ISCED_7_long_degree_citiz_unclassified_value
     ,Graduates_at_ISCED_7_long_degree_foreigner_code
     ,Graduates_at_ISCED_7_long_degree_foreigner_value
     ,Flag_Graduates_ISCED_7_long_degree_citizenship_value
     ,Flag_Graduates_ISCED_7_long_degree_citizenship_record
     ,Graduates_at_ISCED_7_long_degree_resident_code
     ,Graduates_at_ISCED_7_long_degree_resident_value
     ,Graduates_at_ISCED_7_long_degree_mobile_code
     ,Graduates_at_ISCED_7_long_degree_mobile_value
     ,Flag_Graduates_ISCED_7_long_degree_mobility_value
     ,Flag_Graduates_ISCED_7_long_degree_mobility_record
     ,Graduates_ISCED7_long_degree_mobility_unclassified_code
     ,Graduates_ISCED7_long_degree_mobility_unclassified_value
     ,Graduates_at_ISCED_7_long_degree_Generic_programmes_and_qualifications_code
     ,Graduates_at_ISCED_7_long_degree_Generic_programmes_and_qualifications_value
     ,Graduates_at_ISCED_7_long_degree_Education_code
     ,Graduates_at_ISCED_7_long_degree_Education_value
     ,Graduates_at_ISCED_7_long_degree_Arts_and_Humanities_code
     ,Graduates_at_ISCED_7_long_degree_Arts_and_Humanities_value
     ,Graduates_at_ISCED_7_long_degree_Business_administration_and_law_code
     ,Graduates_at_ISCED_7_long_degree_Business_administration_and_law_value
     ,Graduates_at_ISCED_7_long_degree_Social_sciences_journalism_and_information_code
     ,Graduates_at_ISCED_7_long_degree_Social_sciences_journalism_and_information_value
     ,Graduates_at_ISCED_7_long_degree_Natural_sciences_mathematics_and_statistics_code
     ,Graduates_at_ISCED_7_long_degree_Natural_sciences_mathematics_and_statistics_value
     ,Graduates_at_ISCED_7_long_degree_Information_and_Communication_Technologies_code
     ,Graduates_at_ISCED_7_long_degree_Information_and_Communication_Technologies_value
     ,Graduates_at_ISCED_7_long_degree_Engineering_manufacturing_and_construction_code
     ,Graduates_at_ISCED_7_long_degree_Engineering_manufacturing_and_construction_value
     ,Graduates_at_ISCED_7_long_degree_Health_and_welfare_code
     ,Graduates_at_ISCED_7_long_degree_Health_and_welfare_value
     ,Graduates_at_ISCED_7_long_degree_Agriculture_forestry_fisheries_and_veterinary_code
     ,Graduates_at_ISCED_7_long_degree_Agriculture_forestry_fisheries_and_veterinary_value
     ,Graduates_at_ISCED_7_long_degree_Services_code
     ,Graduates_at_ISCED_7_long_degree_Services_value
     ,Graduates_at_ISCED_7_ISCED_FoE_unclassified_code
     ,Graduates_at_ISCED_7_ISCED_FoE_unclassified_value
     ,Flag_Graduates_ISCED_7_long_degree_ISCED_FoE_value
     ,Flag_Graduates_ISCED_7_long_degree_ISCED_FoE_record
     ,Flag_Total_graduates_ISCED_7_long_degree_value
     ,Flag_Total_graduates_ISCED_7_long_degree_record
     ,Fotal_graduates_at_ISCED_7_long_degree_code
     ,Fotal_graduates_at_ISCED_7_long_degree_value
     ,Fotes_on_graduates_at_ISCED_7_long_degree_value
     ,Fotes_on_graduates_at_ISCED_7_long_degree_record
	 ,Fotal_graduates_ISCED_5_7_code
     ,Fotal_graduates_ISCED_5_7_value
     ,Flag_Total_graduates_ISCED_5_7_value
     ,Flag_Total_graduates_ISCED_5_7_record
     ,Fotes_on_educational_activities_Graduates
     ,Fotes_on_total_graduates_ISCED_5_7
     ,Graduates_at_ISCED_5_7_men_code
     ,Graduates_at_ISCED_5_7_men_value
     ,Graduates_at_ISCED_5_7_women_code
     ,Graduates_at_ISCED_5_7_women_value
     ,Flag_Graduates_at_ISCED_5_7_gender_value
     ,Flag_Graduates_at_ISCED_5_7_gender_record
     ,Graduates_at_ISCED_5_7_gender_unclassified_code
     ,Graduates_at_ISCED_5_7_gender_unclassified_value
     ,Graduates_at_ISCED_5_7_national_code
     ,Graduates_at_ISCED_5_7_national_value
     ,Graduates_at_ISCED_5_7_foreigner_code
     ,Graduates_at_ISCED_5_7_foreigner_value
     ,Graduates_at_ISCED_5_7_citizenship_unclassified_code
     ,Graduates_at_ISCED_5_7_citizenship_unclassified_value
     ,Graduates_at_ISCED_5_7_resident_code
     ,Graduates_at_ISCED_5_7_resident_value
     ,Flag_Graduates_at_ISCED_5_7_citizenship_value
     ,Flag_Graduates_at_ISCED_5_7_citizenship_record
     ,Graduates_at_ISCED_5_7_mobile_code
     ,Graduates_at_ISCED_5_7_mobile_value
     ,Graduates_at_ISCED_5_7_mobility_unclassified_code
     ,Graduates_at_ISCED_5_7_mobility_unclassified_value
     ,Flag_Graduates_at_ISCED_5_7_mobility_value
     ,Flag_Graduates_at_ISCED_5_7_mobility_record
     ,Graduates_at_ISCED_5_7_Education_code
     ,Graduates_at_ISCED_5_7_Education_value
     ,Graduates_at_ISCED_5_7_Generic_programmes_and_qualifications_code
     ,Graduates_at_ISCED_5_7_Generic_programmes_and_qualifications_value
     ,Graduates_at_ISCED_5_7_Arts_and_Humanities_code
     ,Graduates_at_ISCED_5_7_Arts_and_Humanities_value
     ,Graduates_at_ISCED_5_7_Social_sciences_journalism_and_information_code
     ,Graduates_at_ISCED_5_7_Social_sciences_journalism_and_information_value
     ,Graduates_at_ISCED_5_7_Business_administration_and_law_code
     ,Graduates_at_ISCED_5_7_Business_administration_and_law_value
     ,Graduates_at_ISCED_5_7_Information_and_Communication_Technologies_code
     ,Graduates_at_ISCED_5_7_Information_and_Communication_Technologies_value
     ,Graduates_at_ISCED_5_7_Natural_sciences_mathematics_and_statistics_code
     ,Graduates_at_ISCED_5_7_Natural_sciences_mathematics_and_statistics_value
     ,Graduates_at_ISCED_5_7_Engineering_manufacturing_and_construction_code
     ,Graduates_at_ISCED_5_7_Engineering_manufacturing_and_construction_value
     ,Graduates_at_ISCED_5_7_Agriculture_forestry_fisheries_and_veterinary_code
     ,Graduates_at_ISCED_5_7_Agriculture_forestry_fisheries_and_veterinary_value
     ,Graduates_at_ISCED_5_7_Health_and_welfare_code
     ,Graduates_at_ISCED_5_7_Health_and_welfare_value
     ,Graduates_at_ISCED_5_7_ISCED_FoE_unclassified_code
     ,Graduates_at_ISCED_5_7_ISCED_FoE_unclassified_value
     ,Graduates_at_ISCED_5_7_Services_code
     ,Graduates_at_ISCED_5_7_Services_value
     ,Flag_Graduates_at_ISCED_5_7_ISCED_FoE_value
     ,Flag_Graduates_at_ISCED_5_7_ISCED_FoE_record
     ,Share_of_women_graduates_ISCED_5_7_code
     ,Share_of_women_graduates_ISCED_5_7_value
     ,Flag_Share_of_women_graduates_ISCED_5_7_value
     ,Flag_Share_of_women_graduates_ISCED_5_7_record
     ,Share_of_foreigners_graduates_ISCED_5_7_code
     ,Share_of_foreigners_graduates_ISCED_5_7_value
     ,Flag_Share_of_foreigners_graduates_ISCED_5_7_value
     ,Flag_Share_of_foreigners_graduates_ISCED_5_7_record
     ,Share_of_mobile_graduates_ISCED_5_7_code
     ,Share_of_mobile_graduates_ISCED_5_7_value
     ,Flag_Share_of_mobile_graduates_ISCED_5_7_value
     ,Flag_Share_of_mobile_graduates_ISCED_5_7_record
     ,[username]
     ,[Source]
     ,[Loadtime]
)
  
SELECT
	[_id]
      ,Graduates_at_ISCED_5_women_code=[GRAD.ISCED5WOMEN.code]
      ,Graduates_at_ISCED_5_women_value=[GRAD.ISCED5WOMEN.v]
      ,Graduates_at_ISCED_5_national_code=[GRAD.ISCED5NAT.code]
      ,Graduates_at_ISCED_5_national_value=[GRAD.ISCED5NAT.v]
      ,Graduates_at_ISCED_5_men_code=[GRAD.ISCED5MEN.code]
      ,Graduates_at_ISCED_5_men_value=[GRAD.ISCED5MEN.v]
      ,Graduates_at_ISCED_5_citizenship_unclassified_code=[GRAD.ISCED5CITUNCL.code]
      ,Graduates_at_ISCED_5_citizenship_unclassified_value=[GRAD.ISCED5CITUNCL.v]
      ,Flag_Graduates_ISCED_5_gender_value=[GRAD.FLAGISCED5GEN.v]
      ,Flag_Graduates_ISCED_5_gender_record=[GRAD.FLAGISCED5GEN.r]
      ,Graduates_at_ISCED_5_mobile_code=[GRAD.ISCED5MOB.code]
      ,Graduates_at_ISCED_5_mobile_value=[GRAD.ISCED5MOB.v]
      ,Graduates_at_ISCED_5_foreigner_code=[GRAD.ISCED5FOR.code]
      ,Graduates_at_ISCED_5_foreigner_value=[GRAD.ISCED5FOR.v]
      ,Graduates_at_ISCED_5_resident_code=[GRAD.ISCED5RES.code]
      ,Graduates_at_ISCED_5_resident_value=[GRAD.ISCED5RES.v]
      ,Graduates_at_ISCED_5_gender_unclassified_code=[GRAD.ISCED5GENUNCL.code]
      ,Graduates_at_ISCED_5_gender_unclassified_value=[GRAD.ISCED5GENUNCL.v]
      ,Flag_Graduates_ISCED_5_citizenship_value=[GRAD.FLAGISCED5CITIZ.v]
      ,Flag_Graduates_ISCED_5_citizenship_record=[GRAD.FLAGISCED5CITIZ.r]
     ,Graduates_at_ISCED_5_mobility_unclassified_code=[GRAD.ISCED5MOBUNCL.code]
     ,Graduates_at_ISCED_5_mobility_unclassified_value=[GRAD.ISCED5MOBUNCL.v]
     ,Flag_Graduates_ISCED_5_mobility_value=[GRAD.FLAGISCED5MOB.v]
     ,Flag_Graduates_ISCED_5_mobility_record=[GRAD.FLAGISCED5MOB.r]
     ,Graduates_at_ISCED_5_Generic_programmes_and_qualifications_code=[GRAD.ISCED5FOE00.code]
     ,Graduates_at_ISCED_5_Generic_programmes_and_qualifications_value=[GRAD.ISCED5FOE00.v]
     ,Graduates_at_ISCED_5_Education_code=[GRAD.ISCED5FOE01.code]
     ,Graduates_at_ISCED_5_Education_value=[GRAD.ISCED5FOE01.v]
     ,Graduates_at_ISCED_5_Social_sciences_journalism_and_information_code=[GRAD.ISCED5FOE03.code]
     ,Graduates_at_ISCED_5_Social_sciences_journalism_and_information_value=[GRAD.ISCED5FOE03.v]
     ,Graduates_at_ISCED_5_Arts_and_Humanities_code=[GRAD.ISCED5FOE02.code]
     ,Graduates_at_ISCED_5_Arts_and_Humanities_value=[GRAD.ISCED5FOE02.v]
     ,Graduates_at_ISCED_5_Business_administration_and_law_code=[GRAD.ISCED5FOE04.code]
     ,Graduates_at_ISCED_5_Business_administration_and_law_value=[GRAD.ISCED5FOE04.v]
     ,Graduates_at_ISCED_5_Natural_sciences_mathematics_and_statistics_code=[GRAD.ISCED5FOE05.code]
     ,Graduates_at_ISCED_5_Natural_sciences_mathematics_and_statistics_value=[GRAD.ISCED5FOE05.v]
     ,Graduates_at_ISCED_5_Information_and_Communication_Technologies_code=[GRAD.ISCED5FOE06.code]
     ,Graduates_at_ISCED_5_Information_and_Communication_Technologies_value=[GRAD.ISCED5FOE06.v]
     ,Graduates_at_ISCED_5_Agriculture_forestry_fisheries_and_veterinary_code=[GRAD.ISCED5FOE08.code]
     ,Graduates_at_ISCED_5_Agriculture_forestry_fisheries_and_veterinary_value=[GRAD.ISCED5FOE08.v]
     ,Graduates_at_ISCED_5_Engineering_manufacturing_and_construction_code=[GRAD.ISCED5FOE07.code]
     ,Graduates_at_ISCED_5_Engineering_manufacturing_and_construction_value=[GRAD.ISCED5FOE07.v]
     ,Graduates_at_ISCED_5_Health_and_welfare_code=[GRAD.ISCED5FOE09.code]
     ,Graduates_at_ISCED_5_Health_and_welfare_value=[GRAD.ISCED5FOE09.v]
     ,Graduates_at_ISCED_5_Services_code=[GRAD.ISCED5FOE10.code]
     ,Graduates_at_ISCED_5_Services_value=[GRAD.ISCED5FOE10.v]
     ,Graduates_at_ISCED_5_ISCED_FoE_unclassified_code=[GRAD.ISCED5FOEUNCL.code]
     ,Graduates_at_ISCED_5_ISCED_FoE_unclassified_value=[GRAD.ISCED5FOEUNCL.v]
     ,Fotal_graduates_at_ISCED_5_code=[GRAD.ISCED5TOTAL.code]
     ,Fotal_graduates_at_ISCED_5_value=[GRAD.ISCED5TOTAL.v]
     ,Flag_Graduates_ISCED_5_ISCED_FoE_value=[GRAD.FLAGISCED5FOE.v]
     ,Flag_Graduates_ISCED_5_ISCED_FoE_record=[GRAD.FLAGISCED5FOE.r]
     ,Flag_Total_graduates_ISCED_5_value=[GRAD.FLAGISCED5TOTAL.v]
     ,Flag_Total_graduates_ISCED_5_record=[GRAD.FLAGISCED5TOTAL.r]
     ,Fotes_on_graduates_at_ISCED_5=[GRAD.NOTESISCED5]
     ,Graduates_at_ISCED_6_men_code=[GRAD.ISCED6MEN.code]
     ,Graduates_at_ISCED_6_men_value=[GRAD.ISCED6MEN.v]
     ,Graduates_at_ISCED_6_gender_unclassified_code=[GRAD.ISCED6GENUNCL.code]
     ,Graduates_at_ISCED_6_gender_unclassified_value=[GRAD.ISCED6GENUNCL.v]
     ,Graduates_at_ISCED_6_women_code=[GRAD.ISCED6WOMEN.code]
     ,Graduates_at_ISCED_6_women_value=[GRAD.ISCED6WOMEN.v]
     ,Flag_Graduates_ISCED_6_gender_value=[GRAD.FLAGISCED6GEN.v]
     ,Flag_Graduates_ISCED_6_gender_record=[GRAD.FLAGISCED6GEN.r]
     ,Graduates_at_ISCED_6_national_code=[GRAD.ISCED6NAT.code]
     ,Graduates_at_ISCED_6_national_value=[GRAD.ISCED6NAT.v]
     ,Graduates_at_ISCED_6_foreigner_code=[GRAD.ISCED6FOR.code]
     ,Graduates_at_ISCED_6_foreigner_value=[GRAD.ISCED6FOR.v]
     ,Flag_Graduates_ISCED_6_citizenship_value=[GRAD.FLAGISCED6CITIZ.v]
     ,Flag_Graduates_ISCED_6_citizenship_record=[GRAD.FLAGISCED6CITIZ.r]
     ,Graduates_at_ISCED_6_citizenship_unclassified_code=[GRAD.ISCED6CITUNCL.code]
     ,Graduates_at_ISCED_6_citizenship_unclassified_value=[GRAD.ISCED6CITUNCL.v]
     ,Graduates_at_ISCED_6_resident_code=[GRAD.ISCED6RES.code]
     ,Graduates_at_ISCED_6_resident_value=[GRAD.ISCED6RES.v]
     ,Graduates_at_ISCED_6_mobile_code=[GRAD.ISCED6MOB.code]
     ,Graduates_at_ISCED_6_mobile_value=[GRAD.ISCED6MOB.v]
     ,Graduates_at_ISCED_6_mobility_unclassified_code=[GRAD.ISCED6MOBUNCL.code]
     ,Graduates_at_ISCED_6_mobility_unclassified_value=[GRAD.ISCED6MOBUNCL.v]
     ,Graduates_at_ISCED_6_Generic_programmes_and_qualifications_code=[GRAD.ISCED6FOE00.code]
     ,Graduates_at_ISCED_6_Generic_programmes_and_qualifications_value=[GRAD.ISCED6FOE00.v]
     ,Flag_Graduates_ISCED_6_mobility_value=[GRAD.FLAGISCED6MOB.v]
     ,Flag_Graduates_ISCED_6_mobility_record=[GRAD.FLAGISCED6MOB.r]
     ,Graduates_at_ISCED_6_Education_code=[GRAD.ISCED6FOE01.code]
     ,Graduates_at_ISCED_6_Education_value=[GRAD.ISCED6FOE01.v]
     ,Graduates_at_ISCED_6_Arts_and_Humanities_code=[GRAD.ISCED6FOE02.code]
     ,Graduates_at_ISCED_6_Arts_and_Humanities_value=[GRAD.ISCED6FOE02.v]
     ,Graduates_at_ISCED_6_Social_sciences_journalism_and_information_code=[GRAD.ISCED6FOE03.code]
     ,Graduates_at_ISCED_6_Social_sciences_journalism_and_information_value=[GRAD.ISCED6FOE03.v]
     ,Graduates_at_ISCED_6_Natural_sciences_mathematics_and_statistics_code=[GRAD.ISCED6FOE05.code]
     ,Graduates_at_ISCED_6_Natural_sciences_mathematics_and_statistics_value=[GRAD.ISCED6FOE05.v]
     ,Graduates_at_ISCED_6_Business_administration_and_law_code=[GRAD.ISCED6FOE04.code]
     ,Graduates_at_ISCED_6_Business_administration_and_law_value=[GRAD.ISCED6FOE04.v]
     ,Graduates_at_ISCED_6_Information_and_Communication_Technologies_code=[GRAD.ISCED6FOE06.code]
     ,Graduates_at_ISCED_6_Information_and_Communication_Technologies_value=[GRAD.ISCED6FOE06.v]
     ,Graduates_at_ISCED_6_Engineering_manufacturing_and_construction_code=[GRAD.ISCED6FOE07.code]
     ,Graduates_at_ISCED_6_Engineering_manufacturing_and_construction_value=[GRAD.ISCED6FOE07.v]
     ,Graduates_at_ISCED_6_Agriculture_forestry_fisheries_and_veterinary_code=[GRAD.ISCED6FOE08.code]
     ,Graduates_at_ISCED_6_Agriculture_forestry_fisheries_and_veterinary_value=[GRAD.ISCED6FOE08.v]
     ,Graduates_at_ISCED_6_Services_code=[GRAD.ISCED6FOE10.code]
     ,Graduates_at_ISCED_6_Services_value=[GRAD.ISCED6FOE10.v]
     ,Graduates_at_ISCED_6_Health_and_welfare_code=[GRAD.ISCED6FOE09.code]
     ,Graduates_at_ISCED_6_Health_and_welfare_value=[GRAD.ISCED6FOE09.v]
     ,Graduates_at_ISCED_6_ISCED_FoE_unclassified_code=[GRAD.ISCED6FOEUNCL.code]
     ,Graduates_at_ISCED_6_ISCED_FoE_unclassified_value=[GRAD.ISCED6FOEUNCL.v]
     ,Flag_Graduates_ISCED_6_ISCED_FoE_value=[GRAD.FLAGISCED6FOE.v]
     ,Flag_Graduates_ISCED_6_ISCED_FoE_record=[GRAD.FLAGISCED6FOE.r]
     ,Fotal_graduates_at_ISCED_6_code=[GRAD.ISCED6TOTAL.code]
     ,Fotal_graduates_at_ISCED_6_value=[GRAD.ISCED6TOTAL.v]
     ,Flag_Total_graduates_ISCED_6_value=[GRAD.FLAGISCED6TOTAL.v]
     ,Flag_Total_graduates_ISCED_6_record=[GRAD.FLAGISCED6TOTAL.r]
	 ,Graduates_at_ISCED_7_men_code=[GRAD.ISCED7MEN.code]
     ,Graduates_at_ISCED_7_men_value=[GRAD.ISCED7MEN.v]
     ,Graduates_at_ISCED_7_women_code=[GRAD.ISCED7WOMEN.code]
     ,Graduates_at_ISCED_7_women_value=[GRAD.ISCED7WOMEN.v]
     ,Graduates_at_ISCED_7_gender_unclassified_code=[GRAD.ISCED7GENUNCL.code]
     ,Graduates_at_ISCED_7_gender_unclassified_value=[GRAD.ISCED7GENUNCL.v]
     ,Flag_Graduates_ISCED_7_gender_value=[GRAD.FLAGISCED7GEN.v]
     ,Flag_Graduates_ISCED_7_gender_record=[GRAD.FLAGISCED7GEN.r]
     ,Graduates_at_ISCED_7_foreigner_code=[GRAD.ISCED7FOR.code]
     ,Graduates_at_ISCED_7_foreigner_value=[GRAD.ISCED7FOR.v]
     ,Fotes_on_graduates_at_ISCED_6_value=[GRAD.NOTESISCED6.v]
     ,Fotes_on_graduates_at_ISCED_6_record=[GRAD.NOTESISCED6.r]
     ,Graduates_at_ISCED_7_national_code=[GRAD.ISCED7NAT.code]
     ,Graduates_at_ISCED_7_national_value=[GRAD.ISCED7NAT.v]
     ,Graduates_at_ISCED_7_citizenship_unclassified_code=[GRAD.ISCED7CITUNCL.code]
     ,Graduates_at_ISCED_7_citizenship_unclassified_value=[GRAD.ISCED7CITUNCL.v]
     ,Flag_Graduates_ISCED_7_citizenship_value=[GRAD.FLAGISCED7CITIZ.v]
     ,Flag_Graduates_ISCED_7_citizenship_record=[GRAD.FLAGISCED7CITIZ.r]
     ,Graduates_at_ISCED_7_mobile_code=[GRAD.ISCED7MOB.code]
     ,Graduates_at_ISCED_7_mobile_value=[GRAD.ISCED7MOB.v]
     ,Graduates_at_ISCED_7_resident_code=[GRAD.ISCED7RES.code]
     ,Graduates_at_ISCED_7_resident_value=[GRAD.ISCED7RES.v]
     ,Graduates_at_ISCED_7_mobility_unclassified_code=[GRAD.ISCED7MOBUNCL.code]
     ,Graduates_at_ISCED_7_mobility_unclassified_value=[GRAD.ISCED7MOBUNCL.v]
     ,Flag_Graduates_ISCED_7_mobility_value=[GRAD.FLAGISCED7MOB.v]
     ,Flag_Graduates_ISCED_7_mobility_record=[GRAD.FLAGISCED7MOB.r]
     ,Graduates_at_ISCED_7_Generic_programmes_and_qualifications_code=[GRAD.ISCED7FOE00.code]
     ,Graduates_at_ISCED_7_Generic_programmes_and_qualifications_value=[GRAD.ISCED7FOE00.v]
     ,Graduates_at_ISCED_7_Arts_and_Humanities_code=[GRAD.ISCED7FOE02.code]
     ,Graduates_at_ISCED_7_Arts_and_Humanities_value=[GRAD.ISCED7FOE02.v]
     ,Graduates_at_ISCED_7_Education_code=[GRAD.ISCED7FOE01.code]
     ,Graduates_at_ISCED_7_Education_value=[GRAD.ISCED7FOE01.v]
     ,Graduates_at_ISCED_7_Social_sciences_journalism_and_information_code=[GRAD.ISCED7FOE03.code]
     ,Graduates_at_ISCED_7_Social_sciences_journalism_and_information_value=[GRAD.ISCED7FOE03.v]
     ,Graduates_at_ISCED_7_Business_administration_and_law_code=[GRAD.ISCED7FOE04.code]
     ,Graduates_at_ISCED_7_Business_administration_and_law_value=[GRAD.ISCED7FOE04.v]
     ,Graduates_at_ISCED_7_Natural_sciences_mathematics_and_statistics_code=[GRAD.ISCED7FOE05.code]
     ,Graduates_at_ISCED_7_Natural_sciences_mathematics_and_statistics_value=[GRAD.ISCED7FOE05.v]
     ,Graduates_at_ISCED_7_Engineering_manufacturing_and_construction_code=[GRAD.ISCED7FOE07.code]
     ,Graduates_at_ISCED_7_Engineering_manufacturing_and_construction_value=[GRAD.ISCED7FOE07.v]
     ,Graduates_at_ISCED_7_Information_and_Communication_Technologies_code=[GRAD.ISCED7FOE06.code]
     ,Graduates_at_ISCED_7_Information_and_Communication_Technologies_value=[GRAD.ISCED7FOE06.v]
     ,Graduates_at_ISCED_7_Agriculture_forestry_fisheries_and_veterinary_code=[GRAD.ISCED7FOE08.code]
     ,Graduates_at_ISCED_7_Agriculture_forestry_fisheries_and_veterinary_value=[GRAD.ISCED7FOE08.v]
     ,Graduates_at_ISCED_7_Health_and_welfare_code=[GRAD.ISCED7FOE09.code]
     ,Graduates_at_ISCED_7_Health_and_welfare_value=[GRAD.ISCED7FOE09.v]
     ,Graduates_at_ISCED_7_Services_code=[GRAD.ISCED7FOE10.code]
     ,Graduates_at_ISCED_7_Services_value=[GRAD.ISCED7FOE10.v]
     ,Flag_Graduates_ISCED_7_ISCED_FoE_value=[GRAD.FLAGISCED7FOE.v]
     ,Flag_Graduates_ISCED_7_ISCED_FoE_record=[GRAD.FLAGISCED7FOE.r]
     ,Graduates_at_ISCED_7_ISCED_FoE_unclassified_code=[GRAD.ISCED7FOEUNCL.code]
     ,Graduates_at_ISCED_7_ISCED_FoE_unclassified_value=[GRAD.ISCED7FOEUNCL.v]
     ,Fotal_graduates_at_ISCED_7_code=[GRAD.ISCED7TOTAL.code]
     ,Fotal_graduates_at_ISCED_7_value=[GRAD.ISCED7TOTAL.v]
     ,Flag_Total_graduates_ISCED_7_value=[GRAD.FLAGISCED7TOTAL.v]
     ,Flag_Total_graduates_ISCED_7_record=[GRAD.FLAGISCED7TOTAL.r]
     ,Fotes_on_graduates_at_ISCED_7=[GRAD.NOTESISCED7]
     ,Graduates_at_ISCED_7_long_degree_women_code=[GRAD.ISCED7LONGWOMEN.code]
     ,Graduates_at_ISCED_7_long_degree_women_value=[GRAD.ISCED7LONGWOMEN.v]
     ,Graduates_at_ISCED_7_long_degree_men_code=[GRAD.ISCED7LONGMEN.code]
     ,Graduates_at_ISCED_7_long_degree_men_value=[GRAD.ISCED7LONGMEN.v]
     ,Graduates_ISCED_7_long_degree_gender_unclassified_code=[GRAD.ISCED7LONGGENUNCL.code]
     ,Graduates_ISCED_7_long_degree_gender_unclassified_value=[GRAD.ISCED7LONGGENUNCL.v]
     ,Flag_Graduates_ISCED_7_long_degree_gender_value=[GRAD.FLAGISCED7LONGGEN.v]
     ,Flag_Graduates_ISCED_7_long_degree_gender_record=[GRAD.FLAGISCED7LONGGEN.r]
     ,Graduates_at_ISCED_7_long_degree_national_code=[GRAD.ISCED7LONGNAT.code]
     ,Graduates_at_ISCED_7_long_degree_national_value=[GRAD.ISCED7LONGNAT.v]
     ,Graduates_ISCED_7_long_degree_citiz_unclassified_code=[GRAD.ISCED7LONGCITUNCL.code]
     ,Graduates_ISCED_7_long_degree_citiz_unclassified_value=[GRAD.ISCED7LONGCITUNCL.v]
     ,Graduates_at_ISCED_7_long_degree_foreigner_code=[GRAD.ISCED7LONGFOR.code]
     ,Graduates_at_ISCED_7_long_degree_foreigner_value=[GRAD.ISCED7LONGFOR.v]
     ,Flag_Graduates_ISCED_7_long_degree_citizenship_value=[GRAD.FLAGISCED7LONGCITIZ.v]
     ,Flag_Graduates_ISCED_7_long_degree_citizenship_record=[GRAD.FLAGISCED7LONGCITIZ.r]
     ,Graduates_at_ISCED_7_long_degree_resident_code=[GRAD.ISCED7LONGRES.code]
     ,Graduates_at_ISCED_7_long_degree_resident_value=[GRAD.ISCED7LONGRES.v]
     ,Graduates_at_ISCED_7_long_degree_mobile_code=[GRAD.ISCED7LONGMOB.code]
     ,Graduates_at_ISCED_7_long_degree_mobile_value=[GRAD.ISCED7LONGMOB.v]
     ,Flag_Graduates_ISCED_7_long_degree_mobility_value=[GRAD.FLAGISCED7LONGMOB.v]
     ,Flag_Graduates_ISCED_7_long_degree_mobility_record=[GRAD.FLAGISCED7LONGMOB.r]
     ,Graduates_ISCED7_long_degree_mobility_unclassified_code=[GRAD.ISCED7LONGMOBUNCL.code]
     ,Graduates_ISCED7_long_degree_mobility_unclassified_value=[GRAD.ISCED7LONGMOBUNCL.v]
     ,Graduates_at_ISCED_7_long_degree_Generic_programmes_and_qualifications_code=[GRAD.ISCED7LONGFOE00.code]
     ,Graduates_at_ISCED_7_long_degree_Generic_programmes_and_qualifications_value=[GRAD.ISCED7LONGFOE00.v]
     ,Graduates_at_ISCED_7_long_degree_Education_code=[GRAD.ISCED7LONGFOE01.code]
     ,Graduates_at_ISCED_7_long_degree_Education_value=[GRAD.ISCED7LONGFOE01.v]
     ,Graduates_at_ISCED_7_long_degree_Arts_and_Humanities_code=[GRAD.ISCED7LONGFOE02.code]
     ,Graduates_at_ISCED_7_long_degree_Arts_and_Humanities_value=[GRAD.ISCED7LONGFOE02.v]
     ,Graduates_at_ISCED_7_long_degree_Business_administration_and_law_code=[GRAD.ISCED7LONGFOE04.code]
     ,Graduates_at_ISCED_7_long_degree_Business_administration_and_law_value=[GRAD.ISCED7LONGFOE04.v]
     ,Graduates_at_ISCED_7_long_degree_Social_sciences_journalism_and_information_code=[GRAD.ISCED7LONGFOE03.code]
     ,Graduates_at_ISCED_7_long_degree_Social_sciences_journalism_and_information_value=[GRAD.ISCED7LONGFOE03.v]
     ,Graduates_at_ISCED_7_long_degree_Natural_sciences_mathematics_and_statistics_code=[GRAD.ISCED7LONGFOE05.code]
     ,Graduates_at_ISCED_7_long_degree_Natural_sciences_mathematics_and_statistics_value=[GRAD.ISCED7LONGFOE05.v]
     ,Graduates_at_ISCED_7_long_degree_Information_and_Communication_Technologies_code=[GRAD.ISCED7LONGFOE06.code]
     ,Graduates_at_ISCED_7_long_degree_Information_and_Communication_Technologies_value=[GRAD.ISCED7LONGFOE06.v]
     ,Graduates_at_ISCED_7_long_degree_Engineering_manufacturing_and_construction_code=[GRAD.ISCED7LONGFOE07.code]
     ,Graduates_at_ISCED_7_long_degree_Engineering_manufacturing_and_construction_value=[GRAD.ISCED7LONGFOE07.v]
     ,Graduates_at_ISCED_7_long_degree_Health_and_welfare_code=[GRAD.ISCED7LONGFOE09.code]
     ,Graduates_at_ISCED_7_long_degree_Health_and_welfare_value=[GRAD.ISCED7LONGFOE09.v]
     ,Graduates_at_ISCED_7_long_degree_Agriculture_forestry_fisheries_and_veterinary_code=[GRAD.ISCED7LONGFOE08.code]
     ,Graduates_at_ISCED_7_long_degree_Agriculture_forestry_fisheries_and_veterinary_value=[GRAD.ISCED7LONGFOE08.v]
     ,Graduates_at_ISCED_7_long_degree_Services_code=[GRAD.ISCED7LONGFOE10.code]
     ,Graduates_at_ISCED_7_long_degree_Services_value=[GRAD.ISCED7LONGFOE10.v]
     ,Graduates_at_ISCED_7_ISCED_FoE_unclassified_code=[GRAD.ISCED7LONGFOEUNCL.code]
     ,Graduates_at_ISCED_7_ISCED_FoE_unclassified_value=[GRAD.ISCED7LONGFOEUNCL.v]
     ,Flag_Graduates_ISCED_7_long_degree_ISCED_FoE_value=[GRAD.FLAGISCED7LONGFOE.v]
     ,Flag_Graduates_ISCED_7_long_degree_ISCED_FoE_record=[GRAD.FLAGISCED7LONGFOE.r]
     ,Flag_Total_graduates_ISCED_7_long_degree_value=[GRAD.FLAGISCED7LONGTOTAL.v]
     ,Flag_Total_graduates_ISCED_7_long_degree_record=[GRAD.FLAGISCED7LONGTOTAL.r]
     ,Fotal_graduates_at_ISCED_7_long_degree_code=[GRAD.ISCED7LONGTOTAL.code]
     ,Fotal_graduates_at_ISCED_7_long_degree_value=[GRAD.ISCED7LONGTOTAL.v]
     ,Fotes_on_graduates_at_ISCED_7_long_degree_value=[GRAD.NOTESISCED7LONG.v]
     ,Fotes_on_graduates_at_ISCED_7_long_degree_record=[GRAD.NOTESISCED7LONG.r]
	 ,Fotal_graduates_ISCED_5_7_code=[GRAD.TOTALISCED5_7.code]
     ,Fotal_graduates_ISCED_5_7_value=[GRAD.TOTALISCED5_7.v]
     ,Flag_Total_graduates_ISCED_5_7_value=[GRAD.FLAGTOTALISCED5_7.v]
     ,Flag_Total_graduates_ISCED_5_7_record=[GRAD.FLAGTOTALISCED5_7.r]
     ,Fotes_on_educational_activities_Graduates=[GRAD.NOTESEDUCACT]
     ,Fotes_on_total_graduates_ISCED_5_7=[GRAD.NOTESTOTALISCED5_7]
     ,Graduates_at_ISCED_5_7_men_code=[GRAD.ISCED5_7MEN.code]
     ,Graduates_at_ISCED_5_7_men_value=[GRAD.ISCED5_7MEN.v]
     ,Graduates_at_ISCED_5_7_women_code=[GRAD.ISCED5_7WOMEN.code]
     ,Graduates_at_ISCED_5_7_women_value=[GRAD.ISCED5_7WOMEN.v]
     ,Flag_Graduates_at_ISCED_5_7_gender_value=[GRAD.FLAGISCED5_7GEN.v]
     ,Flag_Graduates_at_ISCED_5_7_gender_record=[GRAD.FLAGISCED5_7GEN.r]
     ,Graduates_at_ISCED_5_7_gender_unclassified_code=[GRAD.ISCED5_7GENUNCL.code]
     ,Graduates_at_ISCED_5_7_gender_unclassified_value=[GRAD.ISCED5_7GENUNCL.v]
     ,Graduates_at_ISCED_5_7_national_code=[GRAD.ISCED5_7NAT.code]
     ,Graduates_at_ISCED_5_7_national_value=[GRAD.ISCED5_7NAT.v]
     ,Graduates_at_ISCED_5_7_foreigner_code=[GRAD.ISCED5_7FOR.code]
     ,Graduates_at_ISCED_5_7_foreigner_value=[GRAD.ISCED5_7FOR.v]
     ,Graduates_at_ISCED_5_7_citizenship_unclassified_code=[GRAD.ISCED5_7CITUNCL.code]
     ,Graduates_at_ISCED_5_7_citizenship_unclassified_value=[GRAD.ISCED5_7CITUNCL.v]
     ,Graduates_at_ISCED_5_7_resident_code=[GRAD.ISCED5_7RES.code]
     ,Graduates_at_ISCED_5_7_resident_value=[GRAD.ISCED5_7RES.v]
     ,Flag_Graduates_at_ISCED_5_7_citizenship_value=[GRAD.FLAGISCED5_7CITIZ.v]
     ,Flag_Graduates_at_ISCED_5_7_citizenship_record=[GRAD.FLAGISCED5_7CITIZ.r]
     ,Graduates_at_ISCED_5_7_mobile_code=[GRAD.ISCED5_7MOB.code]
     ,Graduates_at_ISCED_5_7_mobile_value=[GRAD.ISCED5_7MOB.v]
     ,Graduates_at_ISCED_5_7_mobility_unclassified_code=[GRAD.ISCED5_7MOBUNCL.code]
     ,Graduates_at_ISCED_5_7_mobility_unclassified_value=[GRAD.ISCED5_7MOBUNCL.v]
     ,Flag_Graduates_at_ISCED_5_7_mobility_value=[GRAD.FLAGISCED5_7MOB.v]
     ,Flag_Graduates_at_ISCED_5_7_mobility_record=[GRAD.FLAGISCED5_7MOB.r]
     ,Graduates_at_ISCED_5_7_Education_code=[GRAD.ISCED5_7FOE01.code]
     ,Graduates_at_ISCED_5_7_Education_value=[GRAD.ISCED5_7FOE01.v]
     ,Graduates_at_ISCED_5_7_Generic_programmes_and_qualifications_code=[GRAD.ISCED5_7FOE00.code]
     ,Graduates_at_ISCED_5_7_Generic_programmes_and_qualifications_value=[GRAD.ISCED5_7FOE00.v]
     ,Graduates_at_ISCED_5_7_Arts_and_Humanities_code=[GRAD.ISCED5_7FOE02.code]
     ,Graduates_at_ISCED_5_7_Arts_and_Humanities_value=[GRAD.ISCED5_7FOE02.v]
     ,Graduates_at_ISCED_5_7_Social_sciences_journalism_and_information_code=[GRAD.ISCED5_7FOE03.code]
     ,Graduates_at_ISCED_5_7_Social_sciences_journalism_and_information_value=[GRAD.ISCED5_7FOE03.v]
     ,Graduates_at_ISCED_5_7_Business_administration_and_law_code=[GRAD.ISCED5_7FOE04.code]
     ,Graduates_at_ISCED_5_7_Business_administration_and_law_value=[GRAD.ISCED5_7FOE04.v]
     ,Graduates_at_ISCED_5_7_Information_and_Communication_Technologies_code=[GRAD.ISCED5_7FOE06.code]
     ,Graduates_at_ISCED_5_7_Information_and_Communication_Technologies_value=[GRAD.ISCED5_7FOE06.v]
     ,Graduates_at_ISCED_5_7_Natural_sciences_mathematics_and_statistics_code=[GRAD.ISCED5_7FOE05.code]
     ,Graduates_at_ISCED_5_7_Natural_sciences_mathematics_and_statistics_value=[GRAD.ISCED5_7FOE05.v]
     ,Graduates_at_ISCED_5_7_Engineering_manufacturing_and_construction_code=[GRAD.ISCED5_7FOE07.code]
     ,Graduates_at_ISCED_5_7_Engineering_manufacturing_and_construction_value=[GRAD.ISCED5_7FOE07.v]
     ,Graduates_at_ISCED_5_7_Agriculture_forestry_fisheries_and_veterinary_code=[GRAD.ISCED5_7FOE08.code]
     ,Graduates_at_ISCED_5_7_Agriculture_forestry_fisheries_and_veterinary_value=[GRAD.ISCED5_7FOE08.v]
     ,Graduates_at_ISCED_5_7_Health_and_welfare_code=[GRAD.ISCED5_7FOE09.code]
     ,Graduates_at_ISCED_5_7_Health_and_welfare_value=[GRAD.ISCED5_7FOE09.v]
     ,Graduates_at_ISCED_5_7_ISCED_FoE_unclassified_code=[GRAD.ISCED5_7FOEUNCL.code]
     ,Graduates_at_ISCED_5_7_ISCED_FoE_unclassified_value=[GRAD.ISCED5_7FOEUNCL.v]
     ,Graduates_at_ISCED_5_7_Services_code=[GRAD.ISCED5_7FOE10.code]
     ,Graduates_at_ISCED_5_7_Services_value=[GRAD.ISCED5_7FOE10.v]
     ,Flag_Graduates_at_ISCED_5_7_ISCED_FoE_value=[GRAD.FLAGISCED5_7FOE.v]
     ,Flag_Graduates_at_ISCED_5_7_ISCED_FoE_record=[GRAD.FLAGISCED5_7FOE.r]
     ,Share_of_women_graduates_ISCED_5_7_code=[GRAD.SHAREWOMENISCED5-7.code]
     ,Share_of_women_graduates_ISCED_5_7_value=[GRAD.SHAREWOMENISCED5-7.v]
     ,Flag_Share_of_women_graduates_ISCED_5_7_value=[GRAD.FLAGSHAREWOMENISCED5-7.v]
     ,Flag_Share_of_women_graduates_ISCED_5_7_record=[GRAD.FLAGSHAREWOMENISCED5-7.r]
     ,Share_of_foreigners_graduates_ISCED_5_7_code=[GRAD.SHAREFORISCED5-7.code]
     ,Share_of_foreigners_graduates_ISCED_5_7_value=[GRAD.SHAREFORISCED5-7.v]
     ,Flag_Share_of_foreigners_graduates_ISCED_5_7_value=[GRAD.FLAGSHAREFORISCED5-7.v]
     ,Flag_Share_of_foreigners_graduates_ISCED_5_7_record=[GRAD.FLAGSHAREFORISCED5-7.r]
     ,Share_of_mobile_graduates_ISCED_5_7_code=[GRAD.SHAREMOBISCED5-7.code]
     ,Share_of_mobile_graduates_ISCED_5_7_value=[GRAD.SHAREMOBISCED5-7.v]
     ,Flag_Share_of_mobile_graduates_ISCED_5_7_value=[GRAD.FLAGSHAREMOBISCED5-7.v]
     ,Flag_Share_of_mobile_graduates_ISCED_5_7_record=[GRAD.FLAGSHAREMOBISCED5-7.r]
     ,[username]
     ,[Source]
     ,[Loadtime]
 FROM [ANTERO].[sa].[sa_eter_graduates]
  
GO



USE [ANTERO]
 