USE [Koski_SA]
GO
/****** Object:  Table [dw].[f_koski_amm_opiskelijavuodet_painotetut]    Script Date: 3.4.2019 13:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_eperusteet_tutkinnonosat'
) BEGIN
DROP TABLE [sa].[sa_eperusteet_tutkinnonosat]
END

IF NOT EXISTS (
	SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_eperusteet_tutkinnonosat]') AND type in (N'U')
	)
BEGIN

CREATE TABLE [sa].[sa_eperusteet_tutkinnonosat](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tutkinnonosaid] [int] NULL,
  [eperusteid] [int] NULL,
	[arvo] [varchar](100) NULL,
	[tyyppi] [varchar](100) NULL,
	[koodiarvo] [int] NULL,
	[koodisto] [varchar](100) NULL,
	[koodiuri] [varchar](100) NULL,
	[nimi_fi] [varchar](300) NULL,
	[nimi_sv] [varchar](300) NULL,
	[osantyyppi] [varchar](100) NULL,
	[tila] [varchar](100) NULL,
	[uri] [varchar](100) NULL,
	[valmatelmasisalto] [bit] NULL,
	[versio] [varchar](100) NULL,
	[source] [varchar](1000) NULL,
	[username] [varchar](30) NULL,
	[loadtime] [datetime] NULL
  CONSTRAINT [PK__sa_eperusteet_tutkinnonosat] PRIMARY KEY CLUSTERED
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	END

ALTER TABLE sa.sa_eperusteet_tutkinnonosat ADD  CONSTRAINT DF__sa_eperusteet_tutkinnonosat__loadtime  DEFAULT (getdate()) FOR loadtime
ALTER TABLE sa.sa_eperusteet_tutkinnonosat ADD  CONSTRAINT DF__sa_eperusteet_tutkinnonosat__username  DEFAULT (suser_name()) FOR username

USE ANTERO
