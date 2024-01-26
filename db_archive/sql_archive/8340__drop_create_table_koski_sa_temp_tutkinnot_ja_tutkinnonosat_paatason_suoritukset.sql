USE [Koski_SA]
GO

/****** Object:  Table [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]    Script Date: 29.11.2023 11:57:31 ******/
DROP TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]
GO

/****** Object:  Table [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]    Script Date: 29.11.2023 11:57:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset](
	[toimipiste_oid] [varchar](255) NULL,
	[oppilaitos_oid] [varchar](255) NULL,
	[oppilaitos_oid_pihvi] [varchar](255) NULL,
	[koulutustoimija_oid] [varchar](255) NULL,
	[koulutustoimija_oid_hist] [varchar](255) NULL,
	[koulutustoimija_oid_pihvi] [varchar](255) NULL,
	[koulutustoimija_oid_pihvi_hist] [varchar](255) NULL,
	[opiskeluoikeus_oid] [varchar](100) NULL,
	[ylempi_opiskeluoikeus_oid] [varchar](150) NULL,
	[paatason_suoritus_id] [bigint] NULL,
	[tutkinto_koodi] [varchar](255) NULL,
	[osaamisala_koodiarvo] [varchar](255) NULL,
	[diaarinumero] [varchar](255) NULL,
	[diaarinumero_tutkinto_koodi] [int] NULL,
	[diaarinumero_tutkinto_ja_osaamisala_koodi] [int] NULL,
	[suorituksen_tyyppi] [varchar](250) NULL,
	[suorituskieli_koodiarvo] [nvarchar](10) NULL,
	[kustannusryhma_koodi] [nvarchar](10) NULL,
	[suorittaa_koko_tutkintoa] [int] NOT NULL,
	[tutkintotyyppi_koodi] [varchar](2) NULL,
	[tutkintotyyppi_fi] [nvarchar](60) NULL,
	[koulutusluokitus_fi] [nvarchar](200) NULL,
	[vahvistus_paiva] [datetime] NULL,
	[vahvistus_paiva_muokattu] [datetime] NULL,
	[vahvistus_paiva_muokattu_kuori] [datetime] NULL
) ON [PRIMARY]

GO
