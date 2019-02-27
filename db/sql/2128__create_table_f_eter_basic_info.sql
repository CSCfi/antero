USE [ANTERO]
IF EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_eter_basic_info')
BEGIN
	DROP TABLE [dw].[f_eter_basic_info];
END

IF  NOT EXISTS
	(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA='dw' AND TABLE_NAME='f_eter_basic_info')
BEGIN
CREATE TABLE [dw].[f_eter_basic_info](
	[id] [varchar](24) NOT NULL,
	[ETER_ID_year] [varchar](11) NULL,
	[ETER_ID] [varchar](6) NULL,
	[NationID][varchar](14) NULL,
	[Institution_name_eng] [varchar](121) NULL,
	[Institution_name] [varchar](603) NULL,
	[Reference_year] [bigint] NULL,
	[Institution_category_nat_lang] [varchar](233) NULL,
	[Country] [varchar](2) NULL,
	[Institution_Category_standardized_value] [varchar](2) NULL,
	[Institution_Category_standardized_code] [varchar](2) NULL,
	[Name_of_foreign_institution] [varchar](35) NULL,
	[Notes_foreign_inst.] [varchar](185) NULL,
	[Legal_status_year_value] [varchar](4) NULL,
	[Legal_status_year_code] [varchar](2) NULL,
	[Ancestor_year_code] [varchar](2) NULL,
	[Ancestor_year_value] [varchar](4) NULL,
	[University_hospital_OrgReg_ID][varchar](76) NULL,
	[Notes_university_hospital] [varchar](311) NULL,
	[Notes_institution_name] [varchar](238) NULL,
	[Legal_status_value] [varchar](2) NULL,
	[Legal_status_code] [varchar](2) NULL,
	[Foreign_campus_value] [varchar](5) NULL,
	[Foreign_campus_code] [varchar](2) NULL,
	[Notes_institution_category][varchar](160) NULL,
	[Notes_foundation_year][varchar](239) NULL,
	[Foundation_year_value] [varchar](4) NULL,
	[Foundation_year_code] [varchar](2) NULL,
	[University_hospital_value] [varchar](5) NULL,
	[University_hospital_code] [varchar](2) NULL,
	[Notes_institutional_website] [varchar](130) NULL,
	[Institution_acronym] [varchar](58) NULL,
	[Notes_ancestor_year] [varchar](211) NULL,
	[Institution_category_eng] [varchar](61) NULL,
	[Institutional_website] [varchar](107) NULL,
	[Foreign_institution_country] [varchar](6) NULL,
	[Notes_legal_status_year] [varchar](220) NULL,
	[University_hospital_name] [varchar](723) NULL,
	[username] [varchar](100) NULL,
	[Source] [varchar](100) NULL,
	[Loadtime] [datetime] NULL,
 CONSTRAINT [PK__f_eter_basic_info] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
USE [ANTERO]