USE [Koski_SA]
GO
/****** Object:  Table [dw].[f_koski_amm_opiskelijavuodet_painotetut]    Script Date: 3.4.2019 13:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_eperusteet'
) BEGIN
DROP TABLE [sa].[sa_eperusteet]
END

IF NOT EXISTS (
	SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_eperusteet]') AND type in (N'U')
	)
BEGIN

CREATE TABLE [sa].[sa_eperusteet](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[eperusteid] [int],
	[diaarinumero] [varchar](100) NULL,
	[koulutukset] [varchar](1000) NULL,
	[tutkintokoodi] [varchar](10) NULL,
	[koulutustyyppi] [varchar](100) NULL,
	[koulutusvienti] [bit] NULL,
	[luotu] [datetime] NULL,
	[muokattu] [datetime] NULL,
	[nimi_id] [int] NULL,
	[nimi_tunniste] [varchar](1000) NULL,
	[nimi_fi] [varchar](1000) NULL,
	[nimi_sv] [varchar](1000) NULL,
	[nimi_en] [varchar](1000) NULL,
	[paatospvm] [datetime] NULL,
	[siirtymapaattyy] [datetime] NULL,
	[tila] [varchar](100) NULL,
	[tyyppi] [varchar](100) NULL,
	[voimassaoloalkaa] [datetime] NULL,
	[voimassaololoppuu] [datetime] NULL,
	[source] [varchar](500) NULL,
	[loadtime] [datetime] NULL,
	[username] [varchar](30) NULL,
	CONSTRAINT [PK__sa_eperusteet] PRIMARY KEY CLUSTERED
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	END

ALTER TABLE sa.sa_eperusteet ADD  CONSTRAINT DF__sa_eperusteet__loadtime  DEFAULT (getdate()) FOR loadtime
ALTER TABLE sa.sa_eperusteet ADD  CONSTRAINT DF__sa_eperusteet__username  DEFAULT (suser_name()) FOR username

USE ANTERO
