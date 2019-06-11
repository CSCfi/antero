USE [Koski_SA]
GO
/****** Object:  Table [dw].[f_koski_amm_opiskelijavuodet_painotetut]    Script Date: 3.4.2019 13:21:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (
  select * from INFORMATION_SCHEMA.TABLES
  where TABLE_SCHEMA='sa' and TABLE_NAME='sa_eperusteet_suoritustavat'
) BEGIN
DROP TABLE [sa].[sa_eperusteet_suoritustavat]
END

IF NOT EXISTS (
	SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[sa].[sa_eperusteet_suoritustavat]') AND type in (N'U')
	)
BEGIN

CREATE TABLE [sa].[sa_eperusteet_suoritustavat](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
  [eperusteid] [varchar](100) NULL,
	[tutkinto_fi] [varchar](100) NULL,
	[taso] [int] NULL,
	[suoritustapakoodi] [varchar](100) NULL,
	[laajuusyksikko] [varchar](100) NULL,
	[osaamisalakoodi] [int] NULL,
	[osaamisalakoodi_t1] [int] NULL,
	[osaamisalakoodi_t2] [int] NULL,
	[osaamisalakoodi_t3] [int] NULL,
	[osaamisalakoodi_t4] [int] NULL,
	[tutkinnonosa_fi_t1] [varchar](4000) NULL,
	[tutkinnonosa_fi_t2] [varchar](4000) NULL,
	[tutkinnonosa_fi_t3] [varchar](4000) NULL,
	[tutkinnonosa_fi_t4] [varchar](4000) NULL,
	[tutkinnonosa_sv_t1] [varchar](4000) NULL,
	[tutkinnonosa_sv_t2] [varchar](4000) NULL,
	[tutkinnonosa_sv_t3] [varchar](4000) NULL,
	[tutkinnonosa_sv_t4] [varchar](4000) NULL,
	[pakollinen] [bit] NULL,
	[pakollinen_t1] [bit] NULL,
	[pakollinen_t2] [bit] NULL,
	[pakollinen_t3] [bit] NULL,
	[pakollinen_t4] [bit] NULL,
	[minimilaajuus] [int] NULL,
	[maksimilaajuus] [int] NULL,
	[minimilaajuus_t1] [int] NULL,
	[maksimilaajuus_t1] [int] NULL,
	[minimilaajuus_t2] [int] NULL,
	[maksimilaajuus_t2] [int] NULL,
	[minimilaajuus_t3] [int] NULL,
	[maksimilaajuus_t3] [int] NULL,
	[minimilaajuus_t4] [int] NULL,
	[maksimilaajuus_t4] [int] NULL,
	[minimikoko_t1] [int] NULL,
	[maksimikoko_t1] [int] NULL,
	[minimikoko_t2] [int] NULL,
	[maksimikoko_t2] [int] NULL,
	[minimikoko_t3] [int] NULL,
	[maksimikoko_t3] [int] NULL,
	[minimikoko_t4] [int] NULL,
	[maksimikoko_t4] [int] NULL,
	[tunniste] [varchar](100) NULL,
	[osan_tunniste_t1] [varchar](100) NULL,
	[osan_tunniste_t2] [varchar](100) NULL,
	[osan_tunniste_t3] [varchar](100) NULL,
	[osan_tunniste_t4] [varchar](100) NULL,
	[tutkinnonosa_viite_t2] [int] NULL,
	[tutkinnonosa_viite_t3] [int] NULL,
	[tutkinnonosa_viite_t4] [int] NULL,
	[kuvaus] [varchar](max) NULL,
	[username] [varchar](100) NULL,
	[loadtime] [datetime] NULL,
	[source] [varchar](100) NULL
  CONSTRAINT [PK__sa_eperusteet_suoritustavat] PRIMARY KEY CLUSTERED
	(
		[id] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	END

ALTER TABLE sa.sa_eperusteet_suoritustavat ADD  CONSTRAINT DF__sa_eperusteet_suoritustavat__loadtime  DEFAULT (getdate()) FOR loadtime
ALTER TABLE sa.sa_eperusteet_suoritustavat ADD  CONSTRAINT DF__sa_eperusteet_suoritustavat__username  DEFAULT (suser_name()) FOR username

USE ANTERO
