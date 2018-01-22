USE [ANTERO]

IF NOT EXISTS
    (select * from INFORMATION_SCHEMA.TABLES
     where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_yo9b_alayksikot_ohjauksen_alat')
BEGIN
CREATE TABLE [sa].[sa_suorat_yo9b_alayksikot_ohjauksen_alat](
	[Vuosi] [nvarchar](5) NULL,
	[korkeakoulu_koodi] [nvarchar](10) NULL,
	[alayksikkö_koodi] [nvarchar](100) NULL,
	[ohjauksen_ala_koodi] [nvarchar](2) NULL,
	[jyvitys] [nvarchar](10) NULL,
	[max 100 %] [nvarchar](5) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [nvarchar](100) NULL
) ON [PRIMARY]

END
