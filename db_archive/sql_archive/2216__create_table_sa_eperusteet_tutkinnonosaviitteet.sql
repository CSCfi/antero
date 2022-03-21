USE [Koski_SA]
GO
/****** Object:  Table [dw].[f_koski_amm_opiskelijavuodet_painotetut]    Script Date: 3.4.2019 13:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_eperusteet_tutkinnonosaviitteet'
) BEGIN
DROP TABLE [sa].[sa_eperusteet_tutkinnonosaviitteet]
END

IF NOT EXISTS (
	SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_eperusteet_tutkinnonosaviitteet]') AND type in (N'U')
	)
BEGIN

CREATE TABLE [sa].[sa_eperusteet_tutkinnonosaviitteet](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
  [tutkinnonosaviiteid] [int] NULL,
  [tutkinnonosaid] [int] NULL,
  [eperusteid] [int] NULL,
  [laajuus] [int] NULL,
  [loadtime] [datetime] NULL,
	[source] [varchar](100) NULL,
	[username] [varchar](100) NULL,

  CONSTRAINT [PK__sa_eperusteet_tutkinnonosaviitteet] PRIMARY KEY CLUSTERED
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	END

ALTER TABLE sa.sa_eperusteet_tutkinnonosaviitteet ADD  CONSTRAINT DF__sa_eperusteet_tutkinnonosaviitteet__loadtime  DEFAULT (getdate()) FOR loadtime
ALTER TABLE sa.sa_eperusteet_tutkinnonosaviitteet ADD  CONSTRAINT DF__sa_eperusteet_tutkinnonosaviitteet__username  DEFAULT (suser_name()) FOR username

USE ANTERO
