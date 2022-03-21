USE [ANTERO]
GO

/****** Object:  StoredProcedure [dw].[p_lataa_f_eter_basic_info]    Script Date: 4.2.2019 9:19:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*
ETER basic information lataus SA-tauluista
4.2.2019
JKO
*/

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_f_eter_basic_info]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_f_eter_basic_info] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_f_eter_basic_info] AS

TRUNCATE TABLE dw.f_eter_basic_info

INSERT INTO dw.f_eter_basic_info (
[id]
,[ETER_ID_year]
,[ETER_ID]
,[NationID]
,[Institution_name_eng]
,[Institution_name]
,[Notes_institution_name]
,[Institution_acronym]
,[Reference_year]
,[Institution_category_nat_lang]
,[Institution_category_eng]
,[Country]
,[Institution_Category_standardized_value]
,[Institution_Category_standardized_code]
,[Notes_institution_category]
,[Name_of_foreign_institution]
,[Foreign_campus_value]
,[Foreign_campus_code]
,[Foreign_institution_country]
,[Notes_foreign_inst.]
,[Legal_status_value]
,[Legal_status_code]
,[Legal_status_year_value]
,[Legal_status_year_code]
,[Notes_legal_status_year]
,[Ancestor_year_value]
,[Ancestor_year_code]
,[Notes_ancestor_year]
,[University_hospital_OrgReg_ID]
,[University_hospital_name]
,[University_hospital_value]
,[University_hospital_code]
,[Notes_university_hospital]
,[Foundation_year_value]
,[Foundation_year_code]
,[Notes_foundation_year]
,[Institutional_website]
,[Notes_institutional_website]
,[username]
,[Source]
,[Loadtime]
)

SELECT
[id]=sa._id
,[ETER_ID_year]= sa.[BAS.ETERIDYEAR]
,[ETER_ID]= sa.[BAS.ETERID]
,[NationID]= sa.[BAS.NATID]
,[Institution_name_eng]=sa.[BAS.INSTNAMEENGL]
,[Institution_name]=sa.[BAS.INSTNAME]
,[Notes_institution_name]=[BAS.NOTESINSTNAME]
,[Institution_acronym]=[BAS.ACRONYM]
,[Reference_year]=[BAS.REFYEAR]
,[Institution_category_nat_lang]=[BAS.INSTCAT]
,[Institution_category_eng]=[BAS.INSTCATENGL]
,[Country]=[BAS.COUNTRY]
,[Institution_Category_standardized_value]=[BAS.INSTCATSTAND.v]
,[Institution_Category_standardized_code]=[BAS.INSTCATSTAND.code]
,[Notes_institution_category]=[BAS.NOTESINSTCAT]
,[Name_of_foreign_institution]=[BAS.NAMEFORCAMP]
,[Foreign_campus_value]=[BAS.FORCAMP.v]
,[Foreign_campus_code]=[BAS.FORCAMP.code]
,[Foreign_institution_country]=[BAS.FORCAMPCOUNTRY]
,[Notes_foreign_inst.]=[BAS.NOTESFORCAMP]
,[Legal_status_value]=[BAS.LEGALSTAT.v]
,[Legal_status_code]=[BAS.LEGALSTAT.code]
,[Legal_status_year_value]=[BAS.LEGALYEAR.v]
,[Legal_status_year_code]=[BAS.LEGALYEAR.code]
,[Notes_legal_status_year]=[BAS.NOTESLEGALYEAR]
,[Ancestor_year_value]=[BAS.ANCESTYEAR.v]
,[Ancestor_year_code]=[BAS.ANCESTYEAR.code]
,[Notes_ancestor_year]=[BAS.NOTESANCESTYEAR]
,[University_hospital_OrgReg_ID]=[BAS.UNIHOSPID]
,[University_hospital_name]=[BAS.UNIHOSPNAME]
,[University_hospital_value]=[BAS.UNIHOSP.v]
,[University_hospital_code]=[BAS.UNIHOSP.code]
,[Notes_university_hospital]=[BAS.NOTESUNIHOSP]
,[Foundation_year_value]=[BAS.FOUNDYEAR.v]
,[Foundation_year_code]=[BAS.FOUNDYEAR.code]
,[Notes_foundation_year]=[BAS.NOTESFOUNDYEAR]
,[Institutional_website]=[BAS.WEBSITE]
,[Notes_institutional_website]=[BAS.NOTESWEBSITE]
,[username]
,[Source]
,[Loadtime]
FROM antero.sa.sa_eter_basic_info as sa

GO



USE [ANTERO]