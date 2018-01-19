USE [ANTERO]

IF NOT EXISTS
		(select * from INFORMATION_SCHEMA.TABLES
			where TABLE_SCHEMA='sa' and TABLE_NAME='sa_suorat_amk7c_rekrytointi_valitun_taustatiedot')

BEGIN
CREATE TABLE [sa].[sa_suorat_amk7c_rekrytointi_valitun_taustatiedot](
	[korkeakoulutunnus] [varchar](50) NULL,
	[Vastaajatunnus] [nvarchar](max) NULL,
	[Henkilönumero] [nvarchar](max) NULL,
	[Haun numero] [nvarchar](max) NULL,
	[kysymysryhmä] [varchar](100) NULL,
	[Kysymys] [nvarchar](400) NULL,
	[Vastaus] [nvarchar](400) NULL,
	[IMP_CREATED_DATE] [datetime] NULL,
	[IMP_UPDATED_DATE] [datetime] NULL,
	[IMP_CREATED_BY] [varchar](100) NULL

) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
