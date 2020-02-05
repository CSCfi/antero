USE [Koski_SA]
GO

/****** Object:  Table [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]    Script Date: 5.2.2020 15:16:23 ******/
DROP TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]
GO

/****** Object:  Table [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset]    Script Date: 5.2.2020 15:16:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [sa].[temp_tutkinnot_ja_tutkinnonosat_paatason_suoritukset](
	[toimipiste_oid] [varchar](max) NULL,
	[oppilaitos_oid] [varchar](max) NULL,
	[koulutustoimija_oid] [varchar](max) NULL,
	[opiskeluoikeus_oid] [varchar](max) NULL,
	[ylempi_opiskeluoikeus_oid] [varchar](max) NULL,
	[paatason_suoritus_id] [bigint] NULL,
	[tutkinto_koodi] [varchar](max) NULL,
	[osaamisala_koodiarvo] [int] NULL,
	[tutkinto_ja_osaamisala_koodi] [int] NULL,
	[eper_tutkinto_ja_osaamisala_koodi] [varchar](41) NULL,
	[diaarinumero] [varchar](max) NULL,
	[diaarinumero_tutkinto_koodi] [int] NULL,
	[diaarinumero_tutkinto_ja_osaamisala_koodi] [int] NULL,
	[suorituksen_tyyppi] [varchar](max) NULL,
	[kustannusryhma_koodi] [varchar](10) NULL,
	[alkup_kustannusryhmakoodi] [varchar](10) NULL,
	[suorittaa_koko_tutkintoa] [int] NOT NULL,
	[tutkintotyyppi_koodi] [varchar](2) NULL,
	[tutkintotyyppi_fi] [nvarchar](60) NULL,
	[koulutusluokitus_fi] [nvarchar](200) NULL,
	[vahvistus_paiva] [datetime] NULL,
	[vahvistus_paiva_muokattu] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


USE [ANTERO]