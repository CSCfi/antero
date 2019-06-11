USE [Koski_SA]
GO
/****** Object:  Table [dw].[f_koski_amm_opiskelijavuodet_painotetut]    Script Date: 3.4.2019 13:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_eperusteet_osaamisalat'
) BEGIN
DROP TABLE [sa].[sa_eperusteet_osaamisalat]
END

IF NOT EXISTS (
	SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_eperusteet_osaamisalat]') AND type in (N'U')
	)
BEGIN

CREATE TABLE [sa].[sa_eperusteet_osaamisalat](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
  [eperusteid] [int] NULL,
  [nimi_fi] [varchar](300) NULL,
  [nimi_sv] [varchar](300) NULL,
  [nimi_en] [varchar](300) NULL,
  [osaamisala_koodi] [int] NULL,
  [versio] [varchar](100) NULL,
  [source] [varchar](1000) NULL,
  [loadtime] [datetime] NULL,
  [username] [varchar](30) NULL
  CONSTRAINT [PK__sa_eperusteet_osaamisalat] PRIMARY KEY CLUSTERED
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	END

ALTER TABLE sa.sa_eperusteet_osaamisalat ADD  CONSTRAINT DF__sa_eperusteet_osaamisalat__loadtime  DEFAULT (getdate()) FOR loadtime
ALTER TABLE sa.sa_eperusteet_osaamisalat ADD  CONSTRAINT DF__sa_eperusteet_osaamisalat__username  DEFAULT (suser_name()) FOR username

USE ANTERO
