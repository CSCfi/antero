USE [ANTERO]

IF NOT EXISTS
    (select * from INFORMATION_SCHEMA.TABLES
     where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk8a_alayksikkokoodisto')
BEGIN
CREATE TABLE [sa].[sa_suorat_amk8a_alayksikkokoodisto](
	[Vuosi] [varchar](5) NULL,
	[Korkeakoulun_koodi] [varchar](10) NULL,
	[Paayksikon_koodi] [varchar](10) NULL,
	[Alayksikon_koodi] [varchar](10) NULL,
	[Alayksikon_nimi] [varchar](100) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [varchar](100) NULL
) ON [PRIMARY]
END
